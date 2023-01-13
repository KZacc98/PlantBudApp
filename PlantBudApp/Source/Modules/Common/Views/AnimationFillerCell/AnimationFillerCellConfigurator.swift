//
//  AnimationFillerCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 12/01/2023.
//

import UIKit
import Lottie

final class AnimationFillerCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: AnimationFillerCellData
    
    // MARK: - Initialization
    
    init(data: AnimationFillerCellData) {
        self.data = data
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension AnimationFillerCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return AnimationFillerCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? AnimationFillerCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.animationView.animation = LottieAnimation.named(data.animationName)
        view.animationView.play()
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return 500
    }
    
}

struct AnimationFillerCellData {
    let animationName: String
}



