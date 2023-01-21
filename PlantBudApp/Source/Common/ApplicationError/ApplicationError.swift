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
    
    static var jsonDecodingError: Error {
        return self.processingError(1004, [NSLocalizedDescriptionKey: "errorDecodingDataFailed".localized])
    }
    
    static var unknownError: Error {
        return self.processingError(1005, [NSLocalizedDescriptionKey: "Jebło"])
    }
    
    // MARK: - Validation errors
    
    static var validationEmptyValueError: Error {
        return self.validationError(2001, [NSLocalizedDescriptionKey: "validationEmptyValue".localized])
    }
    
    static var validationInvalidValueError: Error {
        return self.validationError(2002, [NSLocalizedDescriptionKey: "Podana wartośc jest nieprawidłowa"])
    }
    
    static var validationTooShortValueError: Error {
        return self.validationError(2003, [NSLocalizedDescriptionKey: "validationTooShortValue".localized])
    }
    
    static var validationTooLongValueError: Error {
        return self.validationError(2004, [NSLocalizedDescriptionKey: "validationTooLongValue".localized])
    }

    static var validationNoRatingError: Error {
        return  self.validationError(2005, [NSLocalizedDescriptionKey: "validationNoRating".localized])
    }
    
    static var validationRequiredFieldEmpty: Error {
        return self.validationError(2006, [NSLocalizedDescriptionKey: "validationRequiredFieldEmpty".localized])
    }
    
    static var validationSelectedCityNoResults: Error {
        return self.validationError(2007, [NSLocalizedDescriptionKey: "validationSelectedCityNoResults".localized])
    }
    
    static var validationRequiredAgreementsNotSelected: Error {
        return self.validationError(2008, [NSLocalizedDescriptionKey: "validationRequiredAgreementsNotSelected".localized])
    }
    
    static var validationPaymentDataEmpty: Error {
        return self.validationError(2009, [NSLocalizedDescriptionKey: "validationPaymentDataEmpty".localized])
    }
    
    static var validationInvalidEmailError: Error {
        return self.validationError(2010, [NSLocalizedDescriptionKey: "validationInvalidEmailError".localized])
    }
    
    static var validationPromoCodeEmpty: Error {
        return self.validationError(2011, [NSLocalizedDescriptionKey: "validationPromoCodeEmpty".localized])
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
    
    static var validationPasswordProcessingError: Error {
        return self.validationError(2018, [NSLocalizedDescriptionKey: "validationPasswordProcessingError".localized])
    }
    
    static var addPersonNameIsEmptyError: Error {
        return self.validationError(2019, [NSLocalizedDescriptionKey: "exclusions.addPerson.nameIsEmpty.error".localized])
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

