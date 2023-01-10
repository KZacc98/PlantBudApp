//
//  AddCoordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 07/01/2023.
//

import UIKit

final class AddCoordinator: TabBarItemCoordinator {
    
    // MARK: - Private properties
    
    private let viewControllerFactory: AddViewControllerFactory
    
    // MARK: - Initialization
    
    init(tabBarItem: UITabBarItem,
         viewControllerFactory: AddViewControllerFactory = AddViewControllerFactory()
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
        let viewController = viewControllerFactory.makeAddViewController()
        viewController.viewModel.onAddPlantPressed = {
            viewController.makeToast(with: "ADD PLANT PRESSED")
            self.pushAddPlant()
        }
        viewController.viewModel.onAddCareRoutinePressed = {
            viewController.makeToast(with: "ADD CareRoutine")
            self.pushAddCareRoutine()
        }

        navigationController?.setViewControllers([viewController], animated: animated)
    }
    
    private func pushAddCareRoutine() {
        let viewController = viewControllerFactory.makeAddCareRoutineViewController()

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
}

/// MARK: - UINavigationControllerDelegate

extension AddCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        Logger.error("ADD")
    }
}


