//
//  PlantsCoordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class PlantsCoordinator: TabBarItemCoordinator {
    
    // MARK: - Private properties
    
    private let viewControllerFactory: PlantsViewControllerFactory
    
    // MARK: - Initialization
    
    init(tabBarItem: UITabBarItem,
         viewControllerFactory: PlantsViewControllerFactory = PlantsViewControllerFactory()
         //         user: UserPanelDomain? = nil
    ) {
        
        self.viewControllerFactory = viewControllerFactory
        //        self.user = user
        super.init(tabBarItem: tabBarItem)
    }
    
    // MARK: - Start
    
    override func start(animated: Bool = false, completion: (() -> ())? = nil) {
        guard isStarted == false else { return }
        routeMenu(animated: animated)
        //        setupNavigationController()
        super.start()
    }
    
    // MARK: - Public methods
    
    // MARK: - Private methods
    
    //    private func setupNavigationController() {
    //        navigationController?.delegate = self
    //    }
    
    private func routeMenu(animated: Bool) {
        let viewController = viewControllerFactory.makePlantsViewController()
        viewController.viewModel.onPlantPressed = { [weak self] plant in
            Logger.error("PUSH VC with PLANT \(plant)")
//            viewController.makeToast(with: "PlantID: \(plantId)")
            self?.pushPlantDetails(plant: plant)
        }
        
        viewController.onAddPlantTapped = { [weak self] in
            Logger.info("AddPlantTapped")
            self?.pushAddPlant()
        }
        
        viewController.onFirstOpen = { [weak self] in
            self?.presentModal()
        }
        
        
        navigationController?.setViewControllers([viewController], animated: animated)
    }
    
    private func presentModal() { //TODO: Tutorial jak dodac roslinke moze?
        let viewController = viewControllerFactory.makeAddViewController()
        
        presentModalNavigation(root: viewController, modalPresentationStyle: .pageSheet)
    }
    
    private func pushPlantDetails(plant: Plant) {
        let viewController = viewControllerFactory.makePlantDetailsViewController(plant: plant)
        
        viewController.viewModel.onDeletePlantSuccess = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        viewController.viewModel.onAddCareRoutinePressed = { [weak self] plantId, appendStep in
            self?.pushAddCareRoutine(plantId: plantId, appendStep: appendStep)
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func pushAddPlant() {
        let viewController = viewControllerFactory.makeAddPlantViewController()
        viewController.viewModel.onPlantTypePressed = { [weak self] plantTypeDomain in
            viewController.makeToast(with: "PlantTypeSpecies: \(plantTypeDomain.species)")
            self?.pushAddPlantForm(plantType: plantTypeDomain)
            
            Logger.info("lkjsdhfasdlkjhfkljasdhf")
        }

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func pushAddPlantForm(plantType: PlantTypeDomain) {
        let viewController = viewControllerFactory.makeAddPlantFormViewController(plantType: plantType)
        viewController.viewModel.onAddPlantSuccess = {[weak self] in
            UIAppDelegate?.showLoadingIndicator()
            self?.navigationController?.popViewController(animated: false)
            self?.navigationController?.popViewController(animated: false)
        }
        
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func pushAddCareRoutine(plantId: Int, appendStep: Bool) {
        let viewController = viewControllerFactory.makeAddCareRoutineViewController(plantId: plantId, appendStep: appendStep)
        
        viewController.viewModel.onRoutineAdded = { [weak self] in
            UIAppDelegate?.showLoadingIndicator()
            self?.navigationController?.popViewController(animated: false)
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

/// MARK: - UINavigationControllerDelegate

extension PlantsCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        Logger.error("PLANTS")
    }
}


