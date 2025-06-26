//
//  AuthorWorker.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 28.05.2025.
//

import SwiftUI

final class AuthorViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var fullName: String = "Loading"
    
    private let decoder = JSONDecoder()
    private let worker = BaseURLWorker(baseUrl: "https://lapse.aydar.media")
    
    func fetchAuthor(with id: Int) {
        isLoading = true
        errorMessage = nil

        guard let token = KeychainService().getString(forKey: "token") else {
            return
        }
        
        let endp = AuthorEndpoint.data(id: id, token: token)
        let req = Request(endpoint: endp)
        
        worker.executeRequest(with: req) { [weak self] result in
            defer {
                DispatchQueue.main.async {
                    self?.isLoading = false
                }
            }
            switch result {
            case .success(let resp):
                if let data = resp.data {
                    do {
                        let decodedData = try JSONDecoder().decode(ProfileAuthorModel.self, from: data)
                        DispatchQueue.main.async {
                            print(decodedData)
                            self?.fullName = (decodedData.username ?? "Anonimous")
//                            self.posts = decodedData.map { donut in
//                                Post(
//                                    id: donut.id,
//                                    title: donut.title,
//                                    images: [],
//                                    circleTextTop: "Top",
//                                    circleTextBottom: "Bottom",
//                                    userImage: "",
//                                    userName: "",
//                                    userFollowers: "202020",
//                                    likesCount: "101010",
//                                    commentsCount: "303030"
//                                )
//                            }
                        }
                    } catch {
                        self?.errorMessage = "Decoding error: \(error)"
                    }
                }
            case .failure(let error):
                self?.errorMessage = "Request error: \(error)"
            }
        }
    }
}
