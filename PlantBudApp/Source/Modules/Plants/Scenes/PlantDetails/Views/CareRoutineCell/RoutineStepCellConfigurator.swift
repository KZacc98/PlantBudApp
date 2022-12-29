//
//  RoutineStepCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/12/2022.
//

import UIKit

final class RoutineStepCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: RoutineStepCellData
    
    // MARK: - Initialization
    
    init(data: RoutineStepCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
    @objc private func didPressCheckbox(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressCheckbox?()
    }
    
}

// MARK: - ReusableViewConfiguratorInterface

extension RoutineStepCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return RoutineStepCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? RoutineStepCell else { return }
        
        view.selectionStyle = .none
        view.stepLabel.text = data.title
        view.backgroundColor = Color.brandWhite
        view.mainBackgroundView.backgroundColor = data.check ? Color.red : Color.brandGreen
        view.mainBackgroundView.gestureRecognizers?.forEach {
            view.mainBackgroundView.removeGestureRecognizer($0)
        }
        view.mainBackgroundView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressCheckbox(tapGestureRecognizer:))))
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

