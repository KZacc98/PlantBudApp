//
//  UITabBarController+Extension.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/11/2022.
//

import UIKit

extension UITabBarController {
    public func setDefaultStyle() {
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = Color.brandWhite
//            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.font:]
//            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.font:]
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = appearance
        }

        tabBar.barTintColor = .systemPink
        tabBar.tintColor = Color.brandGreen
        tabBar.unselectedItemTintColor = Color.brandBlack
        tabBar.layer.shadowColor = Color.brandBlack.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 1)
        tabBar.isTranslucent = true
//        UITabBarItem.appearance().setTitleTextAttributes([.font:], for: .normal)
    }
}

