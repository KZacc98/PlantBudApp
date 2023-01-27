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
        view.setShadow(shadowOpacity: 0.5)
        view.layer.cornerRadius = 12
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var plantsCountContainer: UIStackView = {
        let view = UIStackView(arrangedSubviews: [plantsCountLabel, plantsNumberLabel])
        view.axis = .vertical
        view.distribution = .fill
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var plantsCountLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.text = "userProfileCellPlantsLabel".localized
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    public lazy var plantsNumberLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 36)
        label.textColor = Color.brandBlack
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    lazy var profilePictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
        
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
            to: contentView.safeAreaLayoutGuide,
            insets: UIEdgeInsets(top: 12, left: 12, bottom: -12, right: -12)
        )
        
        profilePictureImageView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 36)
        profilePictureImageView.topAnchor.constrain(anchor: helloLabel.bottomAnchor, constant: 12)
        profilePictureImageView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        profilePictureImageView.widthAnchor.constrain(constant: 100)
        profilePictureImageView.heightAnchor.constrain(anchor: profilePictureImageView.widthAnchor)

        helloLabel.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        helloLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        helloLabel.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)

        plantsCountContainer.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -36)
        plantsCountContainer.topAnchor.constrain(anchor: helloLabel.bottomAnchor, constant: 12)
        plantsCountContainer.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        

        
    }
}

