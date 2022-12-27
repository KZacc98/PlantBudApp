//
//  RoutineStepCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/12/2022.
//

import UIKit

final class RoutineStepCell: UITableViewCell {
    
    // MARK: - Public properties
    
    public var didPressCheckbox: (() -> ())?
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.setShadow(shadowOpacity: 1)
        view.layer.cornerRadius = 12
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 24)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setShadow(
            cornerRadius: 4,
            shadowOpacity: 0.5,
            shadowRadius: 4,
            shadowOffset: .zero,
            shadowColor: Color.white
        )
        button.backgroundColor = Color.white
        button.setTitle("V".uppercased(), for: .normal)
        button.setTitleColor(Color.black, for: .normal)
        mainBackgroundView.addSubviewsUsingAutoLayout(button)

        return button
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
        
        stepLabel.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 6)
        stepLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 6)
        stepLabel.trailingAnchor.constrain(anchor: button.trailingAnchor)
        stepLabel.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -6)

        button.centerYAnchor.constrain(anchor: stepLabel.centerYAnchor)
        button.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -6)
    }
}


