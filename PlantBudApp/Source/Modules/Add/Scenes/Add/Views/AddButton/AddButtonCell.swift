//
//  AddButtonCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import UIKit

final class AddButtonCell: UITableViewCell {
    
    // MARK: - Public properties
    
    public var didPressButton: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
//        view.clipsToBounds = true
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var buttonContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
//        view.clipsToBounds = true
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var button: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandGreen
        view.clipsToBounds = true
        view.setShadow(cornerRadius: 125)
        buttonContainerView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var buttonImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.tintColor = Color.brandWhite
        view.image = UIImage(systemName: "plus")
        button.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var buttonNameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaBold(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    
    
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAutoLayout()
    }
    
    // MARK: - Setup
    
    private func setupAutoLayout() {
        contentView.fill(
            with: mainBackgroundView,
            to: contentView.safeAreaLayoutGuide,
            insets: UIEdgeInsets(top: 12, left: 12, bottom: -12, right: -12)
        )
        
        buttonContainerView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        buttonContainerView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        buttonContainerView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        buttonContainerView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        
        button.topAnchor.constrain(anchor: buttonContainerView.topAnchor)
        button.centerXAnchor.constrain(anchor: buttonContainerView.centerXAnchor)
        button.centerYAnchor.constrain(anchor: buttonContainerView.centerYAnchor)
        button.heightAnchor.constrain(constant: 250)
        button.widthAnchor.constrain(anchor: button.heightAnchor)
        
        buttonImage.centerXAnchor.constrain(anchor: button.centerXAnchor)
        buttonImage.centerYAnchor.constrain(anchor: button.centerYAnchor)
        buttonImage.heightAnchor.constrain(constant: 100)
        buttonImage.widthAnchor.constrain(anchor: buttonImage.heightAnchor)
        
        buttonNameLabel.topAnchor.constrain(anchor: button.bottomAnchor, constant: 12)
        buttonNameLabel.leadingAnchor.constrain(anchor: buttonContainerView.leadingAnchor)
        buttonNameLabel.trailingAnchor.constrain(anchor: buttonContainerView.trailingAnchor)
        
    }
}



