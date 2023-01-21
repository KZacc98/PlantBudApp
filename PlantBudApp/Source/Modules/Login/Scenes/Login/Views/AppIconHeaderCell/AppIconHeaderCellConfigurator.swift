//
//  AppIconHeaderCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 21/01/2023.
//

import UIKit

internal final class AppIconHeaderCellConfigurator {
    // MARK: - Private properties
    
    private let data: String
    
    // MARK: - Initialization
    
    init(data: String) {
        self.data = data
    }
}

extension AppIconHeaderCellConfigurator: ReusableViewConfiguratorInterface  {
    var type: AnyClass {
        return AppIconHeaderCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? AppIconHeaderCell else { return }
        
        view.backgroundColor = Color.brandWhite
        view.appIconView.image = UIImage(named: "AppIcon")
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        UITableView.automaticDimension
    }
    
}
