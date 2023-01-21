//
//  AppIconHeaderCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 21/01/2023.
//

import UIKit

class AppIconHeaderCell: UITableViewHeaderFooterView {
    
    //MARK: - Public properties
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var appIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
        
        
        return imageView
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
    
    //MARK: - Setup
    
    private func setupAutoLayout() {
        contentView.fill(with: mainBackgroundView,
                         to: contentView.safeAreaLayoutGuide,
        insets: UIEdgeInsets(top: 12, left: 12, bottom: -12, right: -12))
        
        appIconView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
        appIconView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
        appIconView.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
        appIconView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
        appIconView.heightAnchor.constrain(constant: UIScreen.main.bounds.width - 100)
        appIconView.widthAnchor.constrain(anchor: appIconView.heightAnchor)
    }
}

