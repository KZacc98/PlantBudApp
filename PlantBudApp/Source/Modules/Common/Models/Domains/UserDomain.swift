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
    let profilePicture: String
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
        self.profilePicture = remote.profilePicture ?? "https://pbs.twimg.com/media/DcRh4f7XcAAa3D-?format=jpg&name=360x360"
        self.email = remote.email
        self.gender = Gender(rawValue: remote.gender) ?? .preferNotToTell
        self.phoneNumber = remote.phoneNumber ?? ""
        self.points = remote.points
        self.active = remote.active
        self.userType = UserType(rawValue: remote.userType) ?? .user
        self.createdAt = remote.createdAt ?? ""
        self.updatedAt = remote.updatedAt ?? ""
    }
    init(id: Int, name: String, userName: String, profilePicture: String, email: String, gender: Gender, phoneNumber: String, points: Int, active: Bool, userType: UserType, createdAt: String, updatedAt: String) {
        self.id = id
        self.name = name
        self.userName = userName
        self.profilePicture = profilePicture
        self.email = email
        self.gender = gender
        self.phoneNumber = phoneNumber
        self.points = points
        self.active = active
        self.userType = userType
        self.createdAt = createdAt
        self.updatedAt = updatedAt
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

