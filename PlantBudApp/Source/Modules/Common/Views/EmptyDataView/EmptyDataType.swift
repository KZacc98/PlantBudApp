//
//  EmptyDataType.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 26/11/2022.
//

import UIKit

/// Type of empty data
///
/// - none: "invisible" empty data
/// - loading: Data is loaded
/// - noData: No data available. Optionally with associated value that is a custom title.
/// - errorOccurred: The network is not reachable or any other error occurred. Associated value is an error description.
enum EmptyDataType: Equatable {
    case none
    case loading
    case noData(String?)
    case errorOccurred(String)
    
    /// Localized title of empty data
    var localizedTitle: String? {
        switch self {
        case .noData(let customTitle):
            guard let customTitle = customTitle else {
                return "emptyDataNoData".localized
            }
            
            return customTitle
        case .errorOccurred(let errorDescription):
                return errorDescription
        default:
            return nil
        }
    }
    
    /// Image of empty data
    var image: UIImage? {
        switch self {
        case .noData:
            return UIImage(systemName: "questionmark.square")
        case .errorOccurred:
            return UIImage(systemName: "icloud.slash")
        default:
            return nil
        }
    }
    
    // MARK: Initialization
    
    init(sectionSequence: SectionSequence, customTitle: String? = nil) {
        sectionSequence.isEmpty ? (self = .noData(customTitle)) : (self = .none)
    }
    
    init(error: Error, customTitle: String = "emptyDataErrorOccurred".localized) {
        var title: String = customTitle
//        if let httpError = error as? HTTPError,
//            let httpStatus = HTTPStatus(rawValue: httpError.statusCode),
//            httpStatus.isConnectionErrorCode {
//            title = customTitle + "\n" + "emptyDataNoInternet".localized
//        }
        
        self = .errorOccurred(title)
    }
}

