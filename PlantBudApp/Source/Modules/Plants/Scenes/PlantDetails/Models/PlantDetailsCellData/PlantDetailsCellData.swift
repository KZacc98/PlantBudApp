//
//  PlantDetailsCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 25/12/2022.
//

import Foundation

struct PlantDetailsCellData: Equatable {
    static func == (lhs: PlantDetailsCellData, rhs: PlantDetailsCellData) -> Bool {
        if lhs.imageUrl == rhs.imageUrl &&
            lhs.plantName == rhs.plantName {
            return true
        } else {
            return false
        }
    }
    
    let imageUrl: URL
    let plantName: String
    let plantState: PlantState
    let plantType: PlantTypeDomain
    let didTapPlant: (() -> Void)?
    
    init(imageUrl: URL, plantName: String, plantState: PlantState, plantType: PlantTypeDomain, didTapPlant: (() -> Void)?) {
        self.imageUrl = imageUrl
        self.plantName = plantName
        self.plantState = plantState
        self.plantType = plantType
        self.didTapPlant = didTapPlant
    }
}
