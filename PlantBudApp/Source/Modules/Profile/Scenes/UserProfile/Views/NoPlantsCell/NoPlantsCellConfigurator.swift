//
//  NoPlantsCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/01/2023.
//

import UIKit

final class NoPlantsCellConfigurator {
    
    // MARK: - Private properties
    
    private let fill: String?
    
    // MARK: - Initialization
    
    init(fill: String?) {
        self.fill = fill
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension NoPlantsCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return NoPlantsCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? NoPlantsCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

