//
//  Validable.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import Foundation

protocol Validable: AnyObject {
    var validationResult: ValidationResult { get set }
    func validate() -> ValidationResult
}

protocol MultiValidable: AnyObject {
    var validationResults: [ValidationResult] { get set }
    var refreshView: (() -> ())? { get }
    func validateElementAtIndex(_ index: Int) -> ValidationResult
}
