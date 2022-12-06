//
//  SingleColumnSection.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import Foundation

struct SingleColumnSection: SectionInterface {
    var cellConfigurators: [ReusableViewConfiguratorInterface]
    var headerConfigurator: ReusableViewConfiguratorInterface?
    var footerConfigurator: ReusableViewConfiguratorInterface?
    
    var isEmpty: Bool {
        return cellConfigurators.isEmpty && headerConfigurator == nil && footerConfigurator == nil
    }
    
    init(cellConfigurators: [ReusableViewConfiguratorInterface],
         headerConfigurator: ReusableViewConfiguratorInterface? = nil,
         footerConfigurator: ReusableViewConfiguratorInterface? = nil) {
        self.cellConfigurators = cellConfigurators
        self.headerConfigurator = headerConfigurator
        self.footerConfigurator = footerConfigurator
    }
}

