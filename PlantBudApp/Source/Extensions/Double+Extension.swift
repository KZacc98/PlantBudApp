//
//  Double+Extension.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

extension Double {
    
    public var deviceSizeAware: CGFloat {
        return UIDevice.current.isSmallDevice ? (CGFloat(self) * 0.8) : CGFloat(self)
    }
}
