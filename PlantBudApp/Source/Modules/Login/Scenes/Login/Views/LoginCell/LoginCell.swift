//
//  LoginCell.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 12/01/2023.
//

import UIKit
import Lottie

final class LoginCell: UITableViewCell {
    
    // MARK: - Public properties
    
    //public var didPressButton: (() -> ())?
    
//    public lazy var mainBackgroundView: UIView = {
//        let view = UIView()
//        view.backgroundColor = Color.brandGreen
//
//
//        return view
//    }()
    
    
    public lazy var animationBackgroundView: LottieAnimationView = {
        var animationView = LottieAnimationView(name: "app_login")
        animationView.loopMode = .playOnce
        animationView.play()
        contentView.addSubviewsUsingAutoLayout(animationView)
        return animationView
    }()
    
    public lazy var inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite.withAlphaComponent(0.8)
        view.setShadow(cornerRadius: 8,
                       shadowOpacity: 0.1,
                       shadowRadius: 4,
                       shadowOffset: .zero,
                       shadowColor: Color.brandGreen)
        view.layer.borderColor = Color.brandBlack.withAlphaComponent(0.5).cgColor
        animationBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var loginInputBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite.withAlphaComponent(0.5)
        inputsContainerView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.brandGreen
        label.textAlignment = .center
        label.font = Font.noticiaRegular(size: 16)
        loginInputBackgroundView.addSubviewsUsingAutoLayout(label)

        return label
    }()
    
    public lazy var textField: UITextField = {
        let textField = UITextField()
        textField.tintColor = Color.brandGreen
        textField.textColor = Color.black
        textField.textAlignment = .center
        textField.font = Font.noticiaRegular(size: 16)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        loginInputBackgroundView.addSubviewsUsingAutoLayout(textField)
        
        return textField
    }()
    
    public lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.darkGray
        view.heightAnchor.constrain(constant: 0.5)
        loginInputBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var validationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.isHidden = true
        loginInputBackgroundView.addSubviewsUsingAutoLayout(label)

        return label
    }()
    
    
    
    
    //password
    public lazy var passwordInputBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.brandWhite.withAlphaComponent(0.5)
        inputsContainerView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var passwordTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Color.brandGreen
        label.textAlignment = .center
        label.font = Font.noticiaRegular(size: 16)
        loginInputBackgroundView.addSubviewsUsingAutoLayout(label)

        return label
    }()
    
    public lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = Color.brandGreen
        textField.textColor = Color.black
        textField.textAlignment = .center
        textField.font = Font.noticiaRegular(size: 16)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        loginInputBackgroundView.addSubviewsUsingAutoLayout(textField)
        
        return textField
    }()
    
    public lazy var passwordSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.darkGray
        view.heightAnchor.constrain(constant: 0.5)
        loginInputBackgroundView.addSubviewsUsingAutoLayout(view)
        
        return view
    }()
    
    public lazy var passwordValidationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.isHidden = true
        loginInputBackgroundView.addSubviewsUsingAutoLayout(label)

        return label
    }()
    
    
    
    
//
//    lazy var communityImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        mainBackgroundView.addSubviewsUsingAutoLayout(imageView)
//
//        return imageView
//
//    }()
//
//    public lazy var communityNameContainer: UIView = {
//        let gradientView = UIView()
//        gradientView.backgroundColor = Color.brandWhite
//        mainBackgroundView.addSubviewsUsingAutoLayout(gradientView)
//
//        return gradientView
//    }()
//
//    public lazy var communityNameLabel: UILabel = {
//        let label = UILabel()
//        label.font = Font.noticiaRegular(size: 24)
//        label.textColor = Color.brandBlack
//        label.textAlignment = .center
//        label.numberOfLines = 1
//        label.lineBreakMode = .byWordWrapping
//        communityNameContainer.addSubviewsUsingAutoLayout(label)
//
//        return label
//    }()
//
//    public lazy var communityDescriptionView: UIView = {
//        let view = UIView()
//        view.backgroundColor = Color.brandWhite
//        view.layer.borderWidth = 0.2
//        view.layer.borderColor = Color.brandBlack.withAlphaComponent(0.5).cgColor
//        view.clipsToBounds = true
//        mainBackgroundView.addSubviewsUsingAutoLayout(view)
//
//        return view
//    }()
//
//    public lazy var communityDescriptionLabel: UILabel = {
//        let label = UILabel()
//        label.font = Font.noticiaRegular(size: 12)
//        label.textColor = Color.brandBlack
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        communityDescriptionView.addSubviewsUsingAutoLayout(label)
//
//        return label
//    }()
    
    // MARK: - Selectors
    
//    @objc private func didPressButton(_ sender: UIButton) {
//        didPressButton?()
//    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupAutoLayout()
        addDidBeginEditingTextFieldObserver()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupAutoLayout()
        addDidBeginEditingTextFieldObserver()
    }
    
    // MARK: - Setup
    
    
    
    private func setupAutoLayout() {
        contentView.fill(
            with: animationBackgroundView,
            to: contentView.safeAreaLayoutGuide,
            insets: UIEdgeInsets(top: -50, left: -12, bottom: 0, right: 0)
        )
        
        animationBackgroundView.fill(
            with: inputsContainerView,
            to: animationBackgroundView.safeAreaLayoutGuide,
            insets: UIEdgeInsets(top: 100, left: 12, bottom: -100, right: -12)
        )
        
        loginInputBackgroundView.centerYAnchor.constrain(anchor: inputsContainerView.centerYAnchor)
        loginInputBackgroundView.centerXAnchor.constrain(anchor: inputsContainerView.centerXAnchor)
        loginInputBackgroundView.leadingAnchor.constrain(anchor: inputsContainerView.leadingAnchor)
        loginInputBackgroundView.trailingAnchor.constrain(anchor: inputsContainerView.trailingAnchor)
        
        textField.topAnchor.constrain(anchor: loginInputBackgroundView.topAnchor, constant: 12.deviceSizeAware)
        textField.leadingAnchor.constrain(anchor: loginInputBackgroundView.leadingAnchor)
        textField.trailingAnchor.constrain(anchor: loginInputBackgroundView.trailingAnchor)
        
        separatorView.topAnchor.constrain(anchor: textField.bottomAnchor, constant: 12.deviceSizeAware)
        separatorView.leadingAnchor.constrain(anchor: loginInputBackgroundView.leadingAnchor)
        separatorView.trailingAnchor.constrain(anchor: loginInputBackgroundView.trailingAnchor)
        
        validationLabel.topAnchor.constrain(anchor: separatorView.bottomAnchor, constant: 4.deviceSizeAware)
        validationLabel.leadingAnchor.constrain(anchor: loginInputBackgroundView.leadingAnchor)
        validationLabel.trailingAnchor.constrain(anchor: loginInputBackgroundView.trailingAnchor)
        validationLabel.bottomAnchor.constrain(anchor: loginInputBackgroundView.bottomAnchor)
        
        
        passwordInputBackgroundView.topAnchor.constrain(anchor: textField.bottomAnchor, constant: 12)
        passwordInputBackgroundView.leadingAnchor.constrain(anchor: inputsContainerView.leadingAnchor)
        passwordInputBackgroundView.trailingAnchor.constrain(anchor: inputsContainerView.trailingAnchor)
        
        passwordTextField.topAnchor.constrain(anchor: passwordInputBackgroundView.topAnchor, constant: 12.deviceSizeAware)
        passwordTextField.leadingAnchor.constrain(anchor: passwordInputBackgroundView.leadingAnchor)
        passwordTextField.trailingAnchor.constrain(anchor: passwordInputBackgroundView.trailingAnchor)
        
        passwordSeparatorView.topAnchor.constrain(anchor: passwordTextField.bottomAnchor, constant: 12.deviceSizeAware)
        passwordSeparatorView.leadingAnchor.constrain(anchor: passwordInputBackgroundView.leadingAnchor)
        passwordSeparatorView.trailingAnchor.constrain(anchor: passwordInputBackgroundView.trailingAnchor)
        
        passwordValidationLabel.topAnchor.constrain(anchor: passwordSeparatorView.bottomAnchor, constant: 4.deviceSizeAware)
        passwordValidationLabel.leadingAnchor.constrain(anchor: passwordInputBackgroundView.leadingAnchor)
        passwordValidationLabel.trailingAnchor.constrain(anchor: passwordInputBackgroundView.trailingAnchor)
        passwordValidationLabel.bottomAnchor.constrain(anchor: passwordInputBackgroundView.bottomAnchor)
        
        
        
        
        
//        communityImage.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
//        communityImage.bottomAnchor.constrain(anchor: communityNameContainer.topAnchor)
//        communityImage.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
//        communityImage.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
//        
//        communityImage.topAnchor.constrain(anchor: mainBackgroundView.topAnchor)
//        communityImage.bottomAnchor.constrain(anchor: communityNameContainer.topAnchor)
//        communityImage.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
//        communityImage.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
//        
//        communityNameContainer.topAnchor.constrain(anchor: communityImage.bottomAnchor)
//        communityNameContainer.leadingAnchor.constrain(anchor: communityImage.leadingAnchor)
//        communityNameContainer.trailingAnchor.constrain(anchor: communityImage.trailingAnchor)
//        communityNameContainer.heightAnchor.constrain(constant: 50)
//        
//        communityNameLabel.centerXAnchor.constrain(anchor: communityNameContainer.centerXAnchor)
//        communityNameLabel.centerYAnchor.constrain(anchor: communityNameContainer.centerYAnchor)
//        
//        communityDescriptionView.topAnchor.constrain(anchor: communityNameContainer.bottomAnchor)
//        communityDescriptionView.bottomAnchor.constrain(anchor: mainBackgroundView.bottomAnchor)
//        communityDescriptionView.leadingAnchor.constrain(anchor: mainBackgroundView.leadingAnchor)
//        communityDescriptionView.trailingAnchor.constrain(anchor: mainBackgroundView.trailingAnchor)
//        
//        communityDescriptionLabel.topAnchor.constrain(anchor: communityDescriptionView.topAnchor, constant: 12)
//        communityDescriptionLabel.bottomAnchor.constrain(anchor: communityDescriptionView.bottomAnchor,constant: -12)
//        communityDescriptionLabel.leadingAnchor.constrain(anchor: communityDescriptionView.leadingAnchor, constant: 12)
//        communityDescriptionLabel.trailingAnchor.constrain(anchor: communityDescriptionView.trailingAnchor, constant: -12)
    }
}

// MARK: - Notification handling

extension LoginCell {
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





