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
    
//    @objc private func didPressCommunityTile(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didPressCommunityTile?()
//    }
}

// MARK: - ReusableViewConfiguratorInterface

extension CommunityPostCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return CommunityPostCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? CommunityPostCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
//        view.userProfileImageView.setImage(with: URL(string: profilePicturePlaceholder))
        view.usernameLabel.text = data.postUser.userName
        if !(data.postImage == "") {
            view.postImageView.setImage(with: URL(string: data.postImage))
        } else {
            view.postImageView.isHidden = true
        }
        view.postBodyLabel.text = data.postBody
        
        view.postCommentCountLabel.text = "Comments: \(data.comments.count)"
//        view.commentUserProfileImageView.setImage(with: URL(string: profilePicturePlaceholder))
        view.commentUsernameLabel.text = data.commentUser.userName
        view.commentBodyLabel.text = data.comments.first?.commentBody ?? "NO COMMENTS"
//        view.mainBackgroundView.gestureRecognizers?.forEach {
//            view.mainBackgroundView.removeGestureRecognizer($0)
//        }
//        view.mainBackgroundView.addGestureRecognizer(
//            UITapGestureRecognizer(
//                target: self,
//                action: #selector(didPressCommunityTile(tapGestureRecognizer:))))
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct CommunityPostCellData {
    let postUser: UserContentDataDomain
    let postBody: String
    let postImage: String
    let commentUser: UserContentDataDomain
    let comments: [CommentDomain]
//    let didPressCommunityTile: (() -> Void)?
}






