//
//  PlantTypeCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import Foundation

struct PlantTypeCellData {
    let imageUrl: URL
    let plantType: PlantTypeDomain
    let didTapPlantType: (() -> Void)?
    
    init(imageUrl: URL, plantType: PlantTypeDomain, didTapPlantType: (() -> Void)?) {
        self.imageUrl = imageUrl
        self.plantType = plantType
        self.didTapPlantType = didTapPlantType
    }
}
