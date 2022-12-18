//
//  UserRemote.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/12/2022.
//

import Foundation

struct UserRemote: Codable {
    let id: Int
    let name: String
    let userName: String
    let email: String
    let gender: String
    let phoneNumber: String?
    let points: Int
    let active: Bool
    let userType: String
    let createdAt: String?
    let updatedAt: String?
}

