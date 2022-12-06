//
//  TextInputCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

class TextInputCell: UITableViewCell {
    
    //MARK: - Public properties
    
    public lazy var mainBackgroundViewTopContrain: NSLayoutConstraint = {
        return mainBackgroundView.topAnchor.constrain(anchor: contentView.topAnchor, isActive: false)
    }()
    
    public lazy var mainBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.white
        contentView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.brandGreen
//        label.font =
        mainBackgroundView.addSubviewsUsingAutoLayout(label)

        return label
    }()
    
    public lazy var textField: UITextField = {
        let textField = UITextField()
        textField.tintColor = Color.brandGreen
        textField.textColor = Color.black
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
//        textField.font = 
        mainBackgroundView.addSubviewsUsingAutoLayout(textField)
        
        return textField
    }()
    
    public lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.darkGray
        view.heightAnchor.constrain(constant: 0.5)
        mainBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var validationLabel: UILabel = {
        let label = UILabel()
//        label.font = 
        label.textColor = .red
        label.isHidden = true
        mainBackgroundView.addSubviewsUsingAutoLayout(label)

        return label
    }()
    
    private struct LayoutConstants {
        static let trailing: CGFloat = -12
        static let leading: CGFloat = 12
    }
    
    //MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupMainbackgroundLayout()
        setupTitleLabelConstraints()
        setupTextFieldConstraints()
        setupSeparatorViewConstraints()
        setupValidationLabel()
        addDidBeginEditingTextFieldObserver()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupMainbackgroundLayout()
        setupTitleLabelConstraints()
        setupTextFieldConstraints()
        setupSeparatorViewConstraints()
        setupValidationLabel()
        addDidBeginEditingTextFieldObserver()
    }
    
    deinit {
        removeDidBeginEditingTextFieldObserver()
    }
    
    //MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        mainBackgroundView.layer.cornerRadius = 0
        mainBackgroundView.layer.shadowRadius = 0
        mainBackgroundView.layer.shadowColor = nil
        mainBackgroundView.layer.shadowOpacity = 0
        mainBackgroundView.layer.shadowOffset = CGSize.zero
        mainBackgroundViewTopContrain.constant = 0
        separatorView.backgroundColor = Color.darkGray
        titleLabel.textColor = Color.brandGreen
        titleLabel.text = nil
        textField.text = nil
        textField.placeholder = nil
        validationLabel.text = nil
    }
    
    //MARK: - Setup autolayout
    
    private func setupMainbackgroundLayout() {
        mainBackgroundViewTopContrain.isActive = true
        mainBackgroundView.bottomAnchor.constrain(anchor: contentView.bottomAnchor)
        mainBackgroundView.leadingAnchor.constrain(anchor: contentView.leadingAnchor)
        mainBackgroundView.trailingAnchor.constrain(anchor: contentView.trailingAnchor)
    }
    
    private func setupTitleLabelConstraints() {
        titleLabel.topAnchor.constrain(anchor: mainBackgroundView.topAnchor, constant: 24.deviceSizeAware)
        titleLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: LayoutConstants.leading)
        titleLabel.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: LayoutConstants.trailing)
    }
    
    private func setupTextFieldConstraints() {
        textField.topAnchor.constrain(anchor: titleLabel.bottomAnchor, constant: 12.deviceSizeAware)
        textField.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: LayoutConstants.leading)
        textField.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: LayoutConstants.trailing)
    }
    
    private func setupSeparatorViewConstraints() {
        separatorView.topAnchor.constrain(anchor: textField.bottomAnchor, constant: 12.deviceSizeAware)
        separatorView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: LayoutConstants.leading)
        separatorView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: LayoutConstants.trailing)
    }
    
    private func setupValidationLabel() {
        validationLabel.topAnchor.constrain(anchor: separatorView.bottomAnchor, constant: 4.deviceSizeAware)
        validationLabel.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor, constant: LayoutConstants.leading)
        validationLabel.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor, constant: LayoutConstants.trailing)
        validationLabel.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
    }
}

// MARK: - Notification handling

extension TextInputCell {
    private func addDidBeginEditingTextFieldObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textfieldDidBeginEditing(notifiaction:)),
                                               name: UITextField.textDidBeginEditingNotification, object: nil)
    }
    
    private func removeDidBeginEditingTextFieldObserver() {
        NotificationCenter.default.removeObserver(self,
                                                  name: UITextField.textDidBeginEditingNotification,
                                                  object: nil)
    }
    
    // MARK: - Selectors
    
    @objc private func textfieldDidBeginEditing(notifiaction: Notification) {
        guard (notifiaction.object as? UITextField) == textField else { return }
        separatorView.backgroundColor = Color.brandGreen
    }
}

