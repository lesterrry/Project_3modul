//
//  LikeEndpoint.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 25.06.2025.
//


enum LikeEndpoint: Endpoint {
    case like(token: String, lifetime: Int)
    var compositePath: String {
        switch self {
        case .like(_, let lifetime):
            return "/api/lifetimes/\(lifetime)/like"
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .like(let token, _):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
