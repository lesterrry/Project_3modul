//
//  TimelineModel.swift
//  Project_3modul
//
//  Created by MacBook - Latter on 03.03.2025.
//

//import Foundation
import SwiftUI
//
//struct Post: Hashable {
//    
//    let title: String
//    let othericon: Image
//    let image1: Image
//    let image2: Image
//    let othericon: Image
//    
//}

struct Post: Identifiable {
    let id = UUID()
    let title: String
    let images: [String]
    let circleTextTop: String
    let circleTextBottom: String
    let userImage: String
    let userName: String
    let userFollowers: String
    let likesCount: String
    let commentsCount: String
}
