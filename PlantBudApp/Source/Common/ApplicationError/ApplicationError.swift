//
//  ApplicationError.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

enum ErrorDomain: String {
    case processingDomain = "ProcessingDomain"
    case validationDomain = "ValidationDomain"
}

public struct ApplicationError {
    
    // MARK: - Processing errors
    
    static var unknownError: Error {
        return self.processingError(1005, [NSLocalizedDescriptionKey: "Error Unknown"])
    }
    
    // MARK: - Validation errors
    
    static var validationEmptyValueError: Error {
        return self.validationError(2001, [NSLocalizedDescriptionKey: "validationEmptyValue".localized])
    }
    
    static var validationInvalidValueError: Error {
        return self.validationError(2002, [NSLocalizedDescriptionKey: "validationInvalidValue".localized])
    }
    
    static var validationTooShortValueError: Error {
        return self.validationError(2003, [NSLocalizedDescriptionKey: "validationTooShortValue".localized])
    }
    
    static var validationTooLongValueError: Error {
        return self.validationError(2004, [NSLocalizedDescriptionKey: "validationTooLongValue".localized])
    }
    
    static var validationInvalidEmailError: Error {
        return self.validationError(2010, [NSLocalizedDescriptionKey: "validationInvalidEmailError".localized])
    }
    
    static var validationPasswordMustBeEqual: Error {
        return self.validationError(2012, [NSLocalizedDescriptionKey: "validationPasswordMustBeEqual".localized])
    }
    
    static var validationPasswordCantBeEqual: Error {
        return self.validationError(2013, [NSLocalizedDescriptionKey: "validationPasswordCantBeEqual".localized])
    }
    
    static var validationDigitRequired: Error {
        return self.validationError(2014, [NSLocalizedDescriptionKey: "validationDigitRequired".localized])
    }
    
    static var validationLetterRequired: Error {
        return self.validationError(2015, [NSLocalizedDescriptionKey: "validationLetterRequired".localized])
    }
    
    static var validationUpperCasedLetterRequired: Error {
        return self.validationError(2016, [NSLocalizedDescriptionKey: "validationUpperCasedLetterRequired".localized])
    }
    
    static var validationSpecialSignRequired: Error {
        return self.validationError(2017, [NSLocalizedDescriptionKey: "validationSpecialSignRequired".localized])
    }
}

private extension ApplicationError {
    typealias ErrorBodyBlock = (_ code: Int, _ userInfo: [String : Any]?) -> Error
    
    static let processingError: ErrorBodyBlock = { code, userInfo in
        NSError(domain: ErrorDomain.processingDomain.rawValue, code: code, userInfo: userInfo)
    }
    
    static let validationError: ErrorBodyBlock = { code, userInfo in
        NSError(domain: ErrorDomain.validationDomain.rawValue, code: code, userInfo: userInfo)
    }
}

