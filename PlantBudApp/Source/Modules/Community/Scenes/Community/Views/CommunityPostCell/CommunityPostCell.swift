//
//  CommunityPostCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import UIKit

final class CommunityPostCell: UITableViewCell {
    
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
        let view = UIStackView(arrangedSubviews: [postImageView, postBodyLabel, postCommentCountLabel, commentCell])
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
    
    public lazy var commentCell: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.setShadow(cornerRadius: 12)
        
        return view
    }()
    
    lazy var commentUserProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.setImage(with: URL(string: "https://pbs.twimg.com/media/DcRh4f7XcAAa3D-?format=jpg&name=360x360"))
        commentCell.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
        
    }()
    
    public lazy var commentUsernameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 16)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.text = "USERNAMETEST"
        
        commentCell.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    public lazy var commentBodyLabel: UILabel = { //zmien na textView
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 12)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.text = "COMMENT TEST salkdhsak sdalkasdj;laskdjsad;lk sad;lkfjsadhhj sad;lkfjsadl;kfj sadl;kfjsadlkfyuieuiewuf nbsadf;sadoilfaopsidfhjasdf  sadf;lsakdfjl;aksdjfl;kasd  asdl;fkjasdlfuuoiejnasdlkf;lsadi"
        commentCell.addSubviewsUsingAutoLayout(label)
        
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
        postContentSctackView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        postContentSctackView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        postContentSctackView.trailingAnchor.constrain(anchor: postImageView.trailingAnchor, constant: -12)
        
        postImageView.widthAnchor.constrain(constant: UIScreen.main.bounds.width - 48)
        postImageView.heightAnchor.constrain(anchor: postImageView.widthAnchor)
        
//        commentCell.topAnchor.constrain(anchor: postContentSctackView.bottomAnchor, constant: 12)
//        commentCell.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
//        commentCell.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
//        commentCell.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        
        commentUserProfileImageView.heightAnchor.constrain(constant: 30)
        commentUserProfileImageView.widthAnchor.constrain(anchor: commentUserProfileImageView.heightAnchor)
        commentUserProfileImageView.leadingAnchor.constrain(anchor: commentCell.leadingAnchor, constant: 6)
        commentUserProfileImageView.topAnchor.constrain(anchor: commentCell.topAnchor, constant: 6)
        
        commentUsernameLabel.leadingAnchor.constrain(anchor: commentUserProfileImageView.trailingAnchor, constant: 12)
        commentUsernameLabel.trailingAnchor.constrain(anchor: commentCell.trailingAnchor)
        commentUsernameLabel.centerYAnchor.constrain(anchor: commentUserProfileImageView.centerYAnchor)
        
        commentBodyLabel.topAnchor.constrain(anchor: commentUserProfileImageView.bottomAnchor)
        commentBodyLabel.bottomAnchor.constrain(anchor: commentCell.bottomAnchor, constant: -6)
        commentBodyLabel.leadingAnchor.constrain(anchor: commentUsernameLabel.leadingAnchor)
        commentBodyLabel.trailingAnchor.constrain(anchor: commentUsernameLabel.trailingAnchor)
    }
}




