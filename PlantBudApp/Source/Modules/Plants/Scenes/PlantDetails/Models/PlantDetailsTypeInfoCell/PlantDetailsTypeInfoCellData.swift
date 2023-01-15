//
//  PlantDetailsTypeInfoCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 14/01/2023.
//

import Foundation

struct PlantDetailsTypeInfoCellData: Equatable {
    static func == (lhs: PlantDetailsTypeInfoCellData, rhs: PlantDetailsTypeInfoCellData) -> Bool {
        if lhs.imageUrl == rhs.imageUrl &&
            lhs.plantType.description == rhs.plantType.description {
            return true
        } else {
            return false
        }
    }
    
    let imageUrl: URL
    let plantType: PlantTypeDomain
    let didTapPlant: (() -> Void)?
    
    init(imageUrl: URL, plantType: PlantTypeDomain, didTapPlant: (() -> Void)?) {
        self.imageUrl = imageUrl
        self.plantType = plantType
        self.didTapPlant = didTapPlant
    }
}
