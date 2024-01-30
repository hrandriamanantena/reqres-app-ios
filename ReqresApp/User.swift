//
//  User.swift
//  ReqresApp
//
//  Created by r.n. hermann on 30/01/2024.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let email: String
    let firstName: String
    let lastName: String
    let avatar: String
}

struct UsersResponse: Codable {
    let page: Int
    let perPage: Int
    let total: Int
    let totalPages: Int
    let data: [User]
}
