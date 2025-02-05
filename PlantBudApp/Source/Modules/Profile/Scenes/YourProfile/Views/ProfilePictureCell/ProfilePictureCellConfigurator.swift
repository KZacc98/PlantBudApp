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
    let profilePicturePlaceholder: String = "https://res.cloudinary.com/dv1dmymg2/image/upload/v1674924697/PlantBuddy/Placeholders/UserImagePlaceholderLight_hthfkm.png"
    
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
