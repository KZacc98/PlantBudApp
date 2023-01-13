//
//  UserContext.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/12/2022.
//

import Foundation

final class UserContext {
    
    // MARK: - Public properties
    
    public static var shared = UserContext()
    
    public var points: Int = 0
    
    public var userProfile: UserDomain?
    
}

