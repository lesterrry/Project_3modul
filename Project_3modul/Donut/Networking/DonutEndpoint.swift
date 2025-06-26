//
//  DonutEndpoint.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 21.05.2025.
//

enum DonutEndpoint: Endpoint {
    case donut(number: Int, token: String)
    
    var compositePath: String {
        switch self {
        case .donut(let number, _):
            return "/api/lifetimes/\(number)"
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .donut(_, let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}

enum TimelineEndpoint: Endpoint {
    case timelines(token: String)
    
    var compositePath: String {
        switch self {
        case .timelines(_):
            return "/api/users/1/lifetimes"
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .timelines(let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}
