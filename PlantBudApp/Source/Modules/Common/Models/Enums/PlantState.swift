//
//  PlantState.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/12/2022.
//

enum PlantState: String, Codable {
    case thriving = "thriving"
    case good = "good"
    case needsAttention = "needsAttention"
    case thirsty = "thirsty"
    case forgotten = "forgotten"
    case dead = "dead"
    case `default`
    
    func getStateValue(plantState: PlantState) -> Double {
        switch plantState {
        case .thriving:
            return 6.0
        case .good:
            return 4.0
        case .needsAttention:
            return 1.0
        case .thirsty:
            return 0
        case .forgotten:
            return -1.0
        case .dead:
            return -2.0
        case .default:
            return 3.0
        }
    }
    
    func caseNameWithEmoji() -> String {
        switch self {
        case .thriving:
            return "plantStateThriving".localized
        case .good:
            return "plantStateGood".localized
        case .needsAttention:
            return "plantStateNeedsAttention".localized
        case .thirsty:
            return  "plantStateThirsty".localized
        case .forgotten:
            return "plantStateForgotten".localized
        case .dead:
            return "plantStateDead".localized
        case .default:
            return "plantStateDefault".localized
        }
    }
}
