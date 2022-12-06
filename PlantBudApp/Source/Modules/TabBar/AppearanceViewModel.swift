//
//  AppearanceViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

final class AppearanceViewModel {
    
    //MARK: - Binding closures
    
    public var onUserPanelDownload: (() -> ())?
    
    //MARK: - Private properties
    
    
    //MARK: - Access methods
    
    public func loadData() {
            self.onUserPanelDownload?()

    }

}
