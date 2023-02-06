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
        var preferred = "-"
        if let pl = NSLocale.preferredLanguages.first, let pref = pl.split(separator: "-").first { preferred = String(pref) }
        
        guard let _ = Bundle.main.path(forResource: preferred, ofType: "lproj") else {
            guard let en_path = Bundle.main.path(forResource: "en", ofType: "lproj"), let languageBundle = Bundle(path: en_path) else {
                return NSLocalizedString(self, tableName: nil, bundle: .main, value: "", comment: "")
            }
            
            return languageBundle.localizedString(forKey: self, value: self, table: nil)
        }
        
        return NSLocalizedString(self, comment: "")
    }
    
    var asNSString: NSString {
        return self as NSString
    }
}

