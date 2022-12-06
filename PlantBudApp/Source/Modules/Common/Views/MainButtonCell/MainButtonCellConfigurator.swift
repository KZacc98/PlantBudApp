//
//  MainButtonCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

class MainButtonCellConfigurator {
    
    //MARK: - Public properties
    
    public var data: MainButtonCellData
    
    //MARK: - Initialization
    
    init(data: MainButtonCellData) {
        self.data = data
    }
    
    //MARK: - Selectors
    
    @objc private func didPressButton(sender: UIButton) {
        data.didPressButton?()
    }
}

extension MainButtonCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return MainButtonCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? MainButtonCell else {
            return
        }
        
        view.selectionStyle = .none
        view.backgroundColor = data.backgroundColor
        view.button.setTitle(data.title, for: .normal)
        view.button.addTarget(self, action: #selector(didPressButton(sender:)), for: .touchUpInside)
        view.setupButtonConstraints(insets: data.buttonInsets)
        view.isEnabled = data.isEnabled
        data.refreshButtonState = { [weak self, weak view] in
            guard let self = self else { return }
            view?.isEnabled = self.data.isEnabled
        }
        
        data.startLoading = { [weak view] in
            view?.button.showLoading()
        }
        
        data.stopLoading = { [weak view] in
            view?.button.hideLoading()
        }
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
}

