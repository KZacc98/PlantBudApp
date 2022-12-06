//
//  ValidatorInterface.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import Foundation

protocol ValidatorInterface: AnyObject {
    associatedtype ObjectType
    
    func validate(value: ObjectType?) -> ValidationResult
}
