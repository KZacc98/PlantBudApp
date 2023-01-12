//
//  CommunityHeaderCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import UIKit

final class CommunityHeaderCell: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.clipsToBounds = true
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var communityImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
        
    }()
    
    public lazy var communityNameContainer: UIView = {
        let gradientView = UIView()
        gradientView.backgroundColor = Color.brandWhite
        mainBackgroundView.addSubviewsUsingAutoLayout(gradientView)
        
        return gradientView
    }()
    
    public lazy var communityNameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        communityNameContainer.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var communityDescriptionView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.layer.borderWidth = 0.2
        view.layer.borderColor = Color.brandBlack.withAlphaComponent(0.5).cgColor
        view.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var communityDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 12)
        label.textColor = Color.brandBlack
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        communityDescriptionView.addSubviewsUsingAutoLayout(label)
        
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
            insets: .zero
        )
        
        communityImage.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
        communityImage.bottomAnchor.constrain(anchor: communityNameContainer.topAnchor)
        communityImage.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        communityImage.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        
        communityImage.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
        communityImage.bottomAnchor.constrain(anchor: communityNameContainer.topAnchor)
        communityImage.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        communityImage.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        
        communityNameContainer.topAnchor.constrain(anchor: communityImage.bottomAnchor)
        communityNameContainer.leadingAnchor.constrain(anchor: communityImage.leadingAnchor)
        communityNameContainer.trailingAnchor.constrain(anchor: communityImage.trailingAnchor)
        communityNameContainer.heightAnchor.constrain(constant: 50)
        
        communityNameLabel.centerXAnchor.constrain(anchor: communityNameContainer.centerXAnchor)
        communityNameLabel.centerYAnchor.constrain(anchor: communityNameContainer.centerYAnchor)
        
        communityDescriptionView.topAnchor.constrain(anchor: communityNameContainer.bottomAnchor)
        communityDescriptionView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
        communityDescriptionView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        communityDescriptionView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        
        communityDescriptionLabel.topAnchor.constrain(anchor: communityDescriptionView.topAnchor, constant: 12)
        communityDescriptionLabel.bottomAnchor.constrain(anchor: communityDescriptionView.bottomAnchor,constant: -12)
        communityDescriptionLabel.leadingAnchor.constrain(anchor: communityDescriptionView.leadingAnchor, constant: 12)
        communityDescriptionLabel.trailingAnchor.constrain(anchor: communityDescriptionView.trailingAnchor, constant: -12)
    }
}




