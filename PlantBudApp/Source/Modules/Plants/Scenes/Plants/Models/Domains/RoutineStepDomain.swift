//
//  RoutineStepDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 13/12/2022.
//

struct RoutineStepDomain {
    let id: Int
    let careRoutineId: Int
    let stepFrequency: StepFrequency
    let otherFrequency: String?
    let description: String
    let isCompleted: Bool
    let completedAt: String?
    let createdAt: String
    let updatedAt: String?
    
    init(remote: RoutineStepRemote) {
        self.id = remote.id
        self.careRoutineId = remote.careRoutineId
        self.stepFrequency = StepFrequency(rawValue: remote.stepFrequency) ?? .default
        self.otherFrequency = remote.otherFrequency
        self.description = remote.description ?? ""
        self.isCompleted = remote.isCompleted
        self.completedAt = remote.completedAt
        self.createdAt = remote.createdAt
        self.updatedAt = remote.updatedAt
    }
}

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
