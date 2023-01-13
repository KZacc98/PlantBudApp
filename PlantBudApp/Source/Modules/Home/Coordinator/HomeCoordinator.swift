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
    //    private let user: UserPanelDomain?
    //    private var sideMenuData = SideMenuData()
    //
    //    private lazy var sideMenuSettings: SideMenuSettings = {
    //        var settings: SideMenuSettings = SideMenuSettings()
    //        settings.presentationStyle = SideMenuPresentationStyle.menuSlideIn
    //        settings.statusBarEndAlpha = 0
    //        settings.menuWidth = UIScreen.main.bounds.width * 0.75
    //        settings.presentationStyle.presentingEndAlpha = 0.5
    //
    //        return settings
    //    }()
    
    // MARK: - Initialization
    
    init(tabBarItem: UITabBarItem,
         viewControllerFactory: HomeViewControllerFactory = HomeViewControllerFactory()
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
    
    private func routeMenu(animated: Bool) {
        let viewController = viewControllerFactory.makeHomeMenuViewController()
        viewController.onUserProfileTapped = {
            self.pushProfile()
        }
        navigationController?.setViewControllers([viewController], animated: animated)
        
    }
    
    public func pushProfile() {
        let viewController = viewControllerFactory.makeProfileViewController()

        navigationController?.pushViewController(viewController, animated: true)
    }
}

//// MARK: - UINavigationControllerDelegate
//
extension HomeCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        Logger.error("HERE")
    }
}

