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
    
    public var loggedIn: Bool {
        return false //zmien warunek przy logowaniu bo jest na odwrot
    }
    
    public var userId: Int = 2 {
        didSet{
            Logger.info("USTAWIŁO USERID \(userId)")
        }
    }
    
    public var points: Int = 0
    
}

