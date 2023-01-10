//
//  BadgeCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 29/12/2022.
//

import UIKit

final class BadgeCell: UITableViewCell {
    
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
    
    public lazy var badgeImageContainer: UIView = {
        let view = UIView()
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
        view.layer.cornerRadius = 7.5
        view.backgroundColor = Color.brandGreen
        
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var bubblePointsLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 12)
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
        label.font = Font.noticiaBold(size: 16)
        label.textColor = Color.brandBlack
        label.text = "BadgeName"
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var badgeInfoLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 12)
        label.textColor = Color.brandBlack
        label.text = "BadgeInfo;slkdjfhsd alkjfha;sldk jhflk;asdjfl; kasdjfl;ksadjfl ;kasdjfl;askdjfl;ksadjfl;skadjf;lksadjf;lkasdjfl;kasdjfl;kasdjfl;a ksdjfl;asdkjfl;ksadjfl;ksa djfl;kasdjfl;kas djfl;ksadjfl;ksadjfl;ksadjfl; ksadj fl;kasdjfl;k asdjfl;kasdjfl; ksadjf;lk asdjf;lkasdjf;laskdjf;lsadkjf;lkasdjf;lkasdjfl ;kasdjfl;ksadjfl;kasdjfl;ks adjfl;kasdjfl;ksad jfl;skda;j f;lksadjf;lasdkjf;lsadkjf ;ls akdjfl;ksadjf l;ksdaj f;lksadjf;lasd jf;lksadjf;lsa dkjfl;kads"
        label.textAlignment = .natural
        label.numberOfLines = 5
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
        
        badgeImageContainer.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -6)
        badgeImageContainer.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 6)
        badgeImageContainer.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -6)
        badgeImageContainer.widthAnchor.constrain(constant: 100)
        badgeImageContainer.heightAnchor.constrain(anchor: badgeImageView.widthAnchor)
        
        badgePointsBubble.bottomAnchor.constrain(anchor: badgeImageView.bottomAnchor)
        badgePointsBubble.trailingAnchor.constrain(anchor: badgeImageView.trailingAnchor)
        badgePointsBubble.widthAnchor.constrain(constant: 40)
        badgePointsBubble.heightAnchor.constrain(constant: 20)
        
        badgeNameLabel.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 6)
        badgeNameLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 6)
        badgeNameLabel.trailingAnchor.constrain(anchor: badgeImageView.leadingAnchor)
        
        badgeInfoLabel.topAnchor.constrain(anchor: badgeNameLabel.bottomAnchor)
        badgeInfoLabel.bottomAnchor.constrain(anchor: badgeImageContainer.bottomAnchor, constant: -6)
        badgeInfoLabel.leadingAnchor.constrain(anchor: badgeNameLabel.leadingAnchor, constant: 6)
        badgeInfoLabel.trailingAnchor.constrain(anchor: badgeImageContainer.leadingAnchor, constant: -12)

    }
}

