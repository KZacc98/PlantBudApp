//
//  MainButtonCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

class MainButtonCell: UITableViewCell {

    //MARK: - Public properties
    
    public var isEnabled: Bool = true {
        didSet {
            setEnabled()
        }
    }
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    
    public lazy var button: LoadingButton = {
        let button = LoadingButton(type: .system)
        button.setCustomStyle()
        mainBackgroundView.addSubviewsUsingAutoLayout(button)
        button.heightAnchor.constrain(constant: 60.deviceSizeAware)

        return button
    }()
    
    //MARK: - Private properties
    
    private lazy var buttonTopConstraint: NSLayoutConstraint = {
        return button.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
    }()
    
    private lazy var buttonBottomConstraint: NSLayoutConstraint = {
        return button.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
    }()
    
    private lazy var buttonLeadingConstraint: NSLayoutConstraint = {
        return button.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
    }()
    
    private lazy var buttonTrailingConstraint: NSLayoutConstraint = {
        return button.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
    }()
    
    //MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupButtonConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupButtonConstraints()
    }
    
    //MARK: - Override methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        button.removeTarget(nil, action: nil, for: .touchUpInside)
    }
    
    //MARK: - Setup
    
    private func setEnabled() {
        if isEnabled == true {
            button.backgroundColor = Color.brandGreen
            button.layer.shadowColor = Color.brandGreen.cgColor
            button.isEnabled = true
        } else {
            button.backgroundColor = Color.darkGray
            button.layer.shadowColor = Color.darkGray.cgColor
            button.isEnabled = false
        }
    }
    
    //MARK: - Access methods
    
    public func setupButtonConstraints(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: -12)) {
        contentView.fill(with: mainBackgroundView, to: contentView.safeAreaLayoutGuide, insets: UIEdgeInsets(top: 12, left: 50, bottom: -12, right: -50))
        
        buttonTopConstraint.constant = insets.top
        buttonBottomConstraint.constant = insets.bottom
        buttonTrailingConstraint.constant = insets.right
        buttonLeadingConstraint.constant = insets.left
    }
}

