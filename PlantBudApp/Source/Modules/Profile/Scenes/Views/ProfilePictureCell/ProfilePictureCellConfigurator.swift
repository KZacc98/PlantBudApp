//
//  ProfilePictureCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 21/01/2023.
//

import UIKit

final class ProfilePictureCellConfigurator {
    
    // MARK: - Private properties
    
    private let imageUrl: String?
    let profilePicturePlaceholder: String = "https://st3.depositphotos.com/6672868/13701/v/450/depositphotos_137014128-stock-illustration-user-profile-icon.jpg"
    
    // MARK: - Initialization
    
    init(imageUrl: String?) {
        self.imageUrl = imageUrl
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension ProfilePictureCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return ProfilePictureCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? ProfilePictureCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.profilePictureImageView.setImage(with: URL(string: imageUrl ?? profilePicturePlaceholder))
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}


