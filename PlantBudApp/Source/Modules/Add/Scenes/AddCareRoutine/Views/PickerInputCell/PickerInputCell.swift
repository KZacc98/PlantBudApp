//
//  PickerInputCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/01/2023.
//

import UIKit

final class PickerInputCell: UITableViewCell {
    
    //MARK: - Public properties
    
    public var textFieldShouldBeginEditing: ((UITextField) -> (Bool))?
    public var textFieldDidEndEditing: ((String?) -> ())?
    public var textFieldDidBeginEditing: ((String?) -> ())?
    public var textFieldShouldChangeCharactersIn: ((UITextField, NSRange, String) -> (Bool))?
    
    public var isCompact: Bool = true {
        didSet {
            isCompact ? (arrowImageView.transform = .identity) : (arrowImageView.transform = CGAffineTransform(rotationAngle: -.pi))
        }
    }
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite
        view.setShadow(cornerRadius: 12,
                       shadowOpacity: 0.1,
                       shadowRadius: 4,
                       shadowOffset: .zero,
                       shadowColor: Color.black)
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.brandGreen
        label.font = Font.noticiaRegular(size: 14)
        mainBackgroundView.addSubviewsUsingAutoLayout(label)
        
        return label
    }()
    
    public lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = Color.black
        textField.font = Font.noticiaRegular(size: 15)
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.tintColor = Color.brandGreen
        textField.delegate = self
        mainBackgroundView.addSubviewsUsingAutoLayout(textField)
        
        return textField
    }()
    
    public lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "chevron.down")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Color.brandGreen
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapArrow(recognizer:))))
        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
        
        return imageView
    }()
    
    public lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandGreen
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    //MARK: - Initialization
    
    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAutoLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupAutoLayout()
    }
    
    //MARK: - Selectors
    
    @objc private func didTapArrow(recognizer: UITapGestureRecognizer) {
        textField.becomeFirstResponder()
    }
    
    //MARK: - Setup
    
    private func setupAutoLayout() {
        contentView.fill(with: mainBackgroundView, to: contentView.safeAreaLayoutGuide, insets: UIEdgeInsets(top: 12, left: 12, bottom: -12, right: -12))
        
        titleLabel.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 24)
        titleLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 24)
        titleLabel.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -24)
        
        textField.topAnchor.constrain(anchor: titleLabel.bottomAnchor, constant: 24)
        textField.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 24)
        textField.trailingAnchor.constrain(anchor: arrowImageView.leadingAnchor, constant: -24)
        
        arrowImageView.heightAnchor.constrain(constant: 28)
        arrowImageView.widthAnchor.constrain(constant: 28)
        arrowImageView.topAnchor.constrain(.greaterThanOrEqual, anchor: mainBackgroundView.topAnchor, constant: 30)
        arrowImageView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -24)
        arrowImageView.bottomAnchor.constrain(anchor: separatorView.topAnchor, constant: -5)
        
        separatorView.heightAnchor.constrain(constant: 0.5)
        separatorView.topAnchor.constrain(anchor: textField.bottomAnchor, constant: 9)
        separatorView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: 24)
        separatorView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: -24)
        separatorView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor, constant: -24)
    }
}

//MARK: - UITextFieldDelegate

extension PickerInputCell: UITextFieldDelegate {
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let shouldBeginEditing = textFieldShouldBeginEditing?(textField) {
            return shouldBeginEditing
        } else {
            return true
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldDidEndEditing?(textField.text)
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldDidBeginEditing?(textField.text)
    }
    
    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        if let shouldChangeCharactersIn = textFieldShouldChangeCharactersIn?(textField, range, string) {
            return shouldChangeCharactersIn
        } else {
            return true
        }
    }
}

