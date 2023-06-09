//
//  PlantCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/12/2022.
//

#warning("przenieś do common")
import UIKit

final class PlantCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: PlantCellData
    
    // MARK: - Initialization
    
    init(data: PlantCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
    @objc private func didTapPlant(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didTapPlant?()
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension PlantCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return PlantCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? PlantCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.plantNameLabel.text = data.plantName
        view.plantStateLabel.text = data.plantState.caseNameWithEmoji()
        view.plantImage.setImage(with: data.imageUrl)
        view.mainBackgroundView.gestureRecognizers?.forEach {
            view.mainBackgroundView.removeGestureRecognizer($0)
        }
        view.mainBackgroundView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didTapPlant(tapGestureRecognizer:))))
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}




