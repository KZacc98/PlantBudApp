//
//  LoginViewControllerFactory.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

class LoginViewControllerFactory {
    
    // MARK: - Factory methods
    
    func makeLoginViewController() -> LoginViewController {
        let viewController: LoginViewController = LoginViewController()
        viewController.viewModel = LoginViewModel(tableViewInterface: viewController)
        
        return viewController
    }
    
}
