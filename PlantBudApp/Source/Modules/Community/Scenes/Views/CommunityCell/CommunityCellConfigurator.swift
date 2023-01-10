//
//  CommunityCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import UIKit

final class CommunityCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: CommunityCellData
    
    // MARK: - Initialization
    
    init(data: CommunityCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
    @objc private func didPressCommunityTile(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressCommunityTile?()
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension CommunityCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return CommunityCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? CommunityCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.communityNameLabel.text = data.communityName
        view.plantStateLabel.text = "data.plantState.rawValue"
        view.communityImageView.setImage(with: URL(string: data.bigImage))
        view.mainBackgroundView.gestureRecognizers?.forEach {
            view.mainBackgroundView.removeGestureRecognizer($0)
        }
        view.mainBackgroundView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressCommunityTile(tapGestureRecognizer:))))
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct CommunityCellData {
    let communityName: String
    let bigImage: String
    let smallImage: String
    let didPressCommunityTile: (() -> Void)?
}





