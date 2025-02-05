//
//  StepFrequencyPickerCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/01/2023.
//

import UIKit

final class StepFrequencyPickerCellConfigurator: NSObject {

    //MARK: - Private properties

    private var data: StepFrequencyPickerCellData

    //MARK: - Initialization

    init(data: StepFrequencyPickerCellData) {
        self.data = data
    }
    
    @objc private func didPressDailyButton(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressDailyButton?()
    }
    
    @objc private func didPressWeeklyButton(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressWeeklyButton?()
    }
    
    @objc private func didPressMonthlyButton(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressMonthlyButton?()
    }
}

//MARK: - ReusableViewConfiguratorInterface

extension StepFrequencyPickerCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return StepFrequencyPickerCell.self
    }

    func configure(view: UIView) {
        guard let view = view as? StepFrequencyPickerCell else { return }

        view.selectionStyle = .none
        view.backgroundColor = Color.red
        
        view.dailyButtonContainer.buttonLabel.text = "Daily"
        view.dailyButtonContainer.isUserInteractionEnabled = true
        view.dailyButtonContainer.gestureRecognizers?.forEach {
            view.dailyButtonContainer.removeGestureRecognizer($0)
        }

        view.dailyButtonContainer.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressDailyButton(tapGestureRecognizer:))))
        
        view.weeklyButtonContainer.buttonLabel.text = "Weekly"
        view.weeklyButtonContainer.isUserInteractionEnabled = true
        view.weeklyButtonContainer.gestureRecognizers?.forEach {
            view.weeklyButtonContainer.removeGestureRecognizer($0)
        }

        view.weeklyButtonContainer.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressWeeklyButton(tapGestureRecognizer:))))
        
        view.monthlyButtonContainer.buttonLabel.text = "Monthly"
        view.monthlyButtonContainer.isUserInteractionEnabled = true
        view.monthlyButtonContainer.gestureRecognizers?.forEach {
            view.monthlyButtonContainer.removeGestureRecognizer($0)
        }

        view.monthlyButtonContainer.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressMonthlyButton(tapGestureRecognizer:))))
        
    }

    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}
