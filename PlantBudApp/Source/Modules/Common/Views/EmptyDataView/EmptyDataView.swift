//
//  EmptyDataView.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

class EmptyDataView: UIView {
    
    // MARK: - Properties
    
    lazy var contentView: EmptyDataContentView = {
        let view = EmptyDataContentView()
        addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            view.style = .large
        }
        view.hidesWhenStopped = true
        view.color = Color.brandGreen
        addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    var contentOffset: CGPoint = .zero {
        didSet {
            contentViewCenterX.constant = contentOffset.x
            contentViewCenterY.constant = contentOffset.y
        }
    }
    
    // MARK: - Private propertie
    
    private lazy var contentViewCenterX: NSLayoutConstraint = {
        return contentView.centerXAnchor.constrain(anchor: safeAreaLayoutGuide.centerXAnchor,
                                                   isActive: false)
    }()
    
    private lazy var contentViewCenterY: NSLayoutConstraint = {
        return contentView.centerYAnchor.constrain(anchor: safeAreaLayoutGuide.centerYAnchor,
                                                   isActive: false)
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setupAutoLayout()
    }
}

// MARK: - Setup

extension EmptyDataView {
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([contentViewCenterY, contentViewCenterX])
        
        activityIndicator.centerXAnchor.constrain(anchor: safeAreaLayoutGuide.centerXAnchor)
        activityIndicator.centerYAnchor.constrain(anchor: safeAreaLayoutGuide.centerYAnchor)
    }
    
    func configure(type: EmptyDataType, contentOffset: CGPoint) {
        if type == .loading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
            contentView.titleLabel.text = type.localizedTitle
            contentView.imageView.image = type.image
            contentView.circleView.isHidden = type == .none ? true : false
            self.contentOffset = contentOffset
        }
    }
}
