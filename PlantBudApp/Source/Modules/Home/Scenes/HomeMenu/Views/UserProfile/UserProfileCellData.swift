//
//  UserProfileCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/02/2025.
//

struct UserProfileCellData {
    let name: String
    let plantCount: String
    let profilePictureUrl: String
    
    init(name: String,
         plantCount: String,
         profilePictureUrl: String?) {
        let placeholder = "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541"
        
        self.name = name
        self.plantCount = plantCount
        self.profilePictureUrl = profilePictureUrl ?? placeholder
    }
}
