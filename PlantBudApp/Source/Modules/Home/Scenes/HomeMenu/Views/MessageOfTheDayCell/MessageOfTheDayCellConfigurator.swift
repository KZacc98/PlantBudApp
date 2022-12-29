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
        "Our plants may not speak, but they surely do sing / When we give them the care that makes their leaves take wing. \n We water and fertilize, prune and protect \n So that our plants can thrive, and never neglect.",
        "Our plants are like our children, they need love and care \n Without it, they wilt and droop, and that just isn't fair. \n So we tend to them daily, with water and sunlight \n And watch them grow strong, it's a beautiful sight.",
        "Our plants may not have voices, but they have hearts \n And when they're well taken care of, they never fall apart. \n We water and prune and give them some cheer \n So they can grow tall and strong, all throughout the year."
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
