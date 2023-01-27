//
//  CommunityPostCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import UIKit

final class CommunityPostCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: CommunityPostCellData
    
    let profilePicturePlaceholder: String = "https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg"
    
    // MARK: - Initialization
    
    init(data: CommunityPostCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
    @objc private func didPressComment(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressComment?()
    }
    @objc private func didPressPost(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressComment?()
    }
    @objc private func didPressPostOptions(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressPostOptions?()
    }
    
    @objc private func didPressUpVote(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressUpVote?()
    }
    
    @objc private func didPressDownVote(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressDownVote?()
    }
    
    @objc private func didPressUserHeader(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressComment?()
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension CommunityPostCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return CommunityPostCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? CommunityPostCell else { return }
        let postPoints = data.postDomain.points
        
        if let bestComment = getBestComment(comments: data.comments) {
            view.commentUsernameLabel.text = bestComment.userName
            view.commentBodyLabel.text = bestComment.commentBody
            view.commentBodyFillerLabel.isHidden = true
        } else {
            view.commentUsernameLabel.isHidden = true
            view.commentBodyLabel.isHidden = true
            view.commentUserProfileImageView.isHidden = true
            view.commentBodyFillerLabel.isHidden = false
            view.postCommentCountLabel.isHidden = true
            view.commentCell.heightAnchor.constrain(constant: 30)
        }
        
        if !(data.postDomain.image == "") {
            view.postImageView.setImage(with: URL(string: data.postDomain.image))
        } else {
            view.postImageView.isHidden = true
        }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.userProfileImageView.setImage(with: URL(string: profilePicturePlaceholder))
        view.usernameLabel.text = data.postUser.userName
        view.postBodyLabel.text = data.postDomain.postBody
        view.postPointsLabel.text = postPoints > 0 ? "\("postPoints".localized)\(postPoints)" : "\("postPoints".localized)\(postPoints)"
        view.postCommentCountLabel.text = "Comments: \(data.comments.count)"
        view.commentUserProfileImageView.setImage(with: URL(string: profilePicturePlaceholder))
        
        view.commentCell.gestureRecognizers?.forEach {
            view.commentCell.removeGestureRecognizer($0)
        }
        
        view.commentCell.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressComment(tapGestureRecognizer:))))
        
        view.mainBackgroundView.gestureRecognizers?.forEach {
            view.mainBackgroundView.removeGestureRecognizer($0)
        }
        
        view.mainBackgroundView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressPost(tapGestureRecognizer:))))
        
        view.userInfoHeader.gestureRecognizers?.forEach {
            view.userInfoHeader.removeGestureRecognizer($0)
        }
        
        view.userInfoHeader.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressUserHeader(tapGestureRecognizer:))))
        
        view.postUpVoteImageView.isUserInteractionEnabled = true
        view.postUpVoteImageView.gestureRecognizers?.forEach {
            view.postUpVoteImageView.removeGestureRecognizer($0)
        }
        
        view.postUpVoteImageView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressUpVote(tapGestureRecognizer:))))
        
        view.postDownVoteImageView.isUserInteractionEnabled = true
        view.postDownVoteImageView.gestureRecognizers?.forEach {
            view.postDownVoteImageView.removeGestureRecognizer($0)
        }
        
        view.postDownVoteImageView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressDownVote(tapGestureRecognizer:))))
        view.postOptionsImageView.isUserInteractionEnabled = true
        
        view.postOptionsImageView.gestureRecognizers?.forEach {
            view.postOptionsImageView.removeGestureRecognizer($0)
        }
        
        view.postOptionsImageView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressPostOptions(tapGestureRecognizer:))))
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func getBestComment(comments: [CommentDomain]) -> CommentDomain? {
        comments.sorted { $0.points > $1.points }.first
    }
}

struct CommunityPostCellData {
    let postUser: UserContentDataDomain
    let postDomain: PostDomain
    let commentUser: UserContentDataDomain
    let comments: [CommentDomain]
    let didPressComment: (() -> Void)?
    let didPressPostOptions: (() -> Void)?
    let didPressUpVote: (() -> Void)?
    let didPressDownVote: (() -> Void)?
}
