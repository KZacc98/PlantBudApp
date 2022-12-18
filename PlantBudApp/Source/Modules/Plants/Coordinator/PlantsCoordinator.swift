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
            Logger.error("PUSH VC with ID \(plant.id)")
//            viewController.makeToast(with: "PlantID: \(plantId)")
            self?.pushPlantDetails(plant: plant)
            
        }
        
        navigationController?.setViewControllers([viewController], animated: animated)
    }
    
    private func pushPlantDetails(plant: PlantDomain) {
        let viewController = viewControllerFactory.makePlantDetailsViewController(plant: plant)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

/// MARK: - UINavigationControllerDelegate

extension PlantsCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        Logger.error("PLANTS")
    }
}


