//
//  PlantDetailsHeader.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 25/12/2022.
//

import UIKit

final class PlantDetailsHeader: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.clipsToBounds = true
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var plantImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = (UIScreen.main.bounds.width - 24) / 2
        imageView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        imageView.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
        
    }()
    
    public lazy var imageViewChinGradient: UIView = {
        let gradientView = UIView()
        gradientView.backgroundColor = Color.brandWhite
        
        mainBackgroundView.addSubviewsUsingAutoLayout(gradientView)
        
        return gradientView
    }()
    
    public lazy var plantNameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        imageViewChinGradient.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [plantStateLabel])
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 10
        view.axis = .vertical
        view.setShadow(shadowOpacity: 0.5)
        view.backgroundColor = Color.brandWhite
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
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
            insets: .zero
        )
        
        plantImage.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: plantImage.frame.height / 4)
        plantImage.bottomAnchor.constrain(anchor: stackView.topAnchor)
        plantImage.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        plantImage.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        
        plantImage.widthAnchor.constrain(anchor: mainBackgroundView.widthAnchor)
        plantImage.heightAnchor.constrain(anchor: plantImage.widthAnchor)
        
        plantNameLabel.centerXAnchor.constrain(anchor: imageViewChinGradient.centerXAnchor)
        plantNameLabel.centerYAnchor.constrain(anchor: imageViewChinGradient.centerYAnchor)
        
        imageViewChinGradient.leadingAnchor.constrain(anchor: plantImage.leadingAnchor)
        imageViewChinGradient.trailingAnchor.constrain(anchor: plantImage.trailingAnchor)
        imageViewChinGradient.heightAnchor.constrain(anchor: plantNameLabel.heightAnchor)
        imageViewChinGradient.bottomAnchor.constrain(anchor: plantImage.bottomAnchor, constant: -20)
        
        stackView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 16)
        stackView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -16)
        stackView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant:  -16)
    }
}



