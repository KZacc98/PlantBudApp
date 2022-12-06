//
//  SectionInterface.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import Foundation

protocol SectionInterface {
    var headerConfigurator: ReusableViewConfiguratorInterface? { get }
    var footerConfigurator: ReusableViewConfiguratorInterface? { get }
    var cellConfigurators: [ReusableViewConfiguratorInterface] { get set }
    var isEmpty: Bool { get }
}
