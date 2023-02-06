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
    
    public lazy var separatorView: UIView = {
        let gradientView = UIView()
        gradientView.backgroundColor = Color.brandGreen.withAlphaComponent(0.5)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
//        mainBackgroundView.addSubviewsUsingAutoLayout(gradientView)

        return gradientView
    }()
    
    public lazy var plantNameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
//        imageViewChinGradient.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [plantNameLabel, separatorView, plantStateLabel])
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 10
        view.axis = .vertical
        view.setShadow(cornerRadius: 12, shadowOpacity: 0.5)
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
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
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
        plantImage.bottomAnchor.constrain(anchor: stackView.topAnchor, constant: 30)
        plantImage.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        plantImage.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        
        plantImage.widthAnchor.constrain(anchor: mainBackgroundView.widthAnchor)
        plantImage.heightAnchor.constrain(anchor: plantImage.widthAnchor)
        
        separatorView.leadingAnchor.constrain(anchor: stackView.leadingAnchor, constant: 12)
        separatorView.trailingAnchor.constrain(anchor: stackView.trailingAnchor, constant: -12)
        separatorView.heightAnchor.constrain(constant: 2)
        
        plantNameLabel.topAnchor.constrain(anchor: stackView.topAnchor, constant: 6)
        
        plantStateLabel.bottomAnchor.constrain(anchor: stackView.bottomAnchor, constant: -6)
        
        stackView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 16)
        stackView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -16)
        stackView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant:  -16)
    }
}



