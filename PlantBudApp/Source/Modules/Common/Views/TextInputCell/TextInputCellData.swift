//
//  TextInputCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

struct TextInputCellData {
    let title: String
    let placeHolder: String
    var text: String?
    var isSecureTextEntry: Bool
    let returnKey: UIReturnKeyType
    let keyboardType: UIKeyboardType
    let validator: TextValidator
    let inputAccessoryView: UIView?
    var textfieldDidEndEditing: ((String?) -> ())?
    
    //MARK: - Initialization
    
    init(title: String,
         placeHolder: String,
         text: String? = nil,
         isSecureTextEntry: Bool,
         returnKey: UIReturnKeyType = .done,
         keyboardType: UIKeyboardType = UIKeyboardType.default,
         validator: TextValidator,
         inputAccessoryView: UIView? = nil,
         textfieldDidEndEditing: ((String?) -> ())? = nil) {
        
        self.title = title
        self.placeHolder = placeHolder
        self.text = text
        self.isSecureTextEntry = isSecureTextEntry
        self.returnKey = returnKey
        self.keyboardType = keyboardType
        self.validator = validator
        self.inputAccessoryView = inputAccessoryView
        self.textfieldDidEndEditing = textfieldDidEndEditing
    }
}

