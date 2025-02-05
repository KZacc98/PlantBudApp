//
//  AddRoutineStepCellData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/02/2025.
//

import UIKit

struct AddRoutineStepCellData {
    var text: String?
    var placeholder: String?
    let textViewHeight: CGFloat
    let maximumCommentTextLength: Int
    let returnTypeKey: UIReturnKeyType
    let autoCapitalizationType: UITextAutocapitalizationType
    var didPressAddStep: ((String?) -> Void)?
    var textViewDidChange: ((String?) -> Void)?
    var textViewDidEndEditing: ((String?) -> Void)?
    var textViewShouldChangeInRange: ((UITextView, NSRange, String) -> (Bool))?

    init(text: String? = nil,
         placeholder: String? = nil,
         textViewHeight: CGFloat,
         maximumCommentTextLength: Int,
         returnTypeKey: UIReturnKeyType = .default,
         autoCapitalizationType: UITextAutocapitalizationType = .sentences,
         didPressAddStep: ((String?) -> Void)?,
         textViewDidChange: ((String?) -> ())? = nil,
         textViewDidEndEditing: ((String?) -> ())? = nil,
         textViewShouldChangeInRange: ((UITextView, NSRange, String) -> (Bool))? = nil) {

        self.text = text
        self.placeholder = placeholder
        self.textViewHeight = textViewHeight
        self.maximumCommentTextLength = maximumCommentTextLength
        self.returnTypeKey = returnTypeKey
        self.autoCapitalizationType = autoCapitalizationType
        self.didPressAddStep = didPressAddStep
        self.textViewDidChange = textViewDidChange
        self.textViewDidEndEditing = textViewDidEndEditing
        self.textViewShouldChangeInRange = textViewShouldChangeInRange
    }
}
