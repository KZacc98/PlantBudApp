//
//  PickerInputCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/02/2025.
//

import UIKit

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
