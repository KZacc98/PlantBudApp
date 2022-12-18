//
//  UserDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/12/2022.
//

import Foundation


struct UserDomain {
    let id: Int
    let name: String
    let userName: String
    let email: String
    let gender: Gender
    let phoneNumber: String
    let points: Int
    let active: Bool
    let userType: UserType
    let createdAt: String
    let updatedAt: String
    
    init(remote: UserRemote) {
        self.id = remote.id
        self.name = remote.name
        self.userName = remote.userName
        self.email = remote.email
        self.gender = Gender(rawValue: remote.gender) ?? .preferNotToTell
        self.phoneNumber = remote.phoneNumber ?? ""
        self.points = remote.points
        self.active = remote.active
        self.userType = UserType(rawValue: remote.userType) ?? .user
        self.createdAt = remote.createdAt ?? ""
        self.updatedAt = remote.updatedAt ?? ""
    }
}

enum Gender: String, Codable {
    case male = "male"
    case female = "female"
    case other = "other"
    case preferNotToTell = "preferNotToTell"
}

enum UserType: String, Codable {
    case user = "user"
    case admin = "admin"
}

