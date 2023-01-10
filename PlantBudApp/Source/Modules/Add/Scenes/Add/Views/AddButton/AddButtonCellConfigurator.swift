//
//  AddButtonCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import UIKit

final class AddButtonCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: AddButtonCellData
    
    // MARK: - Initialization
    
    init(data: AddButtonCellData) {
        self.data = data
    }
    
    // MARK: - Selectors
    
    @objc private func didPressButton(tapGestureRecognizer: UITapGestureRecognizer) {
        data.didPressButton?()
    }
    
}

// MARK: - ReusableViewConfiguratorInterface

extension AddButtonCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return AddButtonCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? AddButtonCell else { return }
        
        view.selectionStyle = .none
//        view.stepLabel.text = data.title
        view.backgroundColor = Color.brandWhite
        view.buttonImage.image = UIImage(systemName: data.SFSymbolName)
        view.buttonNameLabel.text = data.buttonName
//        view.mainBackgroundView.backgroundColor = data.check ? Color.red : Color.brandGreen
        view.button.gestureRecognizers?.forEach {
            view.mainBackgroundView.removeGestureRecognizer($0)
        }
        view.button.addGestureRecognizer(
            UITapGestureRecognizer(
                target: self,
                action: #selector(didPressButton(tapGestureRecognizer:))))
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

struct AddButtonCellData {
    let SFSymbolName: String
    let buttonName: String
    let didPressButton: (() -> Void)?
    
    init(SFSymbolName: String, buttonName: String, didPressButton: (() -> Void)?) {
        self.SFSymbolName = SFSymbolName
        self.buttonName = buttonName
        self.didPressButton = didPressButton
    }
}


