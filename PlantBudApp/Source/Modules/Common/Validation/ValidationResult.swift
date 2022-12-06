//
//  ValidationResult.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import Foundation

enum ValidationResult: Equatable {
    case none
    case passed
    case failed(error: Error)
}

func ==(lhs: ValidationResult, rhs: ValidationResult) -> Bool {
    switch (lhs, rhs) {
    case let (.failed(a), .failed(b)):
        return a.localizedDescription == b.localizedDescription
    case (.none, .none), (.passed, .passed):
        return true
    default:
        return false
    }
}
