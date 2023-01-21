//
//  FormPickerView.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/01/2023.
//

import UIKit

final class FormPickerView: UIPickerView {
    
    // MARK - Public properties
    
    public var separatorColor: UIColor = Color.brandBlack {
        didSet {
            setupSeparatorColor()
        }
    }
    
    // MARK - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSeparatorColor()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupSeparatorColor()
    }
    
    // MARK - Overide Methods
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setupSeparatorColor()
    }
    
    // MARK - Private methods
    
    private func setupSeparatorColor() {
        if subviews.indices.contains(1) && subviews.indices.contains(2) {
            subviews[1].backgroundColor = separatorColor
            subviews[2].backgroundColor = separatorColor
        }
    }
}
