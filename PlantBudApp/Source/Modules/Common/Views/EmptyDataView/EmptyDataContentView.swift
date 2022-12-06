//
//  EmptyDataContentView.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

final class EmptyDataContentView: UIView {
    
    //MARK: - Public properties
    
    public lazy var circleView: CircularView = {
        let view = CircularView()
        view.backgroundColor = .clear
        view.fillColor = .gray
        view.isHidden = true
        view.setShadow(cornerRadius: view.layer.cornerRadius,
                       shadowOpacity: 0.5,
                       shadowRadius: 4,
                       shadowOffset: .zero,
                       shadowColor: .gray)
        addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        circleView.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupAutoLayout()
    }
    
    private func setupAutoLayout() {
        circleView.topAnchor.constrain(anchor: topAnchor)
        circleView.heightAnchor.constrain(constant: 137.deviceSizeAware)
        circleView.widthAnchor.constrain(anchor: circleView.heightAnchor)
        circleView.centerXAnchor.constrain(anchor: centerXAnchor)
        
        imageView.heightAnchor.constrain(anchor: circleView.heightAnchor, multiplier: 0.407.deviceSizeAware)
        imageView.widthAnchor.constrain(anchor: imageView.heightAnchor)
        imageView.centerYAnchor.constrain(anchor: circleView.centerYAnchor)
        imageView.centerXAnchor.constrain(anchor: circleView.centerXAnchor)
        
        titleLabel.topAnchor.constrain(anchor: circleView.bottomAnchor, constant: 18.deviceSizeAware)
        titleLabel.widthAnchor.constrain(anchor: widthAnchor, multiplier: 0.9)
        titleLabel.centerXAnchor.constrain(anchor: centerXAnchor)
        titleLabel.bottomAnchor.constrain(anchor: bottomAnchor)
    }
}
