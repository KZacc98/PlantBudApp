//
//  AnimationFillerCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 12/01/2023.
//

import UIKit
import Lottie

final class AnimationFillerCell: UITableViewCell {
    
    // MARK: - Public properties
    
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var animationView: LottieAnimationView = {
        var animationView = LottieAnimationView(name: "monstera_leaf")
        animationView.loopMode = .loop
        mainBackgroundView.addSubviewsUsingAutoLayout(animationView)
        animationView.play()
        
        return animationView
    }()
    
    // MARK: - Selectors
    
//    @objc private func didPressButton(_ sender: UIButton) {
//        didPressButton?()
//    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAutoLayout()
    }
    
    // MARK: - Setup
    
    private func setupAutoLayout() {
        contentView.fill(
            with: mainBackgroundView,
            to: contentView.safeAreaLayoutGuide
        )
        
        animationView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        animationView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        animationView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
    }
}



