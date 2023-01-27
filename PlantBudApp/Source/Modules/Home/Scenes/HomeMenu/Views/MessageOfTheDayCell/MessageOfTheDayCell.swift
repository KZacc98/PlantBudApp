//
//  MessageOfTheDayCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/12/2022.
//

import UIKit
import Lottie

final class MessageOfTheDayCell: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.setShadow(shadowOpacity: 0.6, shadowRadius: 6)
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
    
    public lazy var plantsMeanStateCommentLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 16)
        label.textColor = Color.brandBlack
        label.text = "currentPlantMeanState".localized
        label.textAlignment = .center
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
        
        mainBackgroundView.fill(
            with: plantsMeanStateCommentLabel,
            to: mainBackgroundView.safeAreaLayoutGuide,
            insets: UIEdgeInsets(top: 12, left: 12, bottom: -12, right: -12))
        
        
        //        animationView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
        //        animationView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: 50)
        //        animationView.widthAnchor.constrain(constant: 200)
        //        animationView.heightAnchor.constrain(constant: 100)
        
    }
}




