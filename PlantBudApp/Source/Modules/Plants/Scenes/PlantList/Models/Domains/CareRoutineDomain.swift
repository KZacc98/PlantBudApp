//
//  CareRoutineDomain.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 13/12/2022.
//

struct CareRoutineDomain {
    let id: Int
    let plantId: Int
    let isActive: Bool
    let isCompleted: Bool
    let isShared: Bool
    let flag: UserContentFlag
    let createdAt: String
    let updatedAt: String?
    
    init(remote: CareRoutineRemote) {
        self.id = remote.id
        self.plantId = remote.plantId
        self.isActive = remote.isActive
        self.isCompleted = remote.isCompleted
        self.isShared = remote.isShared
        self.flag = UserContentFlag(rawValue: remote.flag) ?? .default
        self.createdAt = remote.createdAt
        self.updatedAt = remote.updatedAt
    }
}

enum UserContentFlag: String, Codable {
    case offfensive = "offfensive"
    case useful = "useful"
    case best = "best"
    case `default`
}

