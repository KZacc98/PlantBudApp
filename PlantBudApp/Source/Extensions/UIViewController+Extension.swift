//
//  UIViewController+Extension.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

struct DialogButtonIndex {
    static let cancel: Int? = nil
}

extension UIViewController {
    func showDialog(title: String? = nil,
                    message: String,
                    cancelButtonTitle: String? = nil,
                    otherButtonTitles: [String] = [],
                    presentBlock: (() -> Void)? = nil,
                    dismissBlock: ((Int?) -> Void)? = nil) {
        
        let alertController = self.alertController(title: title,
                                                   message: message,
                                                   cancelButtonTitle: cancelButtonTitle,
                                                   otherButtonTitles: otherButtonTitles,
                                                   dismissBlock: dismissBlock)
        alertController.view.tintColor = Color.brandGreen
        
        self.present(alertController, animated: true, completion: presentBlock)
    }
    
    func makeToast(with message: String, completion: (() -> ())? = nil) {
        let toastView = ToastView()
        toastView.alpha = 0
        toastView.setupView(with: message)
        
        view.addSubviewsUsingAutoLayout(toastView)
        toastView.heightAnchor.constrain(constant: 51.deviceSizeAware)
        toastView.topAnchor.constrain(.greaterThanOrEqual, anchor: view.safeAreaLayoutGuide.topAnchor)
        toastView.leadingAnchor.constrain(anchor: view.safeAreaLayoutGuide.leadingAnchor, constant: 12)
        toastView.trailingAnchor.constrain(anchor: view.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        toastView.bottomAnchor.constrain(anchor: view.safeAreaLayoutGuide.bottomAnchor, constant: -18)
        
        UIView.animate(withDuration: 0.25, animations: { [weak toastView] in
            toastView?.alpha = 1
        }, completion: { [weak toastView] _ in
            UIView.animate(withDuration: 0.25, delay: 2, options: .curveEaseOut, animations: {
                toastView?.alpha = 0
            }, completion: { _ in
                toastView?.removeFromSuperview()
                completion?()
            })
        })
    }
}

private extension UIViewController {
    func alertController(title: String?,
                         message: String,
                         cancelButtonTitle: String? = nil,
                         otherButtonTitles: [String],
                         dismissBlock: ((Int?) -> Void)? = nil) -> UIAlertController {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.view.tintColor = Color.brandGreen
        
        if let title = cancelButtonTitle {
            alertController.addAction(UIAlertAction(title: title,
                                                    style: .cancel,
                                                    handler: { _ in dismissBlock?(DialogButtonIndex.cancel) } ))
        }
        
        for (index, otherButtonTitle) in otherButtonTitles.enumerated()  {
            let action = UIAlertAction(title: otherButtonTitle,
                                       style: .default,
                                       handler: { (action) in
                                        dismissBlock?(index)
            })
            alertController.addAction(action)
        }
        return alertController
    }
}


