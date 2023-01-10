//
//  CurrentBadgeCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 29/12/2022.
//

import UIKit

final class CurrentBadgeCell: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.layer.cornerRadius = 12
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var badgeImageContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 50
        view.setShadow(cornerRadius: 25, shadowOpacity: 0.25)
        view.backgroundColor = Color.brandGreen
        
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var badgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        
        badgeImageContainer.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
    }()
    
    public lazy var badgePointsBubble: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = Color.brandGreen
        
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var bubblePointsLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 16)
        label.textColor = Color.brandWhite
        label.text = "+300"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        badgePointsBubble.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var badgeNameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaBold(size: 24)
        label.textColor = Color.brandBlack
        label.text = "BadgeName"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
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
        
        badgeImageContainer.fill(with: badgeImageView, to: badgeImageContainer.safeAreaLayoutGuide)
        badgePointsBubble.fill(with: bubblePointsLabel, to: badgePointsBubble.safeAreaLayoutGuide)
        
        badgeImageContainer.centerXAnchor.constrain(anchor: mainBackgroundView.centerXAnchor)
        badgeImageContainer.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
        badgeImageContainer.widthAnchor.constrain(constant: 250)
        badgeImageContainer.heightAnchor.constrain(anchor: badgeImageView.widthAnchor)
        
        badgePointsBubble.bottomAnchor.constrain(anchor: badgeImageView.bottomAnchor, constant: 5)
        badgePointsBubble.trailingAnchor.constrain(anchor: badgeImageView.trailingAnchor, constant: 10)
        badgePointsBubble.widthAnchor.constrain(constant: 75)
        badgePointsBubble.heightAnchor.constrain(constant: 37.5)
        
        
        badgeNameLabel.topAnchor.constrain(anchor: badgePointsBubble.bottomAnchor)
        badgeNameLabel.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
        badgeNameLabel.leadingAnchor.constrain(anchor: badgeImageView.leadingAnchor)
        badgeNameLabel.trailingAnchor.constrain(anchor: badgeImageView.trailingAnchor)

    }
}
