//
//  HelloHeaderCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class HelloHeaderCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: TestViewCellData
    
    // MARK: - Initialization
    
    init(data: TestViewCellData) {
        self.data = data
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension HelloHeaderCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return HelloHeaderCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? HelloHeaderCell else { return }
        
        view.selectionStyle = .none
        view.helloLabel.text = data.title
//        view.didPressButton = data.didPressButton
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct TestViewCellData {
    let title: String
//    let didPre
}

