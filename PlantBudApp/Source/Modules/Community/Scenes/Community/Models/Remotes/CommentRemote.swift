//
//  CommentRemote.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/01/2023.
//

import Foundation

struct CommentRemote {
    let id: Int
    let postId: Int
    let userName: String
    let commentBody: String
    let image: String?
    let points: Int
    let flag: String
    let createdAt: String?
    let updatedAt: String?
}
