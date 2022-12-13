//
//  PlantDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/12/2022.
//

struct PlantDomain {
    let id: Int
    let plantName: String
    let plantState: PlantState
    let plantPlacement: PlantPlacement
    let plantImage: String
    let plantTypeId: Int
    let createdAt: String
    let updatedAt: String
    
    init(remote: PlantRemote) {
        self.id = remote.id
        self.plantName = remote.plantName
        self.plantState = PlantState(rawValue: remote.plantState) ?? .default
        self.plantPlacement = PlantPlacement(rawValue: remote.plantPlacement) ?? .default
        self.plantImage = remote.plantImage ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
        self.plantTypeId = remote.plantTypeId
        self.createdAt = remote.createdAt
        self.updatedAt = remote.updatedAt ?? ""
    }
}

enum PlantState: String, Codable {
    case thriving = "thriving"
    case good = "good"
    case needsAttention = "needsAttention"
    case thirsty = "thirsty"
    case forgotten = "forgotten"
    case dead = "dead"
    case `default`
}

enum PlantPlacement: String, Codable {
    case inside = "inside"
    case outside = "outside"
    case `default`
}
