//
//  CareRoutineRemote.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 13/12/2022.
//

struct CareRoutineRemote: Codable {
    let id: Int
    let plantId: Int
    let isActive: Bool
    let isCompleted: Bool
    let isShared: Bool
    let flag: String
    let createdAt: String
    let updatedAt: String?
}


