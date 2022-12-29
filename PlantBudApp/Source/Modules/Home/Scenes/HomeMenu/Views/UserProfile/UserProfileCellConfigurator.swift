//
//  UserProfileCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/12/2022.
//

import UIKit

final class UserProfileCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: UserProfileCellData
    
    // MARK: - Initialization
    
    init(data: UserProfileCellData) {
        self.data = data
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension UserProfileCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return UserProfileCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? UserProfileCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.helloLabel.text = data.name
        view.plantsNumberLabel.text = data.plantCount
        view.helloLabel.adjustsFontSizeToFitWidth = true
        view.profilePictureImageView.setImage(with: URL(string: data.profilePictureUrl))
//        view.didPressButton = data.didPressButton
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct UserProfileCellData {
    let name: String
    let plantCount: String
    let profilePictureUrl: String
}


