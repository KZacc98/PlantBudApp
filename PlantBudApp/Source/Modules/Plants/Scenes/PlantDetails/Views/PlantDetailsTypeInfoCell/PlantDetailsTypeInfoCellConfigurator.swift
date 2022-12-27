//
//  PlantDetailsTypeInfoCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/12/2022.
//

import UIKit

final class PlantDetailsTypeInfoCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: PlantDetailsTypeInfoCellData
    
    // MARK: - Initialization
    
    init(data: PlantDetailsTypeInfoCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
    @objc private func didTapPlant(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didTapPlant?()
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension PlantDetailsTypeInfoCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return PlantDetailsTypeInfoCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? PlantDetailsTypeInfoCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.plantSpeciesLabel.text = data.plantType.species
        view.plantTypeLabel.text = data.plantType.type
        view.plantInfoLabel.text = data.plantType.description
        view.plantImage.setImage(with: data.imageUrl)
        
        //        view.plantImageView.imageView.setRoundedImage(with: data.imageUrl, cornerRadius: view.frame.size.width / 2)
        //        view.plantImageView.imageView.makeRounded()
        //        view.didPressButton = data.didPressButton
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}






