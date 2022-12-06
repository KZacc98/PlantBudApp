//
//  ConfirmationDialogInterface.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import Foundation

protocol ConfirmationDialogInterface: AnyObject {
    func showConfirmationDialog(title: String?, message: String, acceptBlock: (() -> Void)?, rejectBlock: (() -> Void)?)
    func showConfirmationDialog(title: String?, message: String, acceptBlock: (() -> Void)?)
    func showConfirmationDialog(title: String?, message: String, rejectBlock: (() -> Void)?)
    func showConfirmationDialog(message: String, acceptBlock: (() -> Void)?, rejectBlock: (() -> Void)?)
    func showConfirmationDialog(message: String, acceptBlock: (() -> Void)?)
    func showConfirmationDialog(message: String, rejectBlock: (() -> Void)?)
}

extension ConfirmationDialogInterface {
    func showConfirmationDialog(title: String?, message: String, acceptBlock: (() -> Void)?) {
        self.showConfirmationDialog(title: title, message: message, acceptBlock: acceptBlock, rejectBlock: nil)
    }
    
    func showConfirmationDialog(title: String?, message: String, rejectBlock: (() -> Void)?) {
        self.showConfirmationDialog(title: title, message: message, acceptBlock: nil, rejectBlock: rejectBlock)
    }
    
    func showConfirmationDialog(message: String, acceptBlock: (() -> Void)?, rejectBlock: (() -> Void)?) {
        self.showConfirmationDialog(title: nil, message: message, acceptBlock: acceptBlock, rejectBlock: rejectBlock)
    }
    
    func showConfirmationDialog(message: String, acceptBlock: (() -> Void)?) {
        self.showConfirmationDialog(title: nil, message: message, acceptBlock: acceptBlock, rejectBlock: nil)
    }
    
    func showConfirmationDialog(message: String, rejectBlock: (() -> Void)?) {
        self.showConfirmationDialog(title: nil, message: message, acceptBlock: nil, rejectBlock: rejectBlock)
    }
}

