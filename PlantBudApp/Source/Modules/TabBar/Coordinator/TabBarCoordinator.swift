//
//  TabBarCoordinator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

final class TabBarCoordinator: Coordinator {
    
    // MARK: - Private properties
    
    private let appearanceViewController: AppearanceViewController
    private let tabBarController: UITabBarController
    private let initiallySelectedOption: TabBarOption
    private var coordinators: [TabBarItemCoordinator]
    private var selectedViewControllerObserver: NSKeyValueObservation?
    
    // MARK: - Public properties
    
    
    // MARK: - Initialization
    
    init(appearanceViewController: AppearanceViewController,
         tabBarController: UITabBarController = UITabBarController(),
         initiallySelectedOption: TabBarOption,
         coordinators: [TabBarItemCoordinator]) {
        
        self.appearanceViewController = appearanceViewController
        self.tabBarController = tabBarController
        self.initiallySelectedOption = initiallySelectedOption
        self.coordinators = coordinators
        
        super.init()
    }
    
    deinit {
        selectedViewControllerObserver?.invalidate()
        selectedViewControllerObserver = nil
    }
    
    // MARK: - Start
    
    override func start(animated: Bool = true, completion: (() -> ())? = nil) {
        appearanceViewController.viewModel.onUserPanelDownload = {
            self.setupTabBarController(animated: animated, completion: completion)
        }

    }
    
    // MARK: - Finish
    
    public override func finish() {
        coordinators.forEach { $0.finish() }
        super.finish()
    }
    
    // MARK: - Public methods
    
    public func selectTabBarItem(for tabBarOption: TabBarOption) {
        guard let index = TabBarOption.allCases.firstIndex(of: tabBarOption) else {
            Logger.error("Unable to find index of tabBarOption: \(tabBarOption)")
            return
        }
        tabBarController.selectedViewController = coordinators[index].navigationController
    }
    
    public func coordinator(for tabBarOption: TabBarOption) -> TabBarItemCoordinator? {
        guard let index = TabBarOption.allCases.firstIndex(of: tabBarOption),
            coordinators.indices.contains(index) else {
            Logger.error("Unable to find index of tabBarOption: \(tabBarOption)")
            return nil
        }
        return coordinators[index]
    }
    
    //MARK: - Private methods
    
    private func setupTabBarController(animated: Bool, completion: (() -> ())?) {
        tabBarController.setDefaultStyle()
        tabBarController.modalPresentationStyle = .fullScreen
        tabBarController.setViewControllers(coordinators.compactMap { $0.navigationController }, animated: animated)
        tabBarController.selectedIndex = TabBarOption.allCases.firstIndex(of: initiallySelectedOption) ?? 0
        
        selectedViewControllerObserver = tabBarController.observe(\.selectedViewController, options: [.initial, .new]) { [weak self] tabBarController, change in
            guard let selectedViewController = change.newValue as? UINavigationController,
                let index = self?.coordinators.firstIndex(where: { $0.navigationController === selectedViewController }) else {
                    return
            }
            let coordinator = self?.coordinators[index]
            self?.childCoordinator = coordinator
            coordinator?.start(completion: completion)
        }

        appearanceViewController.present(tabBarController, animated: true)
        completion?()
    }
}

