//
//  HelloHeaderCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class HelloHeaderCell: UITableViewCell {
    
    // MARK: - Public properties
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 48)
        label.textColor = Color.brandBlack
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
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
        button.setTitle("P".uppercased(), for: .normal)
        button.setTitleColor(Color.black, for: .normal)
        mainBackgroundView.addSubviewsUsingAutoLayout(button)

        return button
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
        
        helloLabel.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 6)
        helloLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 6)
        helloLabel.trailingAnchor.constrain(anchor: button.trailingAnchor, constant: -6)
        helloLabel.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -6)

        button.centerYAnchor.constrain(anchor: helloLabel.centerYAnchor)
        button.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -6)
    }
}
