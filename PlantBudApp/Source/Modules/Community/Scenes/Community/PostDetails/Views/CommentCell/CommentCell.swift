//
//  CommentCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 12/01/2023.
//

import UIKit

final class CommentCell: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.setShadow(cornerRadius: 12,
                       shadowOpacity: 0.1,
                       shadowRadius: 4,
                       shadowOffset: .zero,
                       shadowColor: Color.black)
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    
    public lazy var commentCell: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.setShadow(cornerRadius: 12)
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var commentUserProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
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
        
        mainBackgroundView.fill(with: commentCell, to: mainBackgroundView.safeAreaLayoutGuide)
        
        commentUserProfileImageView.heightAnchor.constrain(constant: 30)
        commentUserProfileImageView.widthAnchor.constrain(anchor: commentUserProfileImageView.heightAnchor)
        commentUserProfileImageView.leadingAnchor.constrain(anchor: commentCell.leadingAnchor, constant: 6)
        commentUserProfileImageView.topAnchor.constrain(anchor: commentCell.topAnchor, constant: 6)
        
        commentUsernameLabel.leadingAnchor.constrain(anchor: commentUserProfileImageView.trailingAnchor, constant: 12)
        commentUsernameLabel.trailingAnchor.constrain(anchor: commentCell.trailingAnchor)
        commentUsernameLabel.centerYAnchor.constrain(anchor: commentUserProfileImageView.centerYAnchor)
        
        commentBodyLabel.topAnchor.constrain(anchor: commentUserProfileImageView.bottomAnchor)
        commentBodyLabel.bottomAnchor.constrain(anchor: commentCell.bottomAnchor, constant: -6)
        commentBodyLabel.leadingAnchor.constrain(anchor: commentUsernameLabel.leadingAnchor, constant: -6)
        commentBodyLabel.trailingAnchor.constrain(anchor: commentUsernameLabel.trailingAnchor)
        
    }
}








