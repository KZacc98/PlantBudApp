//
//  NSLayoutDimension+Extension.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/12/2022.
//

import UIKit

extension NSLayoutDimension {
    func constraint(greaterThanOrEqualTo anchor: NSLayoutDimension,
                    multiplier: CGFloat,
                    priority: UILayoutPriority) -> NSLayoutConstraint {
        let layoutConstraint = constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier)
        layoutConstraint.priority = priority
        return layoutConstraint
    }
    
    func constraint(lessThanOrEqualTo anchor: NSLayoutDimension,
                    multiplier: CGFloat,
                    priority: UILayoutPriority) -> NSLayoutConstraint {
        let layoutConstraint = constraint(lessThanOrEqualTo: anchor, multiplier: multiplier)
        layoutConstraint.priority = priority
        return layoutConstraint
    }
    
    func constraint(equalTo anchor: NSLayoutDimension,
                    multiplier: CGFloat,
                    priority: UILayoutPriority) -> NSLayoutConstraint {
        let layoutConstraint = constraint(equalTo: anchor, multiplier: multiplier)
        layoutConstraint.priority = priority
        return layoutConstraint
    }
    
    func constraint(equalToConstant constant: CGFloat,
                    priority: UILayoutPriority) -> NSLayoutConstraint {
        let layoutConstraint = constraint(equalToConstant: constant)
        layoutConstraint.priority = priority
        return layoutConstraint
    }
}

