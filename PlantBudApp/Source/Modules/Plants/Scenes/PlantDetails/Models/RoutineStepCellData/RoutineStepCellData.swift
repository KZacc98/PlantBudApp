//
//  RoutineStepCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/12/2022.
//

struct RoutineStepCellData {
    let step: RoutineStepDomain
    let didPressCheckbox: (() -> Void)?
    let didHoldCell: (() -> Void)?
    
    init(step: RoutineStepDomain,
         didPressCheckbox: (() -> Void)?,
         didHoldCell: (() -> Void)?
    ) {
        self.step = step
        self.didPressCheckbox = didPressCheckbox
        self.didHoldCell = didHoldCell

    }
}
