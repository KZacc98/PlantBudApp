//
//  UserProfileCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/12/2022.
//

import UIKit

final class UserProfileCell: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var pointsContainer: UIView = {
        let view = UIView()
        view.layer.borderColor = Color.brandGreen.cgColor
        view.layer.cornerRadius = 10
        view.setShadow(shadowOpacity: 1, shadowColor: Color.brandGreen)
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var pointsLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 18)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        pointsContainer.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var profilePictureImageView: UIView = {
        let imageView = UIView()
        imageView.backgroundColor = Color.brandGreen
        imageView.layer.cornerRadius = 50
//        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
        
    }()
    
//    public lazy var button: UIButton = {
//        let button = UIButton(type: .system)
//        button.setShadow(
//            cornerRadius: 4,
//            shadowOpacity: 0.5,
//            shadowRadius: 4,
//            shadowOffset: .zero,
//            shadowColor: Color.white
//        )
//        button.backgroundColor = Color.white
//        button.setTitle("P".uppercased(), for: .normal)
//        button.setTitleColor(Color.black, for: .normal)
////        button.helloLabel?.font =
////        button.addTarget(self, action: #selector(didPressButton(_:)), for: .touchUpInside)
//        mainBackgroundView.addSubviewsUsingAutoLayout(button)
//
//        return button
//    }()
    
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
        
        profilePictureImageView.centerXAnchor.constrain(anchor: mainBackgroundView.centerXAnchor)
//        profilePictureImageView.widthAnchor.constrain(constant: 100)
//        profilePictureImageView.heightAnchor.constrain(anchor: profilePictureImageView.widthAnchor)
        profilePictureImageView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 6)
        profilePictureImageView.widthAnchor.constrain(constant: 100)
        profilePictureImageView.heightAnchor.constrain(anchor: profilePictureImageView.widthAnchor)

        
        helloLabel.topAnchor.constrain(anchor: profilePictureImageView.bottomAnchor, constant: 6)
        helloLabel.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -6)
        helloLabel.centerXAnchor.constrain(anchor: profilePictureImageView.centerXAnchor)

        pointsContainer.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -6)
        pointsContainer.widthAnchor.constrain(constant: 30)
        pointsContainer.heightAnchor.constrain(constant: 30)
        pointsContainer.topAnchor.constrain(anchor: profilePictureImageView.topAnchor)
        
        pointsLabel.centerXAnchor.constrain(anchor: pointsContainer.centerXAnchor)
        pointsLabel.centerYAnchor.constrain(anchor: pointsContainer.centerYAnchor)
        
    }
}

