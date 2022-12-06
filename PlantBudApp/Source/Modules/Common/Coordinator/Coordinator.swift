//
//  Coordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

open class Coordinator: NSObject {
    
    // MARK: - Public properties
    
    let navigationController: UINavigationController?
    weak var modalNavigationController: UINavigationController?
    
    var childCoordinator: Coordinator? {
        willSet {
            childCoordinator?.finish()
        }
    }
    
    var modalChildCoordinator: Coordinator? {
        willSet {
            modalChildCoordinator?.finish()
        }
    }
    
    // MARK: - Initialization
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
        
        super.init()
        Logger.debug("Coordinator init: \(self)")
    }
    
    deinit {
        Logger.debug("Coordinator deinit: \(self)")
    }
    
    // MARK: - Routing
    
    open func start(animated: Bool = true, completion: (() -> ())? = nil) {}
    
    func finish() {
        modalNavigationController?.dismiss(animated: false, completion: nil)
        modalNavigationController = nil
        childCoordinator?.finish()
        modalChildCoordinator?.finish()
        modalChildCoordinator = nil
        childCoordinator = nil
    }
    
    func presentModalNavigation(root controller: UIViewController,
                                modalPresentationStyle: UIModalPresentationStyle) {
        let modalNavigationController = BaseNavigationController(rootViewController: controller)
        self.modalNavigationController = modalNavigationController
        modalNavigationController.modalPresentationStyle = modalPresentationStyle
        
        
        if let presentedController = navigationController?.presentedViewController,
            !(presentedController is UIAlertController) {
            modalNavigationController.modalPresentationStyle = .overCurrentContext
            presentedController.present(modalNavigationController, animated: true, completion: nil)
            return
        }
        
        navigationController?.present(modalNavigationController, animated: true, completion: nil)
    }
    
    func closeModalNavigation(completion: VoidClosure? = nil) {
        modalNavigationController?.dismiss(animated: true, completion: { [weak self] in
            self?.modalNavigationController = nil
            completion?()
        })
    }
}

extension Coordinator {
    typealias VoidClosure = () -> Void
}
