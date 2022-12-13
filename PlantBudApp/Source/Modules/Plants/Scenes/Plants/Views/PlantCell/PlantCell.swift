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
        view.layer.cornerRadius = 12
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var plantImage: PaddedImageView = {
        let imageView = PaddedImageView()
        imageView.imageViewSize.width = 100
        imageView.imageViewSize.height = 100
        imageView.imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 1
        imageView.contentMode = .scaleAspectFill
        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
        
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [plantNameLabel, plantStateLabel, plantInfoLabel])
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
    
    public lazy var plantInfoLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaItalic(size: 8)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    // MARK: - Selectors
    
//    @objc private func didPressButton(_ sender: UIButton) {
//        didPressButton?()
//    }
    
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
        plantImage.bottomAnchor.constrain(anchor: stackView.topAnchor, constant: -12)
//        plantImage.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        plantImage.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        
        stackView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        stackView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        stackView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)

//        button.centerYAnchor.constrain(anchor: helloLabel.centerYAnchor)
//        button.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -6)
    }
}


