//
//  ProfilePictureCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 21/01/2023.
//

import UIKit
import Lottie

final class ProfilePictureCell: UITableViewCell {
    
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
        var animationView = LottieAnimationView(name: "userprofile_leaves")
        animationView.loopMode = .loop
        mainBackgroundView.addSubviewsUsingAutoLayout(animationView)
        animationView.play()
        animationsContainer.addSubviewsUsingAutoLayout(animationView)
        
        return animationView
    }()
    
    lazy var animationView2: LottieAnimationView = {
        var animationView = LottieAnimationView(name: "userprofile_leaves")
        animationView.transform = CGAffineTransform(scaleX: -1, y: 1)
        animationView.loopMode = .loop
        mainBackgroundView.addSubviewsUsingAutoLayout(animationView)
        animationView.play()
        animationsContainer.addSubviewsUsingAutoLayout(animationView)
        
        return animationView
    }()
    
    lazy var userPictureOverlay: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.setShadow(shadowOpacity: 0.5)
        view.layer.cornerRadius = 12
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var profilePictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 125
        imageView.clipsToBounds = true
        userPictureOverlay.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
        
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
        animationsContainer.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
        animationsContainer.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
        animationsContainer.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        animationsContainer.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        
        animationView.topAnchor.constrain(anchor: animationsContainer.topAnchor)
        animationView.bottomAnchor.constrain(anchor: animationsContainer.bottomAnchor, constant: -12)
        animationView.trailingAnchor.constrain(anchor: animationsContainer.trailingAnchor, constant: 200)
        
        animationView2.topAnchor.constrain(anchor: animationsContainer.topAnchor)
        animationView2.bottomAnchor.constrain(anchor: animationsContainer.bottomAnchor, constant: -12)
        animationView2.leadingAnchor.constrain(anchor: animationsContainer.leadingAnchor, constant: -200)
        
        profilePictureImageView.centerXAnchor.constrain(anchor: userPictureOverlay.centerXAnchor)
        profilePictureImageView.topAnchor.constrain(anchor: userPictureOverlay.topAnchor, constant: 12)
        profilePictureImageView.bottomAnchor.constrain(anchor: userPictureOverlay.bottomAnchor, constant: -12)
        profilePictureImageView.widthAnchor.constrain(constant: 250)
        profilePictureImageView.heightAnchor.constrain(anchor: profilePictureImageView.widthAnchor)
        
        userPictureOverlay.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
        userPictureOverlay.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
        userPictureOverlay.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        userPictureOverlay.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
    }
}


