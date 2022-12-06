//
//  AnimationHeader.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import Foundation
import UIKit
import Lottie

class AnimationHeader: UITableViewHeaderFooterView {
    
    //MARK: - Public properties
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "plant_walking")
        animationView.loopMode = .loop
        addSubviewsUsingAutoLayout(animationView)
        animationView.play()
        
        return animationView
    }()

    //MARK: - Initialization
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupAutoLayout()
    }
    
    //MARK: - Setup
    
    private func setupAutoLayout() {
        contentView.fill(with: mainBackgroundView,
                         to: contentView.safeAreaLayoutGuide)
        
        animationView.centerYAnchor.constrain(anchor: mainBackgroundView.centerYAnchor)
        animationView.centerXAnchor.constrain(anchor: mainBackgroundView.centerXAnchor)
    }
}
