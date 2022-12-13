//
//  PlantCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/12/2022.
//

import UIKit

final class PlantCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: PlantCellData
    
    // MARK: - Initialization
    
    init(data: PlantCellData) {
        self.data = data
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
        view.plantNameLabel.text = data.plantName
        view.plantStateLabel.text = data.plantState.rawValue
        view.plantImage.imageView.setImage(with: data.imageUrl)
        view.plantInfoLabel.text = data.plantTypeInfo
        //        view.plantImageView.imageView.setRoundedImage(with: data.imageUrl, cornerRadius: view.frame.size.width / 2)
        //        view.plantImageView.imageView.makeRounded()
        //        view.didPressButton = data.didPressButton
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct PlantCellData {
    let imageUrl: URL
    let plantName: String
    let plantState: PlantState
    let plantTypeInfo: String
    //    let didPre
}


