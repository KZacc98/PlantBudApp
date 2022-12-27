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
    
    func makePlantDetailsViewController(plant: Plant) -> PlantDetailsViewController {
        let viewController = PlantDetailsViewController()
        viewController.viewModel = PlantDetailsViewModel(plant: plant)
        
        return viewController
    }
}


