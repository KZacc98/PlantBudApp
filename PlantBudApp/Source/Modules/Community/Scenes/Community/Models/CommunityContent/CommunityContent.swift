//
//  CommunityContent.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import Foundation

struct CommunityContent {
    let community: CommunityDomain
    let communityUsers: [CommunityUserDomain]
    let posts: [PostDomain]
    let comments: [CommentDomain]
}
