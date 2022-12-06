//
//  ApplicationCoordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

public class ApplicationCoordinator {
    
    // MARK: - Public properties
    
    public var window: UIWindow?
    public var childCoordinator: Coordinator? {
        willSet {
            childCoordinator?.finish()
        }
    }
    
    // MARK: - Initialization
    
    public init(window: UIWindow?) {
        self.window = window
        Logger.debug("Application Coordinator init: \(self)")
    }
    
    // MARK: - Start
    
    public func startEmpty() {
        let rootViewController = BaseViewController()
        rootViewController.view.backgroundColor = Color.brandWhite
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    public func startLoginCoordinator() {
        let navigationController: BaseNavigationController = BaseNavigationController()
        let coordinator = LoginCoordinator(navigationController: navigationController)
        childCoordinator = coordinator
        coordinator.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        window?.rootViewController?.view.backgroundColor = Color.brandWhite
    }
    
    public func startTabBarCoordinator(
        initiallySelectedOption: TabBarOption,
        completion: (() -> ())? = nil,
        coordinators: [TabBarItemCoordinator] = TabBarOption.allCases.map { $0.coordinator }
    ) {

        let appearanceViewController = AppearanceViewController()
        let navigationController = BaseNavigationController(rootViewController: appearanceViewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        let coordinator = TabBarCoordinator(appearanceViewController: appearanceViewController,
                                            initiallySelectedOption: initiallySelectedOption,
                                            coordinators: coordinators)
        childCoordinator = coordinator
        coordinator.start(animated: true, completion: completion)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

