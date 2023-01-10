//
//  CommunityUserDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import Foundation

struct CommunityUserDomain {
    let userId: Int
    let createdAt: String
    let updatedAt: String
    
    init(remote: CommunityUserRemote) {
        self.userId = remote.userId
        self.createdAt = remote.createdAt ?? ""
        self.updatedAt = remote.updatedAt ?? ""
    }
}
