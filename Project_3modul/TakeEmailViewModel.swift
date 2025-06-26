//
//  TakeEmailViewModel.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 25.06.2025.
//

import SwiftUI


final class TakeEmailViewModel: ObservableObject {
    @Published var isSubscribed: Bool = false
    
    @Published var email: String = ""
    private let decoder = JSONDecoder()
    private let worker = BaseURLWorker(baseUrl: "https://lapse.aydar.media")
    
    func subscribe() {
        guard let token = KeychainService().getString(forKey: "token") else {
            return
        }
        let data = try? JSONEncoder().encode(["email": email])
        let endp = EmailEndpoint.subscribe(token: token)
        let req = Request(endpoint: endp, method: .post, body: data)
        worker.executeRequest(with: req) {_ in}
        isSubscribed = true
    }
}
