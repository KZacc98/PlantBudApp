//
//  PlantsViewControllerFactory.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class PlantsViewControllerFactory {
    
    // MARK: - Factory methods
    
    func makePlantsViewController() -> PlantsViewController {
        let viewController = PlantsViewController()
        viewController.viewModel = PlantsViewModel()
        
        return viewController
    }
    
}


