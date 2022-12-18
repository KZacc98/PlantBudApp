//
//  PlantCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/12/2022.
//

import Foundation

struct PlantCellData {
    let imageUrl: URL
    let plantName: String
    let plantState: PlantState
    let didTapPlant: (() -> Void)?
    
    init(imageUrl: URL, plantName: String, plantState: PlantState, didTapPlant: (() -> Void)?) {
        self.imageUrl = imageUrl
        self.plantName = plantName
        self.plantState = plantState
        self.didTapPlant = didTapPlant
    }
}
