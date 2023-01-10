//
//  PlantTypeCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import UIKit

final class PlantTypeCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: PlantTypeCellData
    
    // MARK: - Initialization
    
    init(data: PlantTypeCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
    @objc private func didTapPlantType(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didTapPlantType?()
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension PlantTypeCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return PlantTypeCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? PlantTypeCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.plantSpeciesLabel.text = data.plantType.species
        view.plantTypeLabel.text = data.plantType.type.description
        view.plantInfoLabel.text = data.plantType.description
        view.plantImage.setImage(with: data.imageUrl)
        
        view.mainBackgroundView.gestureRecognizers?.forEach {
            view.mainBackgroundView.removeGestureRecognizer($0)
        }
        view.mainBackgroundView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didTapPlantType(tapGestureRecognizer:))))
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}


