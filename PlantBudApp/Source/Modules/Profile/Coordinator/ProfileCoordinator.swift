//
//  ProfileCoordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 13/01/2023.
//

import UIKit

final class ProfileCoordinator: TabBarItemCoordinator {
    
    // MARK: - Private properties
    
    private let viewControllerFactory: ProfileViewControllerFactory
    
    // MARK: - Initialization
    
    init(tabBarItem: UITabBarItem,
         viewControllerFactory: ProfileViewControllerFactory = ProfileViewControllerFactory()
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
        let viewController = viewControllerFactory.makeProfileViewController()
        
        navigationController?.setViewControllers([viewController], animated: animated)
    }
//    
//    private func pushPlantDetails(plant: Plant) {
//        let viewController = viewControllerFactory.makePlantDetailsViewController(plant: plant)
//        
//        viewController.viewModel.onDeletePlantSuccess = { [weak self] in
//            self?.navigationController?.popViewController(animated: true)
//        }
//        navigationController?.pushViewController(viewController, animated: true)
//    }
}

/// MARK: - UINavigationControllerDelegate

extension ProfileCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        Logger.error("PLANTS")
    }
}



