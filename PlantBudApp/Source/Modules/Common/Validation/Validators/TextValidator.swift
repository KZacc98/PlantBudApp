//
//  TextValidator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import Foundation

class TextValidator: ValidatorInterface {
    
    // MARK: - Public attributes
    
    let isRequired: Bool
    var minimumLength: UInt
    var maximumLength: UInt
    var allowedCharacters: CharacterSet
    
    
    // MARK: - Initialization
    
    init(isRequired: Bool = true,
         minimumLength: UInt,
         maximumLength: UInt,
         allowedCharacters: CharacterSet) {
        
        self.isRequired = isRequired
        self.minimumLength = minimumLength
        self.maximumLength = maximumLength
        self.allowedCharacters = allowedCharacters
    }
    
    // MARK: - Methods
    
    func validate(value: String?) -> ValidationResult {
        guard let text = value else {
            return isRequired ? .failed(error: ApplicationError.validationEmptyValueError) : .passed
        }
        
        if isRequired && text.isEmpty {
            return ValidationResult.failed(error: ApplicationError.validationEmptyValueError)
        } else if text.rangeOfCharacter(from: self.allowedCharacters.inverted) != nil {
            return ValidationResult.failed(error: ApplicationError.validationInvalidValueError)
        } else if text.count < self.minimumLength && (text.isEmpty == false && isRequired == false) {
            return ValidationResult.failed(error: ApplicationError.validationTooShortValueError)
        } else if text.count > self.maximumLength {
            return ValidationResult.failed(error: ApplicationError.validationTooLongValueError)
        }
        
        return ValidationResult.passed
    }
}

