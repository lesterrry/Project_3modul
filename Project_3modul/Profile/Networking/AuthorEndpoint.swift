//
//  AuthorEndpoint.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 28.05.2025.
//

enum AuthorEndpoint: Endpoint {
    case data(id: Int, token: String)
    
    var compositePath: String {
        switch self {
        case .data(let id, _):
            return "/api/users/\(id)"
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .data(_, let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
