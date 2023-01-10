//
//  CommunityViewControllerFactory.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class CommunityViewControllerFactory {
    
    // MARK: - Factory methods
    
    func makeCommunityListViewController() -> CommunityListViewController {
        let viewController = CommunityListViewController()
        viewController.viewModel = CommunityListViewModel()
        
        return viewController
    }
    
    func makeCommunityViewController(communityDomain: CommunityDomain) -> CommunityViewController {
        let viewController = CommunityViewController()
        viewController.viewModel = CommunityViewModel(communityDomain: communityDomain)
        
        return viewController
    }
  
}




