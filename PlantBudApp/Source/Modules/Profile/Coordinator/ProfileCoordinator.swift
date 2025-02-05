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
    ) {
        self.viewControllerFactory = viewControllerFactory
        super.init(tabBarItem: tabBarItem)
    }
    
    // MARK: - Start
    
    override func start(animated: Bool = false, completion: (() -> ())? = nil) {
        guard isStarted == false else { return }
        routeMenu(animated: animated)
        super.start()
    }
    
    // MARK: - Private methods
    
    private func routeMenu(animated: Bool) {
        let viewController = viewControllerFactory.makeProfileViewController()
        
        navigationController?.setViewControllers([viewController], animated: animated)
    }
}
