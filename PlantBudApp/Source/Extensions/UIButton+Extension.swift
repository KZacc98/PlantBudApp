//
//  UIButton+Extension.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

extension UIButton {
    @discardableResult
    public func setDefaultStyle() -> UIButton {
        backgroundColor = .systemRed
        setTitleColor(.black, for: .normal)
        setTitleColor(.gray, for: .disabled)
        setShadow()

        return self
    }
    
    @discardableResult
    public func setCustomStyle() -> UIButton {
        backgroundColor = .systemRed
        setTitleColor(Color.brandWhite, for: .normal)
        setTitleColor(.gray, for: .disabled)
        setShadow(cornerRadius: 25, shadowColor: Color.brandGreen)

        return self
    }
}

