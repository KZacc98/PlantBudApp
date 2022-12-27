//
//  PlantDetailsHeaderCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 25/12/2022.
//

import UIKit

final class PlantDetailsHeaderCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: PlantDetailsCellData
    
    // MARK: - Initialization
    
    init(data: PlantDetailsCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
    @objc private func didTapPlant(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didTapPlant?()
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension PlantDetailsHeaderCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return PlantDetailsHeader.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? PlantDetailsHeader else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.plantNameLabel.text = data.plantName
        view.plantStateLabel.text = data.plantState.rawValue
        view.plantImage.setImage(with: data.imageUrl)
        view.plantImage.gestureRecognizers?.forEach {
            view.plantImage.removeGestureRecognizer($0)
        }
        view.plantImage.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didTapPlant(tapGestureRecognizer:))))
        
        //        view.plantImageView.imageView.setRoundedImage(with: data.imageUrl, cornerRadius: view.frame.size.width / 2)
        //        view.plantImageView.imageView.makeRounded()
        //        view.didPressButton = data.didPressButton
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}





