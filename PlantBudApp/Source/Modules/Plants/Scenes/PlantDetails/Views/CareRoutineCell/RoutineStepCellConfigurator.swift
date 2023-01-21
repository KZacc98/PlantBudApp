//
//  RoutineStepCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/12/2022.
//

import UIKit
import Foundation

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
    
    @objc private func didHoldStepCell(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        data.didHoldCell?()
    }
    
}

// MARK: - ReusableViewConfiguratorInterface

extension RoutineStepCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return RoutineStepCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? RoutineStepCell else { return }
        
        
//        if data.step .stepFrequency.days == 0 {
//                return true
//            } else {
//                guard
//                    let stepDueDate = Calendar.current.date(byAdding: .day, value: step.stepFrequency.days, to: step.completedAt)
//                else {
//                    return false
//                }
//                return (!step.isCompleted && (step.completedAt < stepDueDate))
//            }
//        })
        
        
        let formatter = DateFormatter()
        let locale = Locale.current
        formatter.dateStyle = .full
        formatter.locale = locale
        let dueDate = Calendar.current.date(byAdding: .day, value: data.step.stepFrequency.days, to: data.step.completedAt)
        let dueDateString = formatter.string(from: dueDate ?? Date())
        
        view.selectionStyle = .none
        view.stepLabel.text = data.step.description
        view.backgroundColor = Color.brandWhite
        view.mainBackgroundView.backgroundColor = data.step.isCompleted ? Color.brandGreen : Color.red
        view.mainBackgroundView.isUserInteractionEnabled = !data.step.isCompleted
        view.stepLabel.textColor = data.step.isCompleted ? Color.brandWhite : Color.brandBlack
        view.dueDateLabelLabel.text = "Great job come back: \(dueDateString)"
        view.dueDateLabelLabel.isHidden = !data.step.isCompleted
        view.mainBackgroundView.gestureRecognizers?.forEach {
            view.mainBackgroundView.removeGestureRecognizer($0)
        }
        view.mainBackgroundView.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressCheckbox(tapGestureRecognizer:))))
        let longPressGestureRecognizer = UILongPressGestureRecognizer(
                        target: self,
                        action: #selector(didHoldStepCell(longPressGestureRecognizer:)))
        longPressGestureRecognizer.cancelsTouchesInView = false
        longPressGestureRecognizer.minimumPressDuration = 1
        view.mainBackgroundView.addGestureRecognizer(longPressGestureRecognizer)
        
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

