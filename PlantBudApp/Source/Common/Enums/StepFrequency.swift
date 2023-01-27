//
//  StepFrequency.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/01/2023.
//


enum StepFrequency: String, Codable {
    case threeTimesADay = "threeTimesADay"
    case twoTimesADay = "twoTimesADay"
    case daily = "daily"
    case everyTwoDays = "everyTwoDays"
    case everyThreeDays = "everyThreeDays"
    case everyFourDays = "everyFourDays"
    case everyFiveDays = "everyFiveDays"
    case everySixDays = "everySixDays"
    case weekly = "weekly"
    case everyTwoWeeks = "everyTwoWeeks"
    case everyThreeWeeks = "everyThreeWeeks"
    case onceAMonth = "onceAMonth"
    case onceAYear = "onceAYear"
    case other = "other"
    case `default`
}

extension StepFrequency {
    var days: Int {
        switch self {
            case .threeTimesADay: return 0
            case .twoTimesADay: return 0
            case .daily: return 1
            case .everyTwoDays: return 2
            case .everyThreeDays: return 3
            case .everyFourDays: return 4
            case .everyFiveDays: return 5
            case .everySixDays: return 6
            case .weekly: return 7
            case .everyTwoWeeks: return 14
            case .everyThreeWeeks: return 21
            case .onceAMonth: return 30
            case .onceAYear: return 365
            case .other: return 0
            case .default: return 0
        }
    }
}

extension StepFrequency {
    var displayName: String {
        switch self {
            case .threeTimesADay: return "threeTimesADay".localized
            case .twoTimesADay: return "twoTimesADay".localized
            case .daily: return "daily".localized
            case .everyTwoDays: return "everyTwoDays".localized
            case .everyThreeDays: return "everyThreeDays".localized
            case .everyFourDays: return "everyFourDays".localized
            case .everyFiveDays: return "everyFiveDays".localized
            case .everySixDays: return "everySixDays".localized
            case .weekly: return "weekly".localized
            case .everyTwoWeeks: return "everyTwoWeeks".localized
            case .everyThreeWeeks: return "everyThreeWeeks".localized
            case .onceAMonth: return "onceAMonth".localized
            case .onceAYear: return "onceAYear".localized
            case .other: return "other".localized
            case .default: return ""
        }
    }
}
