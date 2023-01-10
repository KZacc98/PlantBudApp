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
    case addPlant
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
        case .addPlant:
            return UITabBarItem(title: "tabBarOptionPlus".localized,
                                image: UIImage(systemName: "plus"),
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
            Logger.info("HOME")
            return HomeCoordinator(tabBarItem: tabBarItem)//MyDietCoordinator(tabBarItem: tabBarItem)
        case .myPlants:
            Logger.info("PLANTS")
            return PlantsCoordinator(tabBarItem: tabBarItem)//MenuCoordinator(tabBarItem: tabBarItem)
        case .addPlant:
            Logger.info("HOME")
            return AddCoordinator(tabBarItem: tabBarItem)//OrdersCoordinator(tabBarItem: tabBarItem, navigationController: BaseNavigationController())
        case .badges:
            Logger.info("BADGES")
            return BadgesCoordinator(tabBarItem: tabBarItem)//NewsCoordinator(tabBarItem: tabBarItem)
        case .community:
            Logger.info("COMMUNITY")
            return CommunityCoordinator(tabBarItem: tabBarItem)//MoreCoordinator(tabBarItem: tabBarItem)
        }
    }
}

