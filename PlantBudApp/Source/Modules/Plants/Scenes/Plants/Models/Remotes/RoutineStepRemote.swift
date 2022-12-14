//
//  RoutineStepRemote.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 13/12/2022.
//

struct RoutineStepRemote: Codable {
    let id: Int
    let careRoutineId: Int
    let stepFrequency: String
    let otherFrequency: String?
    let description: String?
    let isCompleted: Bool
    let completedAt: String?
    let createdAt: String
    let updatedAt: String?
}
