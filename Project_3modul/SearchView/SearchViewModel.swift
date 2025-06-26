//
//  SearchViewModel.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 21.05.2025.
//

import SwiftUI

final class SearchViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    let worker = BaseURLWorker(baseUrl: "https://lapse.aydar.media")
    
    func search(
        for text: String
    ) {
            guard let token = KeychainService().getString(forKey: "token") else {
                return
            }
            
            let endp = TimelineEndpoint.timelines(token: token)
            let req = Request(endpoint: endp)
        
        
            worker.executeRequest(with: req) { result in
                switch result {
                case .success(let resp):
                    if let data = resp.data {
                        do {
                            let decodedData = try JSONDecoder().decode([DonutModel].self, from: data)
                            DispatchQueue.main.async {
                                print(decodedData)
                            }
                        } catch {
                            print("Decoding error: \(error)")
                        }
                    }
                case .failure(let error):
                    print("Request error: \(error)")
                }
            }
    }
}


