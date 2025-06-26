//
//  RegistrationModel.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 05.03.2025.
//

import Foundation

enum Signup {
    struct Request: Encodable {
//        var username: String
        var email: String
        var password: String
    }

    struct Response: Decodable {
        let token: String
        let user: User
    }
    
    struct User: Decodable {
        let id: Int
    }
}



final class SignupViewModel: ObservableObject {
    enum Const {
        static let tokenKey = "token"
    }

    @Published var username: String = ""
    @Published var gotToken: Bool = KeychainService().getString(forKey: Const.tokenKey)?.isEmpty == false

    private var worker = SignupWorker()
    private var keychain = KeychainService()

    func signup(
        email: String,
        password: String
    ) {
        let endpoint = SignupEndpoint.signup(email: email, password: password)
        
        let request = Request(endpoint: endpoint, method: .post)
        worker.load(request: request) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                if let data {
                    print(String(data: data, encoding: .utf8) ?? "")
                }
                guard
                    let data,
                    let response = try? JSONDecoder().decode(Signup.Response.self, from: data)
                else {
                    print("failed to get token")
                    return
                }
                
                let token = response.token
                self?.keychain.setString(token, forKey: Const.tokenKey)
                DispatchQueue.main.async {
                    self?.gotToken = true
                    
                }
            }
        }
    }
}

enum SignupEndpoint: Endpoint {
    case signup(email: String, password: String)

    var rawValue: String {
        switch self {
        case .signup:
            return "signup"
        }
    }

    var compositePath: String {
        return "/api/\(self.rawValue)"
    }

    var headers: [String: String] {
        switch self {
        default: ["Content-Type": "application/x-www-form-urlencoded"]
        }

    }
    
    var parameters: [String : String]? {
        switch self {
        case .signup(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        }
    }
}

final class SignupWorker {
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

