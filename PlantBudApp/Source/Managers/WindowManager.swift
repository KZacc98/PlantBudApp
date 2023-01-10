//
//  WindowManager.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import UIKit

class WindowManager {
    
    // MARK: - Public attributes
    
    let window = WindowManager.window()
    
    // MARK: - Build window
    
    private static func window() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.backgroundColor = UIColor.clear
        
        return window
    }
}
