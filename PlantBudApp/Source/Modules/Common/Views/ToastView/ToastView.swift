//
//  ToastView.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

internal final class ToastView: UIView {
    
    // MARK: - Private properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.white
        label.textAlignment = .center
        addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
        setupAutoLayout()
    }
    
    // MARK: - Setup
    
    func setupView(with message: String) {
        titleLabel.text = message
    }
    
    private func setupView() {
        setShadow(shadowColor: Color.black)
        backgroundColor = Color.black
        isUserInteractionEnabled = false
    }
    
    private func setupAutoLayout() {
        fill(with: titleLabel,
             to: safeAreaLayoutGuide,
             insets: .init(top: 18, left: 0, bottom: -18, right: 0))
    }
}

