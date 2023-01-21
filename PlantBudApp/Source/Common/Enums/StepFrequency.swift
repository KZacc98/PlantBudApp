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
            case .threeTimesADay: return "Three times a Day"
            case .twoTimesADay: return "Two times a day"
            case .daily: return "Daily"
            case .everyTwoDays: return "Every two days"
            case .everyThreeDays: return "Every three days"
            case .everyFourDays: return "Every four days"
            case .everyFiveDays: return "Every five days"
            case .everySixDays: return "Every six days"
            case .weekly: return "Weekly"
            case .everyTwoWeeks: return "Every two weeks"
            case .everyThreeWeeks: return "Every three weeks"
            case .onceAMonth: return "Once a month"
            case .onceAYear: return "Once a year"
            case .other: return "Other"
            case .default: return ""
        }
    }
}
