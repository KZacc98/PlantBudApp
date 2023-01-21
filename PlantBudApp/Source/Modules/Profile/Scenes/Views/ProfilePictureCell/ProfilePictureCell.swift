//
//  ProfilePictureCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 21/01/2023.
//

import UIKit

final class ProfilePictureCell: UITableViewCell {
    
    // MARK: - Public properties
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.setShadow(shadowOpacity: 0.5)
        view.layer.cornerRadius = 12
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var profilePictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 150
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
        profilePictureImageView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        profilePictureImageView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        profilePictureImageView.widthAnchor.constrain(constant: 300)
        profilePictureImageView.heightAnchor.constrain(anchor: profilePictureImageView.widthAnchor)
        
    }
}


