//
//  PlantStatsCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/12/2022.
//

import UIKit
import Lottie

final class PlantStatsCell: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandGreen
        view.setShadow(shadowOpacity: 1, shadowRadius: 6, shadowColor: Color.brandGreen)
        view.layer.cornerRadius = 12
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var animationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "monstera_leaf")
        animationView.loopMode = .playOnce
        mainBackgroundView.addSubviewsUsingAutoLayout(animationView)
        animationView.play()
        
        return animationView
    }()
    
    public lazy var plantsStateLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandWhite
        label.text = "CurrentPlantMeanState"
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var plantsMeanStateLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 18)
        label.textColor = Color.brandWhite
        label.text = "CurrentPlantMeanState"
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var plantsMeanStateCommentLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 12)
        label.textColor = Color.brandWhite
        label.text = "CurrentPlantMeanState"
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
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
            to: contentView.safeAreaLayoutGuide,
            insets: UIEdgeInsets(top: 12, left: 12, bottom: -12, right: -12)
        )
        
        plantsStateLabel.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        plantsStateLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        plantsStateLabel.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        
        plantsMeanStateLabel.topAnchor.constrain(anchor: plantsStateLabel.bottomAnchor, constant: 12)
        plantsMeanStateLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        plantsMeanStateLabel.trailingAnchor.constrain(anchor: animationView.leadingAnchor, constant: 12)
        
        plantsMeanStateCommentLabel.topAnchor.constrain(anchor: plantsMeanStateLabel.bottomAnchor, constant: 12)
        plantsMeanStateCommentLabel.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        plantsMeanStateCommentLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        plantsMeanStateCommentLabel.trailingAnchor.constrain(anchor: animationView.leadingAnchor, constant: 12)
        
        animationView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
        animationView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: 50)
        animationView.widthAnchor.constrain(constant: 200)
        animationView.heightAnchor.constrain(constant: 100)
        
    }
}


