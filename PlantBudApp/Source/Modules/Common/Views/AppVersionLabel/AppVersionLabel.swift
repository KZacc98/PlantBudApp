//
//  AppVersionLabel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

final class AppVersionLabel: UILabel {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupLabel()
    }
    
    // MARK: - Setup
    
    private func setupLabel() {
        textColor = Color.black
        text = "v1.0"
    }
}
