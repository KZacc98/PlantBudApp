//
//  PickerInputCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/01/2023.
//

import UIKit

final class PickerInputCellConfigurator {
    
    //MARK: - Public properties
    
    public var data: PickerInputCellData
    
    //MARK: - Initialization
    
    init(data: PickerInputCellData) {
        self.data = data
    }
}

//MARK: - ReusableViewConfiguratorInterface

extension PickerInputCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return PickerInputCell.self
    }

    func configure(view: UIView) {
        guard let view = view as? PickerInputCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.titleLabel.text = data.title
        view.textField.placeholder = data.placeHolder
        view.textField.inputView = data.inputView
        view.textField.inputAccessoryView = data.toolbar
        view.textField.text = data.text
        view.isCompact = data.isCompact
        view.textFieldShouldBeginEditing = data.textFieldShouldBeginEditing
        view.textFieldDidEndEditing = data.textFieldDidEndEditing
        view.textFieldDidBeginEditing = data.textFieldDidBeginEditing
        view.textFieldShouldChangeCharactersIn = data.textFieldShouldChangeCharactersIn
        data.refreshTextField = { [weak self, weak view] in
            view?.textField.text = self?.data.text
        }
        data.refreshCompact = { [weak self, weak view] in
            guard let self = self else { return}
            view?.isCompact = self.data.isCompact
        }
    }

    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}


struct PickerInputCellData {
    let title: String
    let placeHolder: String
    let inputView: UIView
    let toolbar: UIView?
    let returnKey: UIReturnKeyType
    var text: String?
    var isCompact: Bool
    var refreshCompact: (() -> ())?
    var refreshTextField: (() -> ())?
    var textFieldShouldBeginEditing: ((UITextField) -> (Bool))?
    var textFieldDidEndEditing: ((String?) -> ())?
    var textFieldDidBeginEditing: ((String?) -> ())?
    var textFieldShouldChangeCharactersIn: ((UITextField, NSRange, String) -> (Bool))?
    
    init(title: String,
         placeholder: String,
         inputView: UIView,
         toolbar: UIView?,
         returnKey: UIReturnKeyType,
         text: String?,
         isCompact: Bool,
         setCompact: (() -> ())? = nil,
         refreshTextField: (() -> ())? = nil,
         textFieldShouldBeginEditing: ((UITextField) -> (Bool))? = nil,
         textFieldDidEndEditing: ((String?) -> ())? = nil,
         textFieldDidBeginEditing: ((String?) -> ())? = nil,
         textFieldShouldChangeCharactersIn: ((UITextField, NSRange, String) -> (Bool))? = nil) {
        
        self.title = title
        self.placeHolder = placeholder
        self.inputView = inputView
        self.toolbar = toolbar
        self.returnKey = returnKey
        self.text = text
        self.isCompact = isCompact
        self.refreshCompact = setCompact
        self.refreshTextField = refreshTextField
        self.textFieldShouldBeginEditing = textFieldShouldBeginEditing
        self.textFieldDidEndEditing = textFieldDidEndEditing
        self.textFieldDidBeginEditing = textFieldDidBeginEditing
        self.textFieldShouldChangeCharactersIn = textFieldShouldChangeCharactersIn
    }
}

