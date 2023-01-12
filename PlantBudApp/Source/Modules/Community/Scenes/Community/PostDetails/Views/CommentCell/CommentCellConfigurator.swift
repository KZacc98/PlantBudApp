//
//  CommentCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 12/01/2023.
//

import UIKit

final class CommentCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: CommentCellData
    
    let profilePicturePlaceholder: String = "https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg"
    
    // MARK: - Initialization
    
    init(data: CommentCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
    @objc private func didPressComment(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didPressComment?()
        Logger.info("CommentTapped")
    }
    
    @objc private func didPressPostOptions(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didPressPostOptions?()
    }
    
    @objc private func didPressUpVote(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didPressUpVote?()
    }
    
    @objc private func didPressDownVote(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didPressDownVote?()
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension CommentCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return CommentCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? CommentCell else { return }

        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.commentUserProfileImageView.setImage(with: URL(string: profilePicturePlaceholder))
        view.commentUsernameLabel.text = data.comment.userName
        view.commentBodyLabel.text = data.comment.commentBody
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
//
//        view.postUpVoteImageView.isUserInteractionEnabled = true
//        view.postUpVoteImageView.gestureRecognizers?.forEach {
//            view.postUpVoteImageView.removeGestureRecognizer($0)
//        }
//
//        view.postUpVoteImageView.addGestureRecognizer(
//            UITapGestureRecognizer(
//                target: self,
//                action: #selector(didPressUpVote(tapGestureRecognizer:))))
//
//        view.postDownVoteImageView.isUserInteractionEnabled = true
//        view.postDownVoteImageView.gestureRecognizers?.forEach {
//            view.postDownVoteImageView.removeGestureRecognizer($0)
//        }
//
//        view.postDownVoteImageView.addGestureRecognizer(
//            UITapGestureRecognizer(
//                target: self,
//                action: #selector(didPressDownVote(tapGestureRecognizer:))))
//        view.postOptionsImageView.isUserInteractionEnabled = true
//
//        view.postOptionsImageView.gestureRecognizers?.forEach {
//            view.postOptionsImageView.removeGestureRecognizer($0)
//        }
//
//        view.postOptionsImageView.addGestureRecognizer(
//            UITapGestureRecognizer(
//                target: self,
//                action: #selector(didPressPostOptions(tapGestureRecognizer:))))
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct CommentCellData {
    let comment: CommentDomain
//    let didPressComment: (() -> Void)?
//    let didPressPostOptions: (() -> Void)?
//    let didPressUpVote: (() -> Void)?
//    let didPressDownVote: (() -> Void)?
}
