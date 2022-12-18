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
        view.helloLabel.text = data.name
        view.pointsLabel.text = data.points
        view.helloLabel.adjustsFontSizeToFitWidth = true
//        view.didPressButton = data.didPressButton
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct UserProfileCellData {
    let name: String
    let points: String
}


