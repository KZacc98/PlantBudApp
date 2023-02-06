//
//  CommentTextFieldCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 12/01/2023.
//

import UIKit

final class CommentTextFieldCellConfigurator: NSObject {

    //MARK: - Private properties

    private var data: CommentTextFieldCellData
    private var textFieldValue: String?
    let profilePicturePlaceholder: String = "https://res.cloudinary.com/dv1dmymg2/image/upload/v1674924697/PlantBuddy/Placeholders/UserImagePlaceholderLight_hthfkm.png"

    //MARK: - Initialization

    init(data: CommentTextFieldCellData) {
        self.data = data
    }
    
    @objc private func didPressAddComment(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressAddComment?(textFieldValue)
    }
}

//MARK: - ReusableViewConfiguratorInterface

extension CommentTextFieldCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return CommentTextFieldCell.self
    }

    func configure(view: UIView) {
        guard let view = view as? CommentTextFieldCell else { return }

        view.selectionStyle = .none
        view.commentTextView.text = data.text
        view.userProfileImageView.setImage(with: URL(string: UserContext.shared.userProfile?.profilePicture ?? profilePicturePlaceholder))
        view.commentTextView.returnKeyType = data.returnTypeKey
        view.commentTextView.autocapitalizationType = data.autoCapitalizationType
        view.setTextViewHeight(height: data.textViewHeight)
        view.textViewDidEndEditing = data.textViewDidEndEditing
        view.textViewShouldChangeInRange = data.textViewShouldChangeInRange
        view.textViewDidChange = { [weak self] text in
            self?.data.text = text
            self?.textFieldValue = text
            self?.data.textViewDidChange?(text)
        }
        view.addCommentButton.isUserInteractionEnabled = true
        view.addCommentButton.gestureRecognizers?.forEach {
            view.addCommentButton.removeGestureRecognizer($0)
        }
        
        view.addCommentButton.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressAddComment(tapGestureRecognizer:))))
    }

    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

import UIKit

struct CommentTextFieldCellData {
    var text: String?
    var placeholder: String?
    let textViewHeight: CGFloat
    let maximumCommentTextLength: Int
    let returnTypeKey: UIReturnKeyType
    let autoCapitalizationType: UITextAutocapitalizationType
    var didPressAddComment: ((String?) -> Void)?
    var textViewDidChange: ((String?) -> Void)?
    var textViewDidEndEditing: ((String?) -> Void)?
    var textViewShouldChangeInRange: ((UITextView, NSRange, String) -> (Bool))?

    init(text: String? = nil,
         placeholder: String? = nil,
         textViewHeight: CGFloat,
         maximumCommentTextLength: Int,
         returnTypeKey: UIReturnKeyType = .default,
         autoCapitalizationType: UITextAutocapitalizationType = .sentences,
         didPressAddComment: ((String?) -> Void)?,
         textViewDidChange: ((String?) -> ())? = nil,
         textViewDidEndEditing: ((String?) -> ())? = nil,
         textViewShouldChangeInRange: ((UITextView, NSRange, String) -> (Bool))? = nil) {

        self.text = text
        self.placeholder = placeholder
        self.textViewHeight = textViewHeight
        self.maximumCommentTextLength = maximumCommentTextLength
        self.returnTypeKey = returnTypeKey
        self.autoCapitalizationType = autoCapitalizationType
        self.didPressAddComment = didPressAddComment
        self.textViewDidChange = textViewDidChange
        self.textViewDidEndEditing = textViewDidEndEditing
        self.textViewShouldChangeInRange = textViewShouldChangeInRange
    }
}

