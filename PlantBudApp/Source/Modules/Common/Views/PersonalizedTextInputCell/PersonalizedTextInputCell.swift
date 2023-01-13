//
//  CommentTextFieldCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 12/01/2023.
//

import UIKit

final class CommentTextFieldCell: UITableViewCell {

    //MARK: - Public properties
    
    public var textViewDidEndEditing: ((String?) -> ())?
    public var textViewDidChange: ((String?) -> ())?
    public var textViewShouldChangeInRange: ((UITextView, NSRange, String) -> (Bool))?

    public lazy var shadowBackdropView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.setShadow(cornerRadius: 8,
                       shadowOpacity: 0.1,
                       shadowRadius: 4,
                       shadowOffset: .zero,
                       shadowColor: Color.black)
        view.backgroundColor = Color.brandWhite
        shadowBackdropView.addSubviewsUsingAutoLayout(view)

        return view
    }()

    public lazy var cornerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    
    lazy var userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
    }()
    
    lazy var addCommentButtonContainer: UIView = {
        let view = UIView()
        view.setShadow(cornerRadius: 15,
                       shadowOpacity: 0.9,
                       shadowRadius: 4,
                       shadowOffset: .zero,
                       shadowColor: Color.brandGreen)
        view.backgroundColor = Color.brandGreen
        mainBackgroundView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    
    lazy var addCommentButton: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.tintColor = Color.brandWhite
        view.image = UIImage(systemName: "plus.bubble.fill")
        view.sizeToFit()
        addCommentButtonContainer.addSubviewsUsingAutoLayout(view)
        
        return view
    }()

    public lazy var commentTextView: UITextView = {
        let textView = UITextView()
        textView.tintColor = Color.brandBlack
        textView.textColor = Color.brandBlack
        textView.isScrollEnabled = false
        textView.font = Font.noticiaRegular(size: 14)
        textView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        textView.delegate = self
        cornerView.addSubviewsUsingAutoLayout(textView)

        return textView
    }()
    
    //MARK: - Private properties
    
    private lazy var textViewHeightConstrain: NSLayoutConstraint = {
        return commentTextView.heightAnchor.constrain(.greaterThanOrEqual, constant: 100.deviceSizeAware)
    }()

    //MARK: - Initialization

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupAutoLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupAutoLayout()
    }
    
    //MARK: - Access methods
    
    public func setTextViewHeight(height: CGFloat) {
        textViewHeightConstrain.constant = height
    }

    //MARK: - Setup

    private func setupAutoLayout() {
        contentView.fill(with: shadowBackdropView,
                         to: contentView.safeAreaLayoutGuide)
        
        shadowBackdropView.fill(with: mainBackgroundView,
                                to: shadowBackdropView.safeAreaLayoutGuide,
                                insets: UIEdgeInsets(top: 12, left: 12, bottom: -12, right: -12))

        cornerView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 6)
        cornerView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -6)
        cornerView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -6)
        cornerView.leadingAnchor.constrain(anchor: userProfileImageView.trailingAnchor, constant: 6)
        
        userProfileImageView.heightAnchor.constrain(constant: 30)
        userProfileImageView.widthAnchor.constrain(anchor: userProfileImageView.heightAnchor)
        userProfileImageView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 6)
        userProfileImageView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 6)
        
        addCommentButtonContainer.heightAnchor.constrain(constant: 30)
        addCommentButtonContainer.widthAnchor.constrain(anchor: addCommentButtonContainer.heightAnchor)
        addCommentButtonContainer.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 6)
        addCommentButtonContainer.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -6)
        
        addCommentButtonContainer.fill(with: addCommentButton, to: addCommentButtonContainer.safeAreaLayoutGuide, insets: UIEdgeInsets(top: 5, left: 5, bottom: -5, right: -5))
        
        cornerView.fill(with: commentTextView, to: cornerView.safeAreaLayoutGuide)

    }
}

//MARK: - UITextViewDelegate

extension CommentTextFieldCell: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        textViewDidChange?(textView.text)
    }

    public func textViewDidEndEditing(_ textView: UITextView) {
        textViewDidEndEditing?(textView.text)
    }

    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if let shouldChange = textViewShouldChangeInRange?(textView, range, text) {
            return shouldChange
        } else {
            return true
        }
    }
}
