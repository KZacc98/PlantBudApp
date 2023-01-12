//
//  PostDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import Foundation

struct PostDomain{
    let id: Int
    let communityId: Int
    let image: String
    let userName: String
    let postBody: String
    let isAnnouncement: Bool
    let points: Int
    let flag: UserContentFlag
    let createdAt: String
    let updatedAt: String
    
    init(remote: PostRemote) {
        self.id = remote.id
        self.communityId = remote.communityId
        self.image = remote.image ?? ""
        self.userName = remote.userName
        self.postBody = remote.postBody ?? ""
        self.isAnnouncement = remote.isAnnouncement
        self.points = remote.points
        self.flag = UserContentFlag(rawValue: remote.flag) ?? .default
        self.createdAt = remote.createdAt ?? ""
        self.updatedAt = remote.updatedAt ?? ""
    }
    
    init(domain: PostDomain, points: Int) {
        self.id = domain.id
        self.communityId = domain.communityId
        self.image = domain.image
        self.userName = domain.userName
        self.postBody = domain.postBody
        self.isAnnouncement = domain.isAnnouncement
        self.points = points
        self.flag =  domain.flag
        self.createdAt = domain.createdAt
        self.updatedAt = domain.updatedAt
    }
}


