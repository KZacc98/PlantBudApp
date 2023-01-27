//
//  PlantsViewControllerFactory.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class PlantsViewControllerFactory {
    
    // MARK: - Factory methods
    
    func makePlantsViewController() -> PlantListViewController {
        let viewController = PlantListViewController()
        viewController.viewModel = PlantListViewModel()
        
        return viewController
    }
    
    func makePlantDetailsViewController(plant: Plant) -> PlantDetailsViewController {
        let viewController = PlantDetailsViewController()
        viewController.viewModel = PlantDetailsViewModel(plant: plant)
        
        return viewController
    }
    
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
    
    func makeAddPlantFormViewController(plantType: PlantTypeDomain) -> AddPlantFormViewController {
        let viewController = AddPlantFormViewController()
        viewController.viewModel = AddPlantFormViewModel(plantType: plantType, tableViewInterface: viewController)
        viewController.title = plantType.species
        
        return viewController
    }
    
    func makeAddCareRoutineViewController(plantId: Int, appendStep: Bool) -> AddCareRoutineViewController {
        let viewController = AddCareRoutineViewController()
        viewController.viewModel = AddCareRoutineViewModel(plantId: plantId, appendStep: appendStep)
        viewController.viewModel.onFrequencyListShouldBeginEditing = { [weak self] in
            return true
        }
        
        return viewController
    }
}


