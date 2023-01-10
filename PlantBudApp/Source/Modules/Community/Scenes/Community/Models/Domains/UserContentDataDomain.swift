//
//  UserContentDataDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/01/2023.
//

import Foundation

struct UserContentDataDomain {
    let userName: String
//    let userType: UserType
//    let profilePicture: String?
//    
    init(remote: UserContentDataRemote) {
        self.userName = remote.userName
//        self.userType = UserType(rawValue: remote.userType) ?? .user
//        self.profilePicture = remote.profilePicture
    }
}
