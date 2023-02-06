//
//  AnimationPointerHeaderCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 30/01/2023.
//

import UIKit
import Lottie

final class AnimationPointerHeaderCell: UITableViewCell {
    
    // MARK: - Public properties
    
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var labelContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.layer.borderColor = Color.brandGreen.cgColor
        view.layer.borderWidth = 3
        view.setShadow(cornerRadius: 12,
                       shadowOpacity: 0.5,
                       shadowRadius: 6,
                       shadowColor: Color.brandGreen)
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .center
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.adjustsFontSizeToFitWidth = true
        labelContainerView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var animationView: LottieAnimationView = {
        var animationView = LottieAnimationView(name: "arrow_here")
        animationView.transform = CGAffineTransform(scaleX: -1, y: 1)
        animationView.loopMode = .playOnce
        mainBackgroundView.addSubviewsUsingAutoLayout(animationView)
        animationView.play()
        
        return animationView
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
            to: contentView.safeAreaLayoutGuide
        )
        
        animationView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        animationView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        animationView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        animationView.leadingAnchor.constrain(anchor: mainBackgroundView.centerXAnchor, constant: -12)
        
        labelContainerView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        labelContainerView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        labelContainerView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        labelContainerView.trailingAnchor.constrain(anchor: mainBackgroundView.centerXAnchor)
        
        labelContainerView.fill(with: infoLabel, to: labelContainerView.safeAreaLayoutGuide, insets: UIEdgeInsets(top: 12, left: 12, bottom: -12, right: -12))
    }
}




