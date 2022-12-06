//
//  CommunityViewControllerFactory.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class CommunityViewControllerFactory {
    
    // MARK: - Factory methods
    
    func makeCommunityViewController() -> CommunityViewController {
        let viewController = CommunityViewController()
        viewController.viewModel = CommunityViewModel()
        
        return viewController
    }
  
}




