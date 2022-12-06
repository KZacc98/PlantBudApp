//
//  AnimationHeaderConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit
import Lottie

internal final class AnimationHeaderConfigurator {
    // MARK: - Private properties
    
    private let data: AnimationHeaderData
    
    // MARK: - Initialization
    
    init(data: AnimationHeaderData) {
        self.data = data
    }
}

extension AnimationHeaderConfigurator: ReusableViewConfiguratorInterface  {
    var type: AnyClass {
        return AnimationHeader.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? AnimationHeader else { return }
        
        view.backgroundColor = data.backgroundColor
        view.animationView = LottieAnimationView(name: data.animationName)
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        if UIDevice.current.isSmallDevice || UIDevice.current.screenType == .iPhones_6_6s_7_8 {
            return size.height * 0.32
        } else {
            return size.height * 0.467
        }
    }
    
}
