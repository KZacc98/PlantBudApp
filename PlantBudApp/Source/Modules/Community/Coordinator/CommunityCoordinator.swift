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
        
        viewController.viewModel.didPressPostDetails = { [weak self] postDomain, commentDomains in
            Logger.info("PUSH POSTDETAILS")
            self?.pushPostDetails(postDomain: postDomain, commentDomains: commentDomains)
        }
        
        viewController.viewModel.didPressUserHeader = { [weak self] username in
            Logger.info("PUSH USERPROFILE username: \(username)")
            self?.pushUserProfile(username: username)
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func pushPostDetails(postDomain: PostDomain, commentDomains: [CommentDomain]) {
        let viewController = viewControllerFactory.makePostDetailsViewController(postDomain: postDomain, commentDomains: commentDomains)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func pushUserProfile(username: String) {
        let viewController = viewControllerFactory.makeUserProfileViewController(username: username)
        
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



