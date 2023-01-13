//
//  ProfileViewControllerFactory.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 13/01/2023.
//

import UIKit

final class ProfileViewControllerFactory {
    
    // MARK: - Factory methods
    
    func makeProfileViewController() -> ProfileViewController {
        let viewController = ProfileViewController()
        viewController.viewModel = ProfileViewModel()
        
        return viewController
    }
}
