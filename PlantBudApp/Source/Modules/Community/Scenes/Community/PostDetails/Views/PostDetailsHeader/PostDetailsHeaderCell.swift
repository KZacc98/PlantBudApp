//
//  PostDetailsHeaderCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 11/01/2023.
//

import UIKit

final class PostDetailsHeaderCell: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var userInfoHeader: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.setImage(with: URL(string: "https://pbs.twimg.com/media/DcRh4f7XcAAa3D-?format=jpg&name=360x360"))
        userInfoHeader.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
        
    }()
    
    public lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 16)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.text = "USERNAMETEST"
        
        userInfoHeader.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    lazy var postContentSctackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [postImageView, postBodyLabel])
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 10
        view.axis = .vertical
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    public lazy var postChinView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.layer.borderWidth = 0.2
        view.layer.borderColor = Color.brandBlack.withAlphaComponent(0.5).cgColor
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var postPointsLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        postChinView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    
//    lazy var postUpVoteImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.clipsToBounds = true
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(systemName: "arrow.up.circle.fill")
//        imageView.tintColor = Color.brandBlack
//        imageView.widthAnchor.constrain(constant: 30)
//        imageView.heightAnchor.constrain(constant: 30)
//        postChinView.addSubviewsUsingAutoLayout(imageView)
//
//        return imageView
//    }()
//
//    lazy var postDownVoteImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(systemName: "arrow.down.circle.fill")
//        imageView.tintColor = Color.brandBlack
//        imageView.widthAnchor.constrain(constant: 30)
//        imageView.heightAnchor.constrain(constant: 30)
//        postChinView.addSubviewsUsingAutoLayout(imageView)
//
//        return imageView
//    }()
    
    lazy var postOptionsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "ellipsis")
        imageView.tintColor = Color.brandBlack
        imageView.widthAnchor.constrain(constant: 30)
        imageView.heightAnchor.constrain(constant: 30)
        postChinView.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
    }()
    
    public lazy var postBodyLabel: UILabel = { //zmien na textView
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 12)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    public lazy var postCommentCountLabel: UILabel = { //zmien na textView
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 12)
        label.textColor = Color.brandBlack.withAlphaComponent(0.5)
        label.text = "2 more comments"
        label.textAlignment = .left
        label.numberOfLines = 0
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
            insets: .zero
        )
        
        userInfoHeader.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        userInfoHeader.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        userInfoHeader.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        
        userProfileImageView.heightAnchor.constrain(constant: 30)
        userProfileImageView.widthAnchor.constrain(anchor: userProfileImageView.heightAnchor)
        userProfileImageView.leadingAnchor.constrain(anchor: userInfoHeader.leadingAnchor)
        userProfileImageView.topAnchor.constrain(anchor: userInfoHeader.topAnchor)
        userProfileImageView.bottomAnchor.constrain(anchor: userInfoHeader.bottomAnchor)
        
        usernameLabel.leadingAnchor.constrain(anchor: userProfileImageView.trailingAnchor, constant: 12)
        usernameLabel.trailingAnchor.constrain(anchor: userInfoHeader.trailingAnchor)
        usernameLabel.centerYAnchor.constrain(anchor: userProfileImageView.centerYAnchor)
        
        postContentSctackView.topAnchor.constrain(anchor: userInfoHeader.bottomAnchor, constant: 12)
        postContentSctackView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        postContentSctackView.trailingAnchor.constrain(anchor: postImageView.trailingAnchor, constant: -12)
        
        postChinView.topAnchor.constrain(anchor: postContentSctackView.bottomAnchor, constant: 12)
        postChinView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        postChinView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        postChinView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
        postChinView.heightAnchor.constrain(constant: 50)
        
        postPointsLabel.topAnchor.constrain(anchor: postChinView.topAnchor)
        postPointsLabel.bottomAnchor.constrain(anchor: postChinView.bottomAnchor)
        postPointsLabel.leadingAnchor.constrain(anchor: postChinView.leadingAnchor, constant: 12)
        postPointsLabel.trailingAnchor.constrain(anchor: postOptionsImageView.leadingAnchor, constant: -25)
        
        postOptionsImageView.topAnchor.constrain(anchor: postChinView.topAnchor)
        postOptionsImageView.bottomAnchor.constrain(anchor: postChinView.bottomAnchor)
        postOptionsImageView.trailingAnchor.constrain(anchor: postChinView.trailingAnchor, constant: -12)
        
//        postUpVoteImageView.topAnchor.constrain(anchor: postChinView.topAnchor)
//        postUpVoteImageView.bottomAnchor.constrain(anchor: postChinView.bottomAnchor)
//        postUpVoteImageView.leadingAnchor.constrain(anchor: postOptionsImageView.trailingAnchor, constant: 40)
//
//        postDownVoteImageView.topAnchor.constrain(anchor: postChinView.topAnchor)
//        postDownVoteImageView.bottomAnchor.constrain(anchor: postChinView.bottomAnchor)
//        postDownVoteImageView.trailingAnchor.constrain(anchor: postChinView.trailingAnchor, constant: -25)
        
        postImageView.widthAnchor.constrain(constant: UIScreen.main.bounds.width - 24)
        postImageView.heightAnchor.constrain(anchor: postImageView.widthAnchor)
        
    }
}








