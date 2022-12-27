//
//  RoutineStepCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/12/2022.
//

struct RoutineStepCellData {
    let title: String
    let didPressCheckbox: (() -> Void)?
    let check: Bool
    
    init(title: String, didPressCheckbox: (() -> Void)?, check: Bool) {
        self.title = title
        self.didPressCheckbox = didPressCheckbox
        self.check = check
    }
}
