//
//  UIView+Extension.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

extension UIView {
    func addSubviewsUsingAutoLayout(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    func fill(with view: UIView, to layoutGuide: UILayoutGuide, insets: UIEdgeInsets = .zero) {
        view.topAnchor.constrain(anchor: layoutGuide.topAnchor, constant: insets.top)
        view.bottomAnchor.constrain(anchor: layoutGuide.bottomAnchor, constant: insets.bottom)
        view.leadingAnchor.constrain(anchor: layoutGuide.leadingAnchor, constant: insets.left)
        view.trailingAnchor.constrain(anchor: layoutGuide.trailingAnchor, constant: insets.right)
    }

    func setShadow(cornerRadius: CGFloat = 4,
                   shadowOpacity: Float = 0.5,
                   shadowRadius: CGFloat = 4,
                   shadowOffset: CGSize = CGSize(width: 0, height: 1),
                   shadowColor: UIColor = .black) {

        layer.cornerRadius = cornerRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
        layer.shadowColor = shadowColor.cgColor
    }
    
    func getAllSubviewsOfType<T: UIView>(_ type: T.Type) -> [T] {
        return subviews.flatMap { subView -> [T] in
            var result = subView.getAllSubviewsOfType(type)
            if let view = subView as? T { result.append(view) }
            return result
        }
    }
}
