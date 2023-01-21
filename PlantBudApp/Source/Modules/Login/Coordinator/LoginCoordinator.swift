//
//  LoginCoordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    // MARK: - Private properties
    
    private let viewControllerFactory: LoginViewControllerFactory
    
    // MARK: - Initialization
    
    init(
        navigationController: UINavigationController,
        viewControllerFactory: LoginViewControllerFactory = LoginViewControllerFactory()) {
        self.viewControllerFactory = viewControllerFactory
        super.init(navigationController: navigationController)
    }
    
    // MARK: - Methods
    
    override func start(animated: Bool = true, completion: (() -> ())? = nil) {
        routeLogin(animated: animated)
    }
    
    private func routeLogin(animated: Bool = true) {
        let viewController = viewControllerFactory.makeLoginViewController()
        
        viewController.onLoginSuccess = {
            UIAppDelegate?.applicationCoordinator?.startTabBarCoordinator(initiallySelectedOption: .home)
        }
        
        viewController.viewModel.onRegisterButtonPressed = { [weak self] in
            self?.pushRegister()
        }
        
        navigationController?.setViewControllers([viewController], animated: false)
    }
    
    private func pushRegister() {
        let viewController = viewControllerFactory.makeRegisterViewController()

        viewController.viewModel.onRegisterSuccess = { [weak self] loginCredentials in
            self?.navigationController?.popViewController(animated: true)
        }


        navigationController?.pushViewController(viewController, animated: true)
    }
    
//    private func pushSmsRecoverPassword() {
//        let viewController = viewControllerFactory.makeRecoverViewController(type: .sms)
//
//        viewController.viewModel.onNextPressed = { [weak self] in
//            self?.pushNewPassword(recoveryType: .sms)
//        }
//
//        viewController.viewModel.onChooseCatering = { [weak self] cateringCompanies, delegate in
//            self?.pushChooseCatering(cateringCompanies: cateringCompanies, delegate: delegate)
//        }
//
//        navigationController?.pushViewController(viewController, animated: true)
//    }
    
//    private func pushChooseCatering(
//        cateringCompanies: [CateringCompanyDomain],
//        delegate: ChooseCateringViewModelDelegate
//    ) {
//        let viewController = viewControllerFactory.makeChooseCateringViewController(
//            cateringCompanies: cateringCompanies,
//            delegate: delegate
//        )
//
//        viewController.viewModel.onCateringSelected = { [weak self] in
//            self?.navigationController?.popViewController(animated: true)
//        }
//
//        navigationController?.pushViewController(viewController, animated: true)
//    }
    
//    private func pushNewPassword(recoveryType: RecoveryType) {
//        let viewController = viewControllerFactory
//            .makeNewPasswordViewController(recoveryType: recoveryType)
//
//        viewController.viewModel.onLoginPressed = { [weak self] in
//            self?.navigationController?.popToRootViewController(animated: true)
//        }
//
//        navigationController?.pushViewController(viewController, animated: true)
//    }
}

