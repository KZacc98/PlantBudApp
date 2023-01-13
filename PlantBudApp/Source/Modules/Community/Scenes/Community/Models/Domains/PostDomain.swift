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
    let createdAt: Date
    let updatedAt: String
    
    init(remote: PostRemote) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        self.id = remote.id
        self.communityId = remote.communityId
        self.image = remote.image ?? ""
        self.userName = remote.userName
        self.postBody = remote.postBody ?? ""
        self.isAnnouncement = remote.isAnnouncement
        self.points = remote.points
        self.flag = UserContentFlag(rawValue: remote.flag) ?? .default
        self.createdAt = dateFormatter.date(from: remote.createdAt ?? "2020-01-10T20:51:20.851") ?? Date()
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


