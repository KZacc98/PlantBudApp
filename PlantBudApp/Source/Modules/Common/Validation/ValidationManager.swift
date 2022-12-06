//
//  ValidationManager.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

typealias ValidableInputViewConfigurator = Validable & ReusableViewConfiguratorInterface
typealias MultiValidableInputViewConfigurator = MultiValidable & ReusableViewConfiguratorInterface

class ValidationManager {
    
    static func validate(validableInputViewConfigurator: ValidableInputViewConfigurator,
                         sectionSequence: SectionSequence?,
                         tableViewInterface: TableViewControllerInterface?) {
        
        let validationResult = validableInputViewConfigurator.validate()
        
        if validableInputViewConfigurator.validationResult != validationResult {
            validableInputViewConfigurator.validationResult = validationResult
            if let indexPath = sectionSequence?.indexPath(for: validableInputViewConfigurator) {
                tableViewInterface?.reloadRows(at: [indexPath])
            }
        }
    }
    
    static func validate(multiValidableInputViewConfigurator: MultiValidableInputViewConfigurator,
                         index: Int? = nil,
                         tableViewInterface: TableViewControllerInterface?) {
        
        var validationResults: [ValidationResult] = multiValidableInputViewConfigurator.validationResults
        
        if let index = index {
            validationResults[index] = multiValidableInputViewConfigurator.validateElementAtIndex(index)
        } else {
            validationResults = multiValidableInputViewConfigurator.validationResults.enumerated().map { index, result in
                multiValidableInputViewConfigurator.validateElementAtIndex(index)
            }
        }
        
        if multiValidableInputViewConfigurator.validationResults != validationResults {
            multiValidableInputViewConfigurator.validationResults = validationResults
            multiValidableInputViewConfigurator.refreshView?()
            tableViewInterface?.update()
        }
    }
    
    static func validate(validableInputViewConfigurators: [ValidableInputViewConfigurator],
                         sectionSequence: SectionSequence?,
                         tableViewInteraface: TableViewControllerInterface? = nil,
                         completion: (([Error], [IndexPath]) -> Void)? = nil) {
        
        var errors: [Error] = []
        var failedIndexPaths: [IndexPath] = []
        var passedIndexPaths: [IndexPath] = []
        
        for input in validableInputViewConfigurators {
            guard let indexPath = sectionSequence?.indexPath(for: input) else {
                continue
            }
            let validationResult = input.validate()
            
            if case .failed(let error) = validationResult {
                failedIndexPaths.append(indexPath)
                errors.append(error)
            } else if input.validationResult != validationResult {
                passedIndexPaths.append(indexPath)
            }
            input.validationResult = validationResult
        }
        
        tableViewInteraface?.reloadRows(at: failedIndexPaths)
        completion?(errors, failedIndexPaths + passedIndexPaths)
    }
    
    static func verify(validableInputViewConfigurators: [ValidableInputViewConfigurator],
                       multiValidableInputViewConfigurator: [MultiValidableInputViewConfigurator],
                       completion: (([Error]) -> Void)? = nil) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            var errors: [Error] = []
            
            for input in validableInputViewConfigurators {
                let validationResult = input.validate()
                
                if case .failed(let error) = validationResult {
                    errors.append(error)
                }
            }
            
            for input in multiValidableInputViewConfigurator {
                var validationResults: [ValidationResult] = []
                
                for (index, _) in input.validationResults.enumerated() {
                    validationResults.append(input.validateElementAtIndex(index))
                }
                
                for validationResult in validationResults {
                    if case .failed(let error) = validationResult {
                        errors.append(error)
                    }
                }
                input.validationResults = validationResults
            }
            
            DispatchQueue.main.async {
                completion?(errors)
            }
        }
    }
}

