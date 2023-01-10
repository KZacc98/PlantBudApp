//
//  CommunityCoordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class CommunityCoordinator: TabBarItemCoordinator {
    
    // MARK: - Private properties
    
    private let viewControllerFactory: CommunityViewControllerFactory
    
    // MARK: - Initialization
    
    init(tabBarItem: UITabBarItem,
         viewControllerFactory: CommunityViewControllerFactory = CommunityViewControllerFactory()
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
        let viewController = viewControllerFactory.makeCommunityListViewController()
        navigationController?.setViewControllers([viewController], animated: animated)
        
        viewController.viewModel.onCommunityTilePressed = { [weak self] communityDomain in
            Logger.info("\(communityDomain.id)")
            self?.pushCommunity(communityDomain: communityDomain)
        }
    }
    
    private func pushCommunity(communityDomain: CommunityDomain) {
        let viewController = viewControllerFactory.makeCommunityViewController(communityDomain: communityDomain)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//// MARK: - UINavigationControllerDelegate
//
extension CommunityCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        Logger.error("Community")
    }
}



