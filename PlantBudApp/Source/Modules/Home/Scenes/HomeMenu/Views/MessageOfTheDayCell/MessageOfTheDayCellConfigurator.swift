//
//  MessageOfTheDayCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/12/2022.
//

import UIKit

final class MessageOfTheDayCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: String
    let messageOfTheDay = [
        "messageOfTheDay1".localized,
        "messageOfTheDay2".localized,
        "messageOfTheDay3".localized
    ]
    
    // MARK: - Initialization
    
    init(data: String) {
        self.data = data
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension MessageOfTheDayCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return MessageOfTheDayCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? MessageOfTheDayCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.plantsMeanStateCommentLabel.text = messageOfTheDay.randomElement() ?? "NO MESSAGE"
//        view.didPressButton = data.didPressButton
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
