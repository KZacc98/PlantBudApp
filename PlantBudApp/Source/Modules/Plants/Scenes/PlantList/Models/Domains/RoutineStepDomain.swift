//
//  RoutineStepDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 13/12/2022.
//

import Foundation

struct RoutineStepDomain {
    let id: Int
    let careRoutineId: Int
    let stepFrequency: StepFrequency
    let otherFrequency: String?
    let description: String
    let isCompleted: Bool
    let completedAt: Date
    let createdAt: Date
    let updatedAt: Date?
    
    init(remote: RoutineStepRemote) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        self.id = remote.id
        self.careRoutineId = remote.careRoutineId
        self.stepFrequency = StepFrequency(rawValue: remote.stepFrequency) ?? .default
        self.otherFrequency = remote.otherFrequency
        self.description = remote.description ?? ""
        self.isCompleted = remote.isCompleted
        self.completedAt = dateFormatter.date(from: remote.completedAt ?? Date().description) ?? Date()
        self.createdAt = dateFormatter.date(from: remote.createdAt) ?? Date()
        self.updatedAt = dateFormatter.date(from: remote.updatedAt ?? Date().description)
    }
}
