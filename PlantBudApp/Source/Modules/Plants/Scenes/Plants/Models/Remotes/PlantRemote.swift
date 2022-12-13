//
//  PlantRemote.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/12/2022.
//

struct PlantRemote: Codable {
    let id: Int
    let plantName: String
    let plantState: String
    let plantPlacement: String
    let plantImage: String?
    let plantTypeId: Int
    let createdAt: String
    let updatedAt: String?
}
