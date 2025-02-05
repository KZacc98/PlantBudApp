//
//  HomeCoordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

final class HomeCoordinator: TabBarItemCoordinator {
    
    // MARK: - Private properties
    
    private let viewControllerFactory: HomeViewControllerFactory
    
    // MARK: - Initialization
    
    init(tabBarItem: UITabBarItem,
         viewControllerFactory: HomeViewControllerFactory = HomeViewControllerFactory()
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
    
    // MARK: - Public methods
    
    public func pushProfile() {
        let viewController = viewControllerFactory.makeProfileViewController()

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    // MARK: - Private methods
    
    private func routeMenu(animated: Bool) {
        let viewController = viewControllerFactory.makeHomeMenuViewController()
        viewController.onUserProfileTapped = {
            self.pushProfile()
        }
        
        navigationController?.setViewControllers([viewController], animated: animated)
    }
}
