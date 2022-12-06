//
//  Int+Extension.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

extension Int {
    ///  Public computed property to scale layout constants for small devices
    public var deviceSizeAware: CGFloat {
        return UIDevice.current.isSmallDevice ? (CGFloat(self) * 0.8).rounded() : CGFloat(self)
    }
}
