//
//  MainButtonCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

struct MainButtonCellData {
    let title: String
    let buttonInsets: UIEdgeInsets
    var isEnabled: Bool
    let backgroundColor: UIColor
    var didPressButton: (() -> ())?
    var refreshButtonState: (() -> ())?
    var startLoading: (() -> ())?
    var stopLoading: (() -> ())?
    
    init(title: String,
         buttonInsets: UIEdgeInsets,
         isEnabled: Bool = true,
         backgroundColor: UIColor = Color.brandWhite,
         didPressButton: (() -> ())?,
         refreshButtonState: (() -> ())? = nil,
         startLoading: (() -> ())? = nil,
         stopLoading: (() -> ())? = nil) {
        
        self.title = title
        self.buttonInsets = buttonInsets
        self.isEnabled = isEnabled
        self.backgroundColor = backgroundColor
        self.didPressButton = didPressButton
        self.refreshButtonState = refreshButtonState
        self.startLoading = startLoading
        self.stopLoading = stopLoading
    }
}

