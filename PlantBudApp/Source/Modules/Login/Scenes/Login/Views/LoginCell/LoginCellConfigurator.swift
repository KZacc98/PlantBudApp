//
//  LoginCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 12/01/2023.
//

import UIKit

final class LoginCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: String
    
    let profilePicturePlaceholder: String = "https://res.cloudinary.com/dv1dmymg2/image/upload/v1674924697/PlantBuddy/Placeholders/UserImagePlaceholderLight_hthfkm.png"
    
    // MARK: - Initialization
    
    init(data: String) {
        self.data = data
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension LoginCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return LoginCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? LoginCell else { return }
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UIScreen.main.bounds.height
    }
}




