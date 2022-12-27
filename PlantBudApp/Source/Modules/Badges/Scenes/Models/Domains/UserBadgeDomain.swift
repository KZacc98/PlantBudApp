//
//  UserBadgeDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 18/12/2022.
//

struct UserBadgeDomain: Codable {
    let userId: Int
    let badgeId: Int
    let createdAt: String
    let updatedAt: String
    
    init(remote: UserBadgeRemote) {
        self.userId = remote.userId
        self.badgeId = remote.badgeId
        self.createdAt = remote.createdAt
        self.updatedAt = remote.updatedAt
    }
}
