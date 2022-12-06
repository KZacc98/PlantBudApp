//
//  BadgesCoordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class BadgesCoordinator: TabBarItemCoordinator {
    
    // MARK: - Private properties
    
    private let viewControllerFactory: BadgesViewControllerFactory
    
    // MARK: - Initialization
    
    init(tabBarItem: UITabBarItem,
         viewControllerFactory: BadgesViewControllerFactory = BadgesViewControllerFactory()
    ) {
        
        self.viewControllerFactory = viewControllerFactory
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
            let viewController = viewControllerFactory.makeBadgesViewController()
            navigationController?.setViewControllers([viewController], animated: animated)
            }
}

//// MARK: - UINavigationControllerDelegate
//
extension BadgesCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        Logger.error("BADGES")
    }
}


