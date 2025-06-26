//
//  MainViewModel.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 21.05.2025.
//

import SwiftUI

class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let decoder = JSONDecoder()
    private let worker = BaseURLWorker(baseUrl: "https://lapse.aydar.media")

    func fetchPosts() {
        isLoading = true
        errorMessage = nil

        guard let token = KeychainService().getString(forKey: "token") else {
            return
        }
        
        print("+++", token) 
        
        let endp = TimelineEndpoint.timelines(token: token)
        let req = Request(endpoint: endp)
        
        worker.executeRequest(with: req) { result in
            defer {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
            switch result {
            case .success(let resp):
                if let data = resp.data {
                    do {
                        let decodedData = try JSONDecoder().decode([TimelineModel].self, from: data)
                        DispatchQueue.main.async {
                            print(decodedData)
                            self.posts = decodedData.map { donut in
                                Post(
                                    id: donut.id,
                                    title: donut.title,
                                    images: [],
                                    circleTextTop: donut.startPoint ?? "",
                                    circleTextBottom: donut.finishPoint ?? "",
                                    userImage: "",
                                    userName: "",
                                    userFollowers: "202020",
                                    likesCount: "101010",
                                    commentsCount: "303030"
                                )
                            }
                        }
                    } catch {
                        self.errorMessage = "Decoding error: \(error)"
                    }
                }
            case .failure(let error):
                self.errorMessage = "Request error: \(error)"
            }
        }
    }
}
