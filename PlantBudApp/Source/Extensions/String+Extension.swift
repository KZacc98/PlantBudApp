//
//  String+Extension.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 19/11/2022.
//

import UIKit

extension String: LocalizedError {
    public var errorDescription: String? { return self }
    
    var localized: String {
        let preferred = NSLocale.preferredLanguages.first?.split(separator: "-").first.flatMap {
            String($0) } ?? "en"
        let languageBundle = Bundle.main.path(forResource: preferred, ofType: "lproj").flatMap {
            Bundle(path: $0) } ?? Bundle.main
        return languageBundle.localizedString(forKey: self, value: self, table: nil)
    }
    
    var asNSString: NSString {
        return self as NSString
    }
}

