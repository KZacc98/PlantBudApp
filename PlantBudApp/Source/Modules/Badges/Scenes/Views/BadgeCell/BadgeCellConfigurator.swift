//
//  BadgeCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 29/12/2022.
//

import UIKit

final class BadgeCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: BadgeCellData
    
    // MARK: - Initialization
    
    init(data: BadgeCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
//    @objc private func didTapPlant(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didTapPlant?()
//    }
}

// MARK: - ReusableViewConfiguratorInterface

extension BadgeCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return BadgeCell.self
    }
    
    var placeholder: String {
        return "https://res.cloudinary.com/dv1dmymg2/image/upload/c_scale,e_grayscale,w_512/v1672321511/PlantBuddy/Badges/BadgeRegular_f3sf40.png"
    }
    
    func configure(view: UIView) {
        guard let view = view as? BadgeCell else { return }
        let color: UIColor
        if data.points > 0 {
            color = Color.brandGreen
        } else if data.points == 0 {
            color = Color.darkGray
        } else {
            color = .red
        }
        
        let points = data.points >= 0 ? "+\(data.points)" : "\(data.points)"
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.badgeNameLabel.text = data.badgeName
        view.badgeImageView.setImage(with: URL(string: data.isCompleted ? data.imageUrl : placeholder))
        view.badgePointsBubble.backgroundColor = color
        view.badgePointsBubble.setShadow(shadowOpacity: 1.0, shadowColor: color)
        view.bubblePointsLabel.text = points
        view.badgeInfoLabel.text = data.badgeInfo
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}


struct BadgeCellData {
    let points: Int
    let badgeName: String
    let imageUrl: String
    let badgeInfo: String
    let isCompleted: Bool
}





