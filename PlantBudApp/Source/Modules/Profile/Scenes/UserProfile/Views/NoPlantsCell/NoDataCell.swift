//
//  NoPlantsCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/01/2023.
//

import UIKit
import Lottie

final class NoDataCell: UITableViewCell {
    
    // MARK: - Public properties
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var animationsContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var animationView: LottieAnimationView = {
        var animationView = LottieAnimationView(name: "not_found")
        animationView.loopMode = .playOnce
        mainBackgroundView.addSubviewsUsingAutoLayout(animationView)
        animationView.play()
        
        return animationView
    }()
    
    lazy var labelContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.setShadow(cornerRadius: 12)
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.brandBlack
        label.font = Font.noticiaRegular(size: 24)
        label.textAlignment = .center
        label.numberOfLines = 0
        labelContainer.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
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
            insets: UIEdgeInsets(top: 0, left: 0, bottom: -24, right: 0)
        )
        animationsContainer.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
        animationsContainer.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        animationsContainer.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        
        labelContainer.topAnchor.constrain(anchor: animationView.bottomAnchor)
        labelContainer.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: 12)
        labelContainer.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        labelContainer.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)

        infoLabel.topAnchor.constrain(anchor: labelContainer.topAnchor, constant: 12)
        infoLabel.bottomAnchor.constrain(anchor: labelContainer.bottomAnchor, constant: -12)
        infoLabel.leadingAnchor.constrain(anchor: labelContainer.leadingAnchor, constant: 12)
        infoLabel.trailingAnchor.constrain(anchor: labelContainer.trailingAnchor, constant: -12)
        
        animationView.topAnchor.constrain(anchor: animationsContainer.topAnchor)
        animationView.leadingAnchor.constrain(anchor: animationsContainer.leadingAnchor)
        animationView.trailingAnchor.constrain(anchor: animationsContainer.trailingAnchor)
    }
}
