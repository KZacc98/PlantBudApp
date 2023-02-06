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
        view.mainBackgroundView.backgroundColor = Color.brandWhite
        view.mainBackgroundView.isUserInteractionEnabled = true
        view.stepLabel.textColor = Color.brandBlack
        view.dueDateLabelLabel.isHidden = true
        
        if let dueDate = dueDate{
            switch data.step.isCompleted {
            case true:
                view.mainBackgroundView.backgroundColor = Color.brandGreen
                view.mainBackgroundView.setShadow(cornerRadius: 12, shadowOpacity: 1, shadowColor: Color.brandGreen)
                view.mainBackgroundView.isUserInteractionEnabled = false
                view.stepLabel.textColor = Color.brandWhite
                view.dueDateLabelLabel.textColor = Color.brandWhite
                view.dueDateLabelLabel.text = "Świetna robota!\nPlanowana data wykonania: \n \(dueDateString)"
                view.dueDateLabelLabel.isHidden = false
            case false:
                view.stepLabel.textColor = Color.brandBlack
                view.dueDateLabelLabel.textColor = Color.brandBlack
                switch dueDate.isInToday {
                case true:
                    view.mainBackgroundView.backgroundColor = Color.brandWhite
                    view.mainBackgroundView.setShadow(cornerRadius: 12, shadowOpacity: 0.5, shadowColor: Color.brandBlack)
                    view.mainBackgroundView.isUserInteractionEnabled = true
                    view.dueDateLabelLabel.isHidden = true
                case false:
                    if dueDate.isInTomorrow {
                        view.mainBackgroundView.backgroundColor = Color.brandWhite
                        view.mainBackgroundView.isUserInteractionEnabled = false
                        view.mainBackgroundView.layer.borderWidth = 1
                        view.mainBackgroundView.layer.borderColor = Color.brandBlack.withAlphaComponent(0.3).cgColor
                        view.dueDateLabelLabel.text = "Przygotuj się:\n \(dueDateString)\n to dzień wykonania tej czynności"
                        view.dueDateLabelLabel.isHidden = false
                    } else if dueDate.isInYesterday {
                        view.mainBackgroundView.backgroundColor = Color.brandWhite
                        view.mainBackgroundView.setShadow(cornerRadius: 12, shadowOpacity: 1, shadowColor: Color.brandWarning)
                        view.mainBackgroundView.isUserInteractionEnabled = true
                        view.dueDateLabelLabel.text = "Planowana data wykonania: \n \(dueDateString)"
                        view.dueDateLabelLabel.isHidden = false
                    } else if dueDate < Date().adding(.day, value: 2){
                        view.mainBackgroundView.backgroundColor = Color.brandWhite
                        view.mainBackgroundView.setShadow(cornerRadius: 12, shadowOpacity: 1, shadowColor: Color.brandAlert)
                        view.mainBackgroundView.isUserInteractionEnabled = true
                        view.dueDateLabelLabel.text = "Krok pominięty!\nPlanowana data wykonania: \n \(dueDateString)"
                        view.dueDateLabelLabel.isHidden = false
                    }
                }
            }
        }
        
        
        
        
        
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

