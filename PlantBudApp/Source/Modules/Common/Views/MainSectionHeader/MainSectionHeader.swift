//
//  MainSectionHeader.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/12/2022.
//

import UIKit

final class MainSectionHeader: UITableViewHeaderFooterView {

    //MARK: Public properties
    
    public lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()

    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        containerView.addSubviewsUsingAutoLayout(view)

        return view
    }()
    
     public lazy var titleLabel: UILabel = {
         let label = UILabel()
         label.font = Font.noticiaRegular(size: 24)
         label.textColor = Color.brandBlack
         containerView.addSubviewsUsingAutoLayout(label)
    
         return label
     }()
    
    private lazy var mainBackgroundTopConstraint: NSLayoutConstraint = {
        return mainBackgroundView.topAnchor.constrain(anchor: contentView.topAnchor,
                                                      constant: 18,
                                                      priority: .defaultHigh)
    }()
    
    private lazy var mainBackgroundBottomConstraint: NSLayoutConstraint = {
        return mainBackgroundView.bottomAnchor.constrain(anchor: contentView.bottomAnchor)
    }()
    
    private lazy var mainBackgroundLeadingConstraint: NSLayoutConstraint = {
        return mainBackgroundView.leadingAnchor.constrain(anchor: contentView.leadingAnchor)
    }()
    
    private lazy var mainBackgroundTrailingContraint: NSLayoutConstraint = {
        return mainBackgroundView.trailingAnchor.constrain(anchor: contentView.trailingAnchor)
    }()

    //MARK: - Initialization

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupAutoLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupAutoLayout()
    }
    
    // MARK: - Access methods
    
    public func setupConstraints(insets: UIEdgeInsets) {
        mainBackgroundTopConstraint.constant = insets.top
        mainBackgroundLeadingConstraint.constant = insets.left
        mainBackgroundTrailingContraint.constant = insets.right
        mainBackgroundBottomConstraint.constant = insets.bottom
    }
    
    //MARK: - Setup
    
    public func setupAutoLayout() {
        contentView.fill(with: containerView, to: contentView.safeAreaLayoutGuide)
        
        mainBackgroundView.fill(with: titleLabel,
                                to: mainBackgroundView.safeAreaLayoutGuide,
                                insets: UIEdgeInsets(top: 6, left: 12, bottom: -6, right: -12))
    }
}
