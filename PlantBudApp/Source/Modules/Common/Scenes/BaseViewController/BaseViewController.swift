//
//  BaseViewController.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    var topMostViewController: UIViewController {
        var topMostViewController: UIViewController = self
        while let newTopMostViewController = topMostViewController.presentedViewController {
            topMostViewController = newTopMostViewController
        }
        
        return topMostViewController
    }
    
    lazy var isSmallDevice: Bool = {
        return UIDevice.current.isSmallDevice
    }()

    lazy var emptyDataView: EmptyDataView = {
        let emptyDataView = EmptyDataView(frame: .zero)
        
        return emptyDataView
    }()
    
    lazy var emptyDataDefaultContentOffset: CGPoint = {
        return CGPoint(x: 0.0, y: (view.bounds.height * 0.4)-view.bounds.midY)
    }()
    
    var transitionHelper = TransitionHelper()
    
    // MARK: - Access methods
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.transitionHelper.viewWillAppear?(animated)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.transitionHelper.viewDidAppear?(animated)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.transitionHelper.viewWillDisappear?(animated)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.transitionHelper.viewDidDisappear?(animated)
    }
    
    // MARK: - Selectors
    
    @objc func didPressBack() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Back button

extension BaseViewController {
    func addBackButton() {
        let leftButton = UIBarButtonItem(image: Assets.Common.backArrow, style: .plain, target: self, action: #selector(didPressBack))
        leftButton.accessibilityLabel = "back".localized
        leftButton.tintColor = Color.brandGreen
        navigationItem.leftBarButtonItem = leftButton
    }
}

// UIBarButtonItem

internal enum BarButtonItemSide {
    case left
    case right
}

extension BaseViewController {
    func addBarButtonItems(_ items: [UIBarButtonItem], side: BarButtonItemSide) {
        if side == .right {
            navigationItem.rightBarButtonItems = items
        } else {
            navigationItem.leftBarButtonItems = items
        }
    }
}

// MARK: - ViewControllerInterface

extension BaseViewController: TransitionHelperInterface {}

// MARK: - ConfirmationDialogInterface

extension BaseViewController: ConfirmationDialogInterface {
    func showConfirmationDialog(title: String?, message: String, acceptBlock: (() -> Void)?, rejectBlock: (() -> Void)?) {
        self.showDialog(title: title,
                        message: message,
                        cancelButtonTitle: "no".localized,
                        otherButtonTitles: ["yes".localized],
                        dismissBlock: { index in
                            if index == nil {
                                rejectBlock?()
                            } else {
                                acceptBlock?()
                            }
        })
    }
}

// MARK: - InformationDialogInterface

extension BaseViewController: InformationDialogInterface {
    func showInformationDialog(title: String?, message: String, presentBlock: (() -> Void)?, dismissBlock: (() -> Void)?) {
        self.showDialog(title: title,
                        message: message,
                        cancelButtonTitle: "ok".localized,
                        presentBlock: presentBlock,
                        dismissBlock: { _ in dismissBlock?() })
    }
}

// MARK: - ErrorDialogInterface

extension BaseViewController: ErrorDialogInterface {
    func showErrorDialog(with error: Error, presentBlock: (() -> Void)?, dismissBlock: (() -> Void)?) {
        Logger.error("ERROR DIALOG")
        //        DialogManager.showErrorDialog(with: error,
//                                      presentBlock: presentBlock,
//                                      dismissBlock: dismissBlock)
    }
}
