//
//  EmailValidator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import Foundation

class EmailValidator: TextValidator {
    
    // MARK: - Public attributes
    
    let regex: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    lazy var predicate: NSPredicate = {
        return NSPredicate(format: "SELF MATCHES %@", regex)
    }()
    
    override func validate(value: String?) -> ValidationResult {
        guard let text = value, self.maximumLength > 0, !text.isEmpty else {
            return ValidationResult.failed(error: ApplicationError.validationEmptyValueError)
        }
        if !predicate.evaluate(with: text) {
            return ValidationResult.failed(error: ApplicationError.validationInvalidEmailError)
        } else if text.count < self.minimumLength {
            return ValidationResult.failed(error: ApplicationError.validationTooShortValueError)
        } else if text.count > self.maximumLength {
            return ValidationResult.failed(error: ApplicationError.validationTooLongValueError)
        }
        return ValidationResult.passed
    }
}

