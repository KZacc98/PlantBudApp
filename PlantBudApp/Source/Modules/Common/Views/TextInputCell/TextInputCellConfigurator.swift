//
//  TextInputCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

class TextInputCellConfigurator: NSObject {

    //MARK: - Public properties
    
    public var didBecomeFirstResponder: ((InputInterface) -> Void)?
    public var data: TextInputCellData
    public var validationResult: ValidationResult = .none
    
    // MARK: - Private properties
    
    private var getView: (() -> (TextInputCell?))?

    //MARK: - Initialization

    init(data: TextInputCellData) {
        self.data = data
    }

    public func setupAfterValidation(result: ValidationResult, view: TextInputCell) {
        switch result {
        case .failed(let error):
            view.validationLabel.isHidden = false
            view.validationLabel.text = error.localizedDescription
            view.separatorView.backgroundColor = Color.red
            view.titleLabel.textColor = Color.red
        default:
            view.validationLabel.isHidden = true
            view.validationLabel.text = nil
            view.titleLabel.textColor = Color.brandGreen
            view.separatorView.backgroundColor = (data.text ?? "").isEmpty ? Color.darkGray : Color.brandGreen
        }
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension TextInputCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return TextInputCell.self
    }

    func configure(view: UIView) {
        guard let view = view as? TextInputCell else {
            return
        }
        
        getView = { [weak view] in
            return view
        }
        
        view.backgroundColor = .clear
        view.contentView.backgroundColor = .clear
        view.selectionStyle = .none
        view.titleLabel.text = data.title
        view.textField.returnKeyType = data.returnKey
        view.textField.text = data.text
        view.textField.placeholder = data.placeHolder
        view.textField.isSecureTextEntry = data.isSecureTextEntry
        view.textField.keyboardType = data.keyboardType
        view.textField.delegate = self
        view.textField.inputAccessoryView = data.inputAccessoryView
        setupAfterValidation(result: validationResult, view: view)
    }

    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - UITextFieldDelegate

extension TextInputCellConfigurator: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return !textField.resignFirstResponder()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        data.textfieldDidEndEditing?(textField.text)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        didBecomeFirstResponder?(self)
    }
}

//MARK: - Validable

extension TextInputCellConfigurator: Validable {
    func validate() -> ValidationResult {
        return data.validator.validate(value: data.text)
    }
}

// MARK: - InputInterface

extension TextInputCellConfigurator: InputInterface {
    var isFirstResponder: Bool {
        return getView?()?.textField.isFirstResponder ?? false
    }

    func resignFirstResponder() {
        getView?()?.textField.resignFirstResponder()
    }

    func becomeFirstResponder() {
        getView?()?.textField.becomeFirstResponder()
    }
}

