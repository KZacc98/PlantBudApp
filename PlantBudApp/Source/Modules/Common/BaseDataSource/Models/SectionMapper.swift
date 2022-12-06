//
//  SectionMapper.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import Foundation

class SectionMapper {
    static func map(sections: [SectionInterface]) -> [IndexPath: ReusableViewConfiguratorInterface] {
        return sections.enumerated().map { (column, section) in
            section.cellConfigurators.enumerated().map({ (row, cell) in
                (IndexPath(row: row, section: column), cell)
            })
            }.reduce([],+)
            .reduce(into: [IndexPath: ReusableViewConfiguratorInterface]()) { (dictionary, tuple) in
                dictionary[tuple.0] = tuple.1
        }
    }
}
