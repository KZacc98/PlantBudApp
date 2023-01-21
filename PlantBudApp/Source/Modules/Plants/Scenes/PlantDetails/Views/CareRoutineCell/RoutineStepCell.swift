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
    
    public lazy var dueDateStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stepLabel, dueDateLabelLabel])
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 6
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var stepLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 16)
        label.textColor = Color.brandWhite
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    public lazy var dueDateLabelLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 16)
        label.textColor = Color.brandWhite
        label.textAlignment = .center
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
        
        dueDateStackView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 12)
        dueDateStackView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -12)
        dueDateStackView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 12)
        dueDateStackView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -12)
        
        
    }
}


