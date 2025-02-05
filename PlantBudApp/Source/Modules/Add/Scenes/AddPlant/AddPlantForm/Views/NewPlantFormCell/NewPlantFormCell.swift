//
//  NewPlantFormCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import UIKit

final class NewPlantFormCell: UITableViewCell {
    
    // MARK: - Public properties
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandGreen
        view.setShadow(shadowOpacity: 1, shadowRadius: 6, shadowColor: Color.brandGreen)
        view.layer.cornerRadius = 12
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var plantImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
        
    }()
    
    public lazy var plantSpeciesLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandWhite
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var plantTypeLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandWhite
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var plantInfoLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaItalic(size: 15)
        label.textColor = Color.brandWhite
        label.textAlignment = .natural
        label.numberOfLines = 0
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
        
        plantSpeciesLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        plantSpeciesLabel.trailingAnchor.constrain(anchor: plantImage.leadingAnchor, constant: -12)
        plantSpeciesLabel.centerYAnchor.constrain(anchor: plantImage.centerYAnchor)
        
        plantTypeLabel.leadingAnchor.constrain(anchor: plantSpeciesLabel.leadingAnchor)
        plantTypeLabel.trailingAnchor.constrain(anchor: plantSpeciesLabel.leadingAnchor)
        plantTypeLabel.topAnchor.constrain(anchor: plantSpeciesLabel.bottomAnchor, constant: 12)
        
        plantImage.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        plantImage.bottomAnchor.constrain(anchor: plantInfoLabel.topAnchor, constant: -12)
        plantImage.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        
        plantImage.widthAnchor.constrain(constant: 100)
        plantImage.heightAnchor.constrain(anchor: plantImage.widthAnchor)
        
        plantInfoLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        plantInfoLabel.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        plantInfoLabel.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
    }
}
