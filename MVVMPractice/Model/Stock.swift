//
//  Stock.swift
//  MVVMPractice
//
//  Created by shruti Mittal on 7/13/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//


import Foundation

// MARK: - Stock
struct Stock: Decodable {
    let ok: Bool
    let users: [User]
}

// MARK: - User
struct User: Decodable {
    let avatarUrl: String
    let displayName: String
    let id: Int
    let username: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case displayName = "display_name"
        case id, username
    }
}


