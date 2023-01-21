//
//  AddViewControllerFactory.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 07/01/2023.
//

import UIKit

final class AddViewControllerFactory {
    
    // MARK: - Factory methods
    
    func makeAddViewController() -> AddViewController {
        let viewController = AddViewController()
        viewController.viewModel = AddViewModel()
        
        return viewController
    }
    
    func makeAddPlantViewController() -> AddPlantViewController {
        let viewController = AddPlantViewController()
        viewController.viewModel = AddPlantViewModel()
        
        return viewController
    }
    
//    func makeAddCareRoutineViewController() -> AddCareRoutineViewController {
//        let viewController = AddCareRoutineViewController()
//        viewController.viewModel = AddCareRoutineViewModel()
//        
//        return viewController
//    }
    
    func makeAddPlantFormViewController(plantType: PlantTypeDomain) -> AddPlantFormViewController {
        let viewController = AddPlantFormViewController()
        viewController.viewModel = AddPlantFormViewModel(plantType: plantType, tableViewInterface: viewController)
        
        return viewController
    }
}


