//
//  PaddedImageView.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/12/2022.
//

import UIKit

final class PaddedImageView: UIView {
    
    //MARK: - Properities
    
    var imageViewSize = CGSize(width: 20, height: 20) {
        didSet {
            constraintCache = getImageViewConstraints(size: imageViewSize)
        }
    }
    
    private var constraintCache: [NSLayoutConstraint] = [] {
        didSet {
            NSLayoutConstraint.deactivate(oldValue)
            NSLayoutConstraint.activate(constraintCache)
        }
    }
    
    //MARK: - Views
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    //MARK: - Setup
    
    func setupViews() {
        addSubviewsUsingAutoLayout(imageView)
        constraintCache = getImageViewConstraints(size: imageViewSize)
        
        imageView.leadingAnchor.constrain(.greaterThanOrEqual, anchor: leadingAnchor)
        imageView.trailingAnchor.constrain(.lessThanOrEqual ,anchor: trailingAnchor)
        imageView.topAnchor.constrain(.greaterThanOrEqual, anchor: topAnchor)
        imageView.bottomAnchor.constrain(.lessThanOrEqual, anchor: bottomAnchor)
        imageView.centerXAnchor.constrain(anchor: centerXAnchor)
        imageView.centerYAnchor.constrain(anchor: centerYAnchor)
    }
}

private extension PaddedImageView {
    func getImageViewConstraints(size: CGSize) -> [NSLayoutConstraint] {
        [
            imageView.widthAnchor.constraint(equalToConstant: size.width, priority: .defaultHigh),
            imageView.heightAnchor.constraint(equalToConstant: size.height, priority: .defaultHigh)
        ]
    }
}


