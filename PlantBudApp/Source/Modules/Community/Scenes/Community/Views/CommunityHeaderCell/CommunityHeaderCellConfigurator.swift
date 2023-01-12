//
//  CommunityHeaderCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import UIKit

final class CommunityHeaderCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: CommunityHeaderCellData
    
    // MARK: - Initialization
    
    init(data: CommunityHeaderCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
//    @objc private func didTapPlant(tapGestureRecognizer: UITapGestureRecognizer) {
//        data.didTapPlant?()
//    }
}

// MARK: - ReusableViewConfiguratorInterface

extension CommunityHeaderCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return CommunityHeaderCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? CommunityHeaderCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.communityNameLabel.text = data.communityDomain.communityName
        view.communityImage.setImage(with: URL(string: data.communityDomain.communityBigImage))
        view.communityDescriptionLabel.text = data.communityDomain.communityDescription
//        view.plantImage.gestureRecognizers?.forEach {
//            view.plantImage.removeGestureRecognizer($0)
//        }
//        view.plantImage.addGestureRecognizer(
//            UITapGestureRecognizer(
//                target: self,
//                action: #selector(didTapPlant(tapGestureRecognizer:))))
        
        //        view.plantImageView.imageView.setRoundedImage(with: data.imageUrl, cornerRadius: view.frame.size.width / 2)
        //        view.plantImageView.imageView.makeRounded()
        //        view.didPressButton = data.didPressButton
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct CommunityHeaderCellData {
    let communityDomain: CommunityDomain
}




