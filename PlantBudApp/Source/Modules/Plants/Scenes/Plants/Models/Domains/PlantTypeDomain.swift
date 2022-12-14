//
//  PlantTypeDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 11/12/2022.
//

struct PlantTypeDomain {
    let id: Int
    let species: String
    let description: String
    let type: String
    let createdAt: String?
    
    init(remote: PlantTypeRemote) {
        self.id = remote.id
        self.species = remote.species ?? ""
        self.description = remote.description ?? ""
        self.type = remote.type ?? ""
        self.createdAt = remote.createdAt
    }
}
