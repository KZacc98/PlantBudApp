//
//  ErrorDialogInterface.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import Foundation

protocol ErrorDialogInterface: AnyObject {
    func showErrorDialog(with error: Error, presentBlock: (() -> Void)?, dismissBlock: (() -> Void)?)
    func showErrorDialog(with error: Error, presentBlock: (() -> Void)?)
    func showErrorDialog(with error: Error, dismissBlock: (() -> Void)?)
    func showErrorDialog(with error: Error)
}

extension ErrorDialogInterface {
    func showErrorDialog(with error: Error, presentBlock: (() -> Void)?) {
        self.showErrorDialog(with:  error, presentBlock: presentBlock, dismissBlock: nil)
    }
    
    func showErrorDialog(with error: Error, dismissBlock: (() -> Void)?) {
        self.showErrorDialog(with:  error, presentBlock: nil, dismissBlock: dismissBlock)
    }
    
    func showErrorDialog(with error: Error) {
        self.showErrorDialog(with:  error, presentBlock: nil, dismissBlock: nil)
    }
}
