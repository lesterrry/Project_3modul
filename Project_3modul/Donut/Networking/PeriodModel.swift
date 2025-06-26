//
//  Period.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 21.05.2025.
//

import Foundation

struct Period: Codable {
    let id, lifetimeID: Int
    let start, end, title, description: String
    let colorHex: String?
    let createdAt, updatedAt: String
     
    enum CodingKeys: String, CodingKey {
        case id
        case lifetimeID = "lifetime_id"
        case start, end, title, description
        case colorHex = "color_hex"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    var duration: TimeInterval {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        var startDate = formatter.date(from: start) ?? Date()
        var endDate = formatter.date(from: end) ?? Date()
        
        return startDate.timeIntervalSince(endDate)
    }
}
