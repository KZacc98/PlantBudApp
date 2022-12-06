//
//  NSLayoutConstraint+Extension.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

extension NSLayoutConstraint {
    func set(priority: UILayoutPriority, isActive: Bool) {
        
        self.priority = priority
        self.isActive = isActive
    }
}
