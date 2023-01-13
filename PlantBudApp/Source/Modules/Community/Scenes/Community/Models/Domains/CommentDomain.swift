//
//  CommentDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/01/2023.
//

import Foundation

struct CommentDomain {
    let id: Int
    let postId: Int
    let userName: String
    let commentBody: String
    let image: String?
    let points: Int
    let flag: UserContentFlag
    let createdAt: Date?
    let updatedAt: String?
    
    init(remote: CommentRemote) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        self.id = remote.id
        self.postId = remote.postId
        self.userName = remote.userName
        self.commentBody = remote.commentBody
        self.image = remote.image
        self.points = remote.points
        self.flag = UserContentFlag(rawValue: remote.flag) ?? .default
        self.createdAt = dateFormatter.date(from: remote.createdAt ?? "2020-01-10T20:51:20.851")
        Logger.error("\(remote.createdAt)")
        self.updatedAt = remote.updatedAt
    }
}

