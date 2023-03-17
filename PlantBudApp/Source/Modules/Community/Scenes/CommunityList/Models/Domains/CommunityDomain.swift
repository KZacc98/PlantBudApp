//
//  CommunityDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import Foundation

struct CommunityDomain {
    let id: Int
    let communityName: String
    let communityDescription: String
    let communitySmallImage: String
    let communityBigImage: String
    let isActive: Bool
    let createdAt: String
    let updatedAt: String
    
    init(remote: CommunityRemote) {
        self.id = remote.id
        self.communityName = remote.communityName
        self.communityDescription = remote.communityDescription
        self.communitySmallImage = remote.communitySmallImage
        self.communityBigImage = remote.communityBigImage
        self.isActive = remote.isActive
        self.createdAt = remote.createdAt ?? ""
        self.updatedAt = remote.updatedAt ?? ""
    }
}
