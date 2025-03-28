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
