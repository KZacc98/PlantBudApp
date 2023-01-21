//
//  SquareButton.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/01/2023.
//

import UIKit

final class SquareButton: UIView {
    
    public var isHighlighted = true {
        didSet{
            setHighlighted(highlighted: isHighlighted)
        }
    }
    
    lazy var buttonContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25
        addSubviewsUsingAutoLayout(view)

        return view
    }()
    
    lazy var buttonImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.tintColor = Color.brandWhite
        view.image = UIImage(systemName: "plus")
        view.sizeToFit()
        buttonContainer.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.font = Font.noticiaRegular(size: 16)
        label.textColor = Color.brandWhite
        label.textAlignment = .center
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
        label.text = "DAILYTest"
        
        buttonContainer.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    //MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setHighlighted(highlighted: self.isHighlighted)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setHighlighted(highlighted: self.isHighlighted)
    }
    
    func setHighlighted(highlighted: Bool) {
        if highlighted {
            buttonContainer.setShadow(cornerRadius: 25,
                           shadowOpacity: 0.9,
                           shadowRadius: 4,
                           shadowOffset: .zero,
                           shadowColor: Color.brandGreen)
            buttonContainer.backgroundColor = Color.brandGreen
            buttonImage.tintColor = Color.brandWhite
            buttonLabel.textColor = Color.brandWhite
        } else {
            buttonContainer.setShadow(cornerRadius: 25,
                           shadowOpacity: 0.3,
                           shadowRadius: 4,
                           shadowOffset: .zero,
                           shadowColor: Color.brandBlack)
            buttonContainer.backgroundColor = Color.brandWhite
            buttonImage.tintColor = Color.brandGreen
            buttonLabel.textColor = Color.brandBlack
        }
    }
    
    //MARK: - Setup
    
    func setupViews() {
        buttonContainer.widthAnchor.constrain(constant: 100)
        buttonContainer.heightAnchor.constrain(constant: 100)
        
//        buttonImage.leadingAnchor.constrain(anchor: buttonContainer.leadingAnchor)
        buttonImage.centerXAnchor.constrain(anchor: buttonContainer.centerXAnchor)
        buttonImage.topAnchor.constrain(anchor: buttonContainer.topAnchor, constant: 24)
        buttonImage.bottomAnchor.constrain(anchor: buttonLabel.topAnchor, constant: 12)
        buttonImage.widthAnchor.constrain(constant: 25)
        buttonImage.heightAnchor.constrain(anchor: buttonImage.widthAnchor)
        
        buttonLabel.leadingAnchor.constrain(anchor: buttonContainer.leadingAnchor, constant: 6)
        buttonLabel.trailingAnchor.constrain(anchor: buttonContainer.trailingAnchor, constant: -6)
        buttonLabel.bottomAnchor.constrain(anchor: buttonContainer.bottomAnchor)
        
    }
}
