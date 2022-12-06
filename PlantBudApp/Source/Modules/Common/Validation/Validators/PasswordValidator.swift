//
//  PasswordValidator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import Foundation

final class PasswordValidator: TextValidator {
    
    // MARK: - Public properties
    
    public var password: String
    
    // MARK: - Private properties
    
    private let valueShouldBeEqual: Bool
    private let compareValueToPassword: Bool
    
    private var requiredLetters: CharacterSet {
        return CharacterSet(charactersIn: "qwertyuiopasdfghjklzxcvbnm")
    }
    
    private var requiredUpperCasedLetters: CharacterSet {
        return CharacterSet(charactersIn: "QWERTYUIOPASDFGHJKLZXCVBNM")
    }
    
    private var requiredSpecialCharacters: CharacterSet {
        return CharacterSet(charactersIn: "§!@#$%^&*()_+-=[]{};'\\:”|,./<>?`~")
    }
    
    // MARK: - Initialization
    
    init(
        isRequired: Bool = true,
        minimumLength: UInt,
        maximumLength: UInt,
        allowedCharacters: CharacterSet,
        password: String,
        valueShouldBeEqual: Bool,
        compareValueToPassword: Bool = true
    ) {
        self.password = password
        self.valueShouldBeEqual = valueShouldBeEqual
        self.compareValueToPassword = compareValueToPassword
        
        super.init(
            isRequired: isRequired,
            minimumLength: minimumLength,
            maximumLength: maximumLength,
            allowedCharacters: allowedCharacters
        )
    }
    
    // MARK: - Override methods
    
    override func validate(value: String?) -> ValidationResult {
        guard let text = value else {
            return .failed(error: ApplicationError.validationEmptyValueError)
        }
        
        if isRequired && text.isEmpty {
            return ValidationResult.failed(error: ApplicationError.validationEmptyValueError)
        } else if text.rangeOfCharacter(from: self.allowedCharacters.inverted) != nil {
            return ValidationResult.failed(error: ApplicationError.validationInvalidValueError)
        } else if text.count < self.minimumLength {
            return ValidationResult.failed(error: ApplicationError.validationTooShortValueError)
        } else if text.count > self.maximumLength {
            return ValidationResult.failed(error: ApplicationError.validationTooLongValueError)
        } else if text.rangeOfCharacter(from: .decimalDigits) == nil {
            return ValidationResult.failed(error: ApplicationError.validationDigitRequired)
        } else if text.rangeOfCharacter(from: requiredLetters) == nil {
            return ValidationResult.failed(error: ApplicationError.validationLetterRequired)
        } else if text.rangeOfCharacter(from: requiredUpperCasedLetters) == nil {
            return ValidationResult.failed(error: ApplicationError.validationUpperCasedLetterRequired)
        } else if text.rangeOfCharacter(from: requiredSpecialCharacters) == nil {
            return ValidationResult.failed(error: ApplicationError.validationSpecialSignRequired)
        } else if (value == password && !valueShouldBeEqual) && compareValueToPassword {
            return ValidationResult.failed(error: ApplicationError.validationPasswordCantBeEqual)
        } else if (value != password && valueShouldBeEqual) && compareValueToPassword {
            return ValidationResult.failed(error: ApplicationError.validationPasswordMustBeEqual)
        }
        
        return ValidationResult.passed
    }
}

