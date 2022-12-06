//
//  Font.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class Font {
    private static func fontWithName(_ name: String, size: CGFloat) -> UIFont {
        return UIFont(name: name, size: UIDevice.current.isSmallDevice ? size * 0.8 : size)!
    }
    
    static func noticiaBold(size: CGFloat) -> UIFont {
        return self.fontWithName("NoticiaText-Bold", size: size)
    }
    
    static func noticiaBoldItalic(size: CGFloat) -> UIFont {
        return self.fontWithName("NoticiaText-BoldItalic", size: size)
    }
    
    static func noticiaItalic(size: CGFloat) -> UIFont {
        return self.fontWithName("NoticiaText-Italic", size: size)
    }
    
    static func noticiaRegular(size: CGFloat) -> UIFont {
        return self.fontWithName("NoticiaText-Regular", size: size)
    }
}

