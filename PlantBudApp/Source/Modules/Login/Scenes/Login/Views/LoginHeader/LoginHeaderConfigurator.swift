//
//  LoginHeaderConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 20/11/2022.
//

import UIKit

final class LoginHeaderConfigurator {
//    
//    //MARK: - Private properties
//    
//    private let data: LoginHeaderData
//    
//    //MARK: - Initialization
//    
//    init(data: LoginHeaderData) {
//        self.data = data
//    }
//    
//    //MARK: - Selectors
//    
//    @objc private func hideKeybord() {
//        data.hideKeyboard?()
//    }
//}
//
//extension LoginHeaderConfigurator: ReusableViewConfiguratorInterface {
//    var type: AnyClass {
//        return LoginHeader.self
//    }
//    
//    func configure(view: UIView) {
//        guard let view = view as? LoginHeader else {
//            return
//        }
//        
//        view.mainBackgroundView.backgroundColor = data.backgroundColor
//        view.mainBackgroundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeybord)))
//        view.imageView.setImage(with: data.imageUrl, placeholder: Assets.Login.headerLogo)
//        view.helloLabel.text = "loginWelcome".localized + (data.helloTitle ?? "") + "!"
//        view.helloLabel.isHidden = data.helloTitle != nil ? false : true
//    }
//    
//    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
//        if UIDevice.current.isSmallDevice || UIDevice.current.screenType == .iPhones_6_6s_7_8 {
//            return size.height * 0.32
//        } else {
//            return size.height * 0.467
//        }
//    }
}
