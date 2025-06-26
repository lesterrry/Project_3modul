//
//  UserInfoViewModel.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 25.06.2025.
//


import SwiftUI

final class UserInfoViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var fullName: String = "Loading"
    @Published var isLiked: Bool = false
    
    private let userID: Int
    private let lifetime: Int
    private let decoder = JSONDecoder()
    private let worker = BaseURLWorker(baseUrl: "https://lapse.aydar.media")
    
    init(userID: Int, lifetime: Int) {
        self.userID = userID
        self.lifetime = lifetime
    }
    
    func loadLike() {
        guard let token = KeychainService().getString(forKey: "token") else {
            return
        }
        
        let endp = LikeEndpoint.like(token: token, lifetime: lifetime)
        let req = Request(endpoint: endp, method: .post)
        worker.executeRequest(with: req) {_ in}
        isLiked = true
    }
    func unlike() {
        guard let token = KeychainService().getString(forKey: "token") else {
            return
        }
        
        let endp = LikeEndpoint.like(token: token, lifetime: lifetime)
        let req = Request(endpoint: endp, method: .delete)
        worker.executeRequest(with: req) {_ in}
        isLiked = false
    }
}
