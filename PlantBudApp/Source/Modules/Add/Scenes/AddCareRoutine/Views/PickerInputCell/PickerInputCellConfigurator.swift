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
