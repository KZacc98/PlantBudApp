//
//  BadgesViewControllerFactory.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class BadgesViewControllerFactory {
    
    // MARK: - Factory methods
    
    func makeBadgesViewController() -> BadgesViewController {
        let viewController = BadgesViewController()
        viewController.viewModel = BadgesViewModel()
        
        return viewController
    }
  
}



