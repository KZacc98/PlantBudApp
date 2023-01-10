//
//  CommunityCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import UIKit

final class CommunityCell: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.setShadow(shadowOpacity: 0.5)
        view.layer.cornerRadius = 12
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var communityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
        
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [communityNameLabel, plantStateLabel])
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 10
        view.axis = .vertical
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var communityNameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    public lazy var plantStateLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        
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
            insets: UIEdgeInsets(top: 12, left: 12, bottom: -12, right: -12)
        )
        
        communityImageView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
        communityImageView.bottomAnchor.constrain(anchor: stackView.topAnchor, constant: -12)
        communityImageView.heightAnchor.constrain(constant: 150)
        communityImageView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        communityImageView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        
        stackView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        stackView.trailingAnchor.constrain(anchor: communityImageView.trailingAnchor, constant: -12)
        stackView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
    }
}



