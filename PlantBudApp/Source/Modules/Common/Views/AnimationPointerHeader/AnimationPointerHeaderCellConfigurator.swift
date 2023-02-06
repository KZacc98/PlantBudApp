//
//  AnimationPointerHeaderCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 30/01/2023.
//

import UIKit
import Lottie

final class AnimationPointerHeaderCellConfigurator {
    
    // MARK: - Private properties
    
    private let info: String
    
    // MARK: - Initialization
    
    init(info: String) {
        self.info = info
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension AnimationPointerHeaderCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return AnimationPointerHeaderCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? AnimationPointerHeaderCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.animationView.play()
        view.infoLabel.text = info
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
