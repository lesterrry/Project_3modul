//
//  ProfileModel.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 09.05.2025.
//

import SwiftUI

struct UserProfile: Identifiable, Codable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var description: String
    //var avatar: Data
}

// MARK: - AuthorModel
struct ProfileAuthorModel: Codable {
    let id: Int
    let username: String?
    let email: String
    let createdAt, updatedAt: String
//    let isAdmin: Bool

    enum CodingKeys: String, CodingKey {
        case id, username
        case email
        case createdAt = "created_at"
        case updatedAt = "updated_at"
//        case isAdmin = "is_admin"
    }
}

