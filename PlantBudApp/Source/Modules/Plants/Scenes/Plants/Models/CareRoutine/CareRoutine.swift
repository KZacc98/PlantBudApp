//
//  CareRoutine.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 13/12/2022.
//

struct CareRoutine {
    let careRoutineId: Int
    let plantId: Int
    let isActive: Bool
    let isCompleted: Bool
    let isShared: Bool
    let flag: UserContentFlag
    let routineSteps: [RoutineStepDomain]?
    let createdAt: String
    let updatedAt: String?
}
