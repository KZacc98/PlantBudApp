//
//  NoPlantsCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/01/2023.
//

import UIKit

final class NoDataCellConfigurator {
    
    // MARK: - Private properties
    
    private let message: String
    
    // MARK: - Initialization
    
    init(message: String) {
        self.message = message
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension NoDataCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return NoDataCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? NoDataCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.infoLabel.text = message
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}
