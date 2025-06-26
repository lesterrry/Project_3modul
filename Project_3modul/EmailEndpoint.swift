//
//  EmailEndpoint.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 25.06.2025.
//

enum EmailEndpoint: Endpoint {
    case subscribe(token: String)
    var compositePath: String {
        switch self {
        case .subscribe:
            return "/api/subscribe"
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .subscribe(let token):
            return [
                "Authorization": "Bearer \(token)",
                
            ]
        }
    }
   
}
