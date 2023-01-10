//
//  CurrentBadgeCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 29/12/2022.
//

import UIKit

final class CurrentBadgeCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: CurrentBadgeCellData
    
    // MARK: - Initialization
    
    init(data: CurrentBadgeCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
//    @objc private func didTapPlant(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didTapPlant?()
//    }
}

// MARK: - ReusableViewConfiguratorInterface

extension CurrentBadgeCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return CurrentBadgeCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? CurrentBadgeCell else { return }
        
        let color = data.points >= 0 ? Color.brandGreen : .red
        let points = data.points >= 0 ? "+\(data.points)" : "\(data.points)"
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.badgeNameLabel.text = data.badgeName
        view.badgeImageView.setImage(with: URL(string: data.imageUrl))
        view.badgePointsBubble.backgroundColor = color
        view.badgePointsBubble.setShadow(shadowOpacity: 1.0, shadowColor: color)
        view.bubblePointsLabel.text = points
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}


struct CurrentBadgeCellData {
    let points: Int
    let badgeName: String
    let imageUrl: String
}




