//
//  Plant.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 16/12/2022.
//

struct Plant {
    let plantData: PlantDomain
    let plantTypeData: PlantTypeDomain
    let plantCareRoutineId: Int?
    
    init(plantData: PlantDomain, plantTypeData: PlantTypeDomain, plantCareRoutineId: Int? = nil) {
        self.plantData = plantData
        self.plantTypeData = plantTypeData
        self.plantCareRoutineId = plantCareRoutineId
    }
}
