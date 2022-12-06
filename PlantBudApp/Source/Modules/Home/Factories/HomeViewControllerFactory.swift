//
//  HomeViewControllerFactory.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

final class HomeViewControllerFactory {
    
    // MARK: - Factory methods
    
    func makeHomeMenuViewController() -> HomeMenuViewController {
        let viewController = HomeMenuViewController()
        viewController.viewModel = HomeMenuViewModel()
        
        return viewController
    }
 
}

