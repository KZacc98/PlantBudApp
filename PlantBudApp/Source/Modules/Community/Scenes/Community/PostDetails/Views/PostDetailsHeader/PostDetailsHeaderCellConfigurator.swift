//
//  PostDetailsHeaderCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 11/01/2023.
//

import UIKit

final class PostDetailsHeaderCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: PostDetailsHeaderCellData
    
    let profilePicturePlaceholder: String = "https://res.cloudinary.com/dv1dmymg2/image/upload/v1674924697/PlantBuddy/Placeholders/UserImagePlaceholderLight_hthfkm.png"
    
    // MARK: - Initialization
    
    init(data: PostDetailsHeaderCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
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
//        data.didPressComment?()
        Logger.info("UserHeader Pressed")
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension PostDetailsHeaderCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return PostDetailsHeaderCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? PostDetailsHeaderCell else { return }
        let postPoints = data.postDomain.points
        
        if !(data.postDomain.image == "") {
            view.postImageView.setImage(with: URL(string: data.postDomain.image))
        } else {
            view.postImageView.isHidden = true
        }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.userProfileImageView.setImage(with: URL(string: profilePicturePlaceholder))
        view.usernameLabel.text = data.postDomain.userName
        view.postBodyLabel.text = data.postDomain.postBody
        view.postPointsLabel.text = postPoints > 0 ? "\("postPoints".localized)\(postPoints)" : "\("postPoints".localized)\(postPoints)"
        
        view.userInfoHeader.gestureRecognizers?.forEach {
            view.userInfoHeader.removeGestureRecognizer($0)
        }
        
        view.userInfoHeader.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressUserHeader(tapGestureRecognizer:))))
        
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
}

struct PostDetailsHeaderCellData {
    let postDomain: PostDomain
    let didPressPostOptions: (() -> Void)?
    let didPressUpVote: (() -> Void)?
    let didPressDownVote: (() -> Void)?
}

