//
//  LoginCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 12/01/2023.
//

import UIKit

final class LoginCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: String
    
    let profilePicturePlaceholder: String = "https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg"
    
    // MARK: - Initialization
    
    init(data: String) {
        self.data = data
    }
    
    // MARK: - Selectors
    
//    @objc private func didPressPostOptions(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didPressPostOptions?()
//    }
//
//    @objc private func didPressUpVote(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didPressUpVote?()
//    }
//
//    @objc private func didPressDownVote(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didPressDownVote?()
//    }
//
//    @objc private func didPressUserHeader(tapGestureRecognizer: UITapGestureRecognizer) {
////        data.didPressComment?()
//        Logger.info("UserHeader Pressed")
//    }
}

// MARK: - ReusableViewConfiguratorInterface

extension LoginCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return LoginCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? LoginCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
//        view.userProfileImageView.setImage(with: URL(string: profilePicturePlaceholder))
//        view.usernameLabel.text = data.postDomain.userName
//        view.postBodyLabel.text = data.postDomain.postBody
//        view.postPointsLabel.text = postPoints > 0 ? "Points: +\(postPoints)" : "Points: \(postPoints)"
//
//        view.userInfoHeader.gestureRecognizers?.forEach {
//            view.userInfoHeader.removeGestureRecognizer($0)
//        }
//
//        view.userInfoHeader.addGestureRecognizer(
//            UITapGestureRecognizer(
//                target: self,
//                action: #selector(didPressUserHeader(tapGestureRecognizer:))))
        
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
        return UIScreen.main.bounds.height
    }
}




