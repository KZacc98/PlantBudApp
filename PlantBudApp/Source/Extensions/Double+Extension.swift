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
    
    func stateWithEmoji() -> String {
        switch self {
        case 5.0 ... 6.0:
            return "plantStateThrivingMulti".localized
        case 4.0 ... 4.9:
            return "plantStateGoodMulti".localized
        case 1.0 ... 3.9:
            return "plantStateNeedsAttentionMulti".localized
        case -0.9 ... 0.0:
            return "plantStateThirstyMulti".localized
        case -1.9 ... -1.0:
            return "plantStateForgottenMulti".localized
        case -2.0:
            return "plantStateDeadMulti".localized
        default:
            return "plantSTateDefaultMultiple".localized
        }
    }
}
