//
//  MainSectionHeaderData.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/12/2022.
//

import UIKit

struct MainSectionHeaderData {
    let title: String
    let containerBackgroundColor: UIColor
    let insets: UIEdgeInsets
    
    init(title: String,
         containerBackgroundColor: UIColor = Color.brandWhite,
         insets: UIEdgeInsets = UIEdgeInsets(top: 18, left: 0, bottom: 0, right: 0)) {
        
        self.title = title
        self.containerBackgroundColor = containerBackgroundColor
        self.insets = insets
    }
}
