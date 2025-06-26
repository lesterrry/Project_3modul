//
//  LogInModel.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 04.03.2025.
//


import Foundation

enum Signin {
    struct Request: Encodable {
//        var authenticity_token: String = "RZsvmojDXneJQEtHbSyAeZUrrhwEjPd2sbIKI49EYpXrIVzuvFgf5rsJk1xYskhjzRPbgSnbIAus_r-tdaeFqw"
        var email: String
        var password: String
//        var remember_me: Int = 0
    }

    struct Response: Decodable {
        let token: String
        let user: User
    }
    
    struct User: Decodable {
        let id: Int
    }
}

final class ViewModel: ObservableObject {
    enum Const {
        static let idKey = "userID"
        static let tokenKey = "token"
    }

    @Published var username: String = ""
    @Published var gotToken: Bool = KeychainService().getString(forKey: Const.tokenKey)?.isEmpty == false

    private var worker = AuthWorker()
    private var keychain = KeychainService()

    func signin(
        email: String,
        password: String
    ) {
        let endpoint = AuthEndpoint.signup(email: email, password: password)
        let requestData = Signup.Request(
            email: email,
            password: password
        )

        let body = try? JSONEncoder().encode(requestData)
        let request = Request(endpoint: endpoint, method: .post, body: body)
        worker.load(request: request) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                if
                    let data,
                    let response = try? JSONDecoder().decode(Signup.Response.self, from: data)
                {
                    self?.keychain.setString(response.token, forKey: Const.tokenKey)
                    self?.keychain.setString("\(response.user.id)", forKey: Const.idKey)
                    DispatchQueue.main.async {
                        self?.gotToken = true
                    }
                }

                print("failed to get token") // тут проблемка, конкретная кстати
            }
        }
    }

    func signIn(
        login: String,
        password: String
    ) {
        let endpoint = AuthEndpoint.signin(email: login, password: password)
//        let requestData = Signin.Request(
//            email: login,
//            password: password
//        )

//        let body = try? JSONEncoder().encode(requestData)
        let request = Request(endpoint: endpoint, method: .post)
        worker.load(request: request) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                guard
                    let data,
                    let response = try? JSONDecoder().decode(Signin.Response.self, from: data)
                else {
                    print("failed to get token")
                    return
                }
                
                let token = response.token
                self?.keychain.setString(token, forKey: Const.tokenKey)
                self?.keychain.setString("\(response.user.id)", forKey: Const.idKey)
                DispatchQueue.main.async {
                    self?.gotToken = true
                    
                }
            }
        }
    }
 
    func getUsers() {
        let token = keychain.getString(forKey: Const.tokenKey) ?? ""
        let request = Request(endpoint: AuthEndpoint.users(token: token))
        worker.load(request: request) { result in
            switch result {
            case .failure(_):
                print("error")
            case .success(let data):
                guard let data else {
                    print("error")
                    return
                }
                print(String(data: data, encoding: .utf8))
            }
        }
    }
}

enum AuthEndpoint: Endpoint {
    case signup(email: String, password: String)
    case signin(email: String, password: String)
    case users(token: String)

    var rawValue: String {
        switch self {
        case .signup:
            return "signup"
        case .signin:
            return "login"
        case .users:
            return "posts"
        }
    }

    var compositePath: String {
        return "/api/\(self.rawValue)"
    }

    var headers: [String: String] {
        switch self {
        case .users(let token): ["Authorization": "Bearer \(token)"]
        default: ["Content-Type": "application/x-www-form-urlencoded"]
        }

    }
    
    var parameters: [String : String]? {
        switch self {
        case .signup(let email, let password), .signin(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        case .users:
            return nil
        }
    }
}

final class AuthWorker {
    let worker = BaseURLWorker(baseUrl: "https://lapse.aydar.media")

    func load(request: Request, completion: @escaping (Result<Data?, Error>) -> Void) {
        worker.executeRequest(with: request) { response in
            switch response {
            case .failure(let error):
                completion(.failure(error))
            case .success(let result):
                completion(.success(result.data))
            }
        }
    }
}

