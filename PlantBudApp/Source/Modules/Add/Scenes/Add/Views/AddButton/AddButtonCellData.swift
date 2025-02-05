//
//  AddButtonCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/02/2025.
//

struct AddButtonCellData {
    let SFSymbolName: String
    let buttonName: String
    let didPressButton: (() -> Void)?
    
    init(SFSymbolName: String, buttonName: String, didPressButton: (() -> Void)?) {
        self.SFSymbolName = SFSymbolName
        self.buttonName = buttonName
        self.didPressButton = didPressButton
    }
}
