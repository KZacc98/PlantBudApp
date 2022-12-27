//
//  BadgeDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 18/12/2022.
//

struct BadgeDomain: Codable {
    let id: Int
    let badgeName: String
    let points: Int
    let createdAt: String
    let updatedAt: String
    
    init(remote: BadgeRemote) {
        self.id = remote.id
        self.badgeName = remote.badgeName
        self.points = remote.points
        self.createdAt = remote.createdAt
        self.updatedAt = remote.updatedAt
    }
}
