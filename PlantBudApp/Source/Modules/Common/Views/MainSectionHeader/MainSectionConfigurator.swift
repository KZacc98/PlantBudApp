//
//  MainSectionConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/12/2022.
//

import UIKit

final class MainSectionHeaderConfigurator {

    //MARK: - Private properties

    private let data: MainSectionHeaderData

    //MARK: - Initialization

    init(data: MainSectionHeaderData) {
        self.data = data
    }
}

//MARK: - ReusableViewConfiguratorInterface

extension MainSectionHeaderConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return MainSectionHeader.self
    }

    func configure(view: UIView) {
        guard let view = view as? MainSectionHeader else { return }

        view.titleLabel.text = data.title
        view.containerView.backgroundColor = data.containerBackgroundColor
        view.setupConstraints(insets: data.insets)
    }

    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

