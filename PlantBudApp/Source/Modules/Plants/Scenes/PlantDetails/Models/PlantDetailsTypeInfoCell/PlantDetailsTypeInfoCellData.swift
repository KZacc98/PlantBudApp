//
//  PlantDetailsTypeInfoCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/12/2022.
//

import Foundation

struct PlantDetailsTypeInfoCellData {
    let imageUrl: URL
    let plantType: PlantTypeDomain
    let didTapPlant: (() -> Void)?
    
    init(imageUrl: URL, plantType: PlantTypeDomain, didTapPlant: (() -> Void)?) {
        self.imageUrl = imageUrl
        self.plantType = plantType
        self.didTapPlant = didTapPlant
    }
}
