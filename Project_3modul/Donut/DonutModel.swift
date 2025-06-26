//
//  TestDonutModel.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 11.03.2025.
//

import Foundation

struct DonutModel: Codable {
    let id: Int
    let title, description: String
//    let userID: Int
    let createdAt, updatedAt: String?
    let periods: [Period]
}

struct TimelineModel: Codable {
    let id: Int
    let title, description: String
    let userID: Int
    let createdAt, updatedAt: String
    let startPoint, finishPoint: String?
    enum CodingKeys: String, CodingKey {
        case id, title, description
        case userID = "user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case startPoint = "start_point"
        case finishPoint = "finish_point"
    }
}
