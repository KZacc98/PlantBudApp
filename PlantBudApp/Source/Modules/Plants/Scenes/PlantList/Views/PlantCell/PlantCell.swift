//
//  PlantCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/12/2022.
//

import UIKit

final class PlantCell: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.setShadow(shadowOpacity: 0.5)
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
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [plantNameLabel, plantStateLabel])
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 10
        view.axis = .vertical
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var plantNameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    public lazy var plantStateLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        
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
        
        plantImage.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        plantImage.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        plantImage.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        
        plantImage.widthAnchor.constrain(constant: 100)
        plantImage.heightAnchor.constrain(anchor: plantImage.widthAnchor)
        
        stackView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        stackView.trailingAnchor.constrain(anchor: plantImage.trailingAnchor, constant: -12)
        stackView.centerYAnchor.constrain(anchor: plantImage.centerYAnchor)
    }
}


