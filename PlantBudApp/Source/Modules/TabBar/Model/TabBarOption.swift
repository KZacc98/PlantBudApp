//
//  TabBarOption.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

public enum TabBarOption: CaseIterable {
    case home
    case myPlants
    case badges
    case community
    
    public var tabBarItem: UITabBarItem {
        switch self {
        case .home:
            return UITabBarItem(title: "tabBarOptionHome".localized,
                                image: UIImage(systemName: "house"),
                                selectedImage: nil)
        case .myPlants:
            return UITabBarItem(title: "tabBarOptionLeaf".localized,
                                image: UIImage(systemName: "leaf"),
                                selectedImage: nil)
        case .badges:
            return UITabBarItem(title: "tabBarOptionBadge".localized,
                                image: UIImage(systemName: "medal"),
                                selectedImage: nil)
        case .community:
            return UITabBarItem(title: "tabBarOptionCommunity".localized,
                                image: UIImage(systemName: "person.3"),
                                selectedImage: nil)
        }
    }
    
    public var coordinator: TabBarItemCoordinator {
        switch self {
        case .home:
            return HomeCoordinator(tabBarItem: tabBarItem)
        case .myPlants:
            return PlantsCoordinator(tabBarItem: tabBarItem)
        case .badges:
            return BadgesCoordinator(tabBarItem: tabBarItem)
        case .community:
            return CommunityCoordinator(tabBarItem: tabBarItem)
        }
    }
}

