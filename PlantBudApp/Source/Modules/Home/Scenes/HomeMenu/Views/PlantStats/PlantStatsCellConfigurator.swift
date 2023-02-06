//
//  PlantStatsCellConfigurator.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/12/2022.
//

import UIKit

final class PlantStatsCellConfigurator {
    
    // MARK: - Private properties
    
    private let data: PlantStatsCellData
    
    // MARK: - Initialization
    
    init(data: PlantStatsCellData) {
        self.data = data
    }
}

// MARK: - ReusableViewConfiguratorInterface

extension PlantStatsCellConfigurator: ReusableViewConfiguratorInterface {
    var type: AnyClass {
        return PlantStatsCell.self
    }
    
    func configure(view: UIView) {
        guard let view = view as? PlantStatsCell else { return }
        
        let plantStates = data.plants.compactMap { plant in
            plant.plantState
        }
        
        let mean = plantStates.map { state in
            state.getStateValue(plantState: state)
        }.reduce(0.0, +) / Double(plantStates.count)
        
        let stateMessage: String = getStateMessage(mean: mean, plantStates: plantStates)
        
        view.selectionStyle = .none
        view.backgroundColor = Color.brandWhite
        view.plantsMeanStateLabel.text = mean.stateWithEmoji()
        view.plantsMeanStateCommentLabel.text = stateMessage
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func getStateMessage(mean: Double, plantStates: [PlantState]) -> String {
        var message: String = ""
        let perfectScoreMsgs = [
            "perfectScore1".localized,
            "perfectScore2".localized,
            "perfectScore3".localized
        ]
        let thirstyMsgs = [
            "thirsty1".localized,
            "thirsty2".localized,
            "thirsty3".localized
        ]
        
        let forgottenMsgs = [
            "forgotten1".localized,
            "forgotten2".localized,
            "forgotten3".localized
        ]
        
        let regularMsgs = [
            "regular1".localized,
            "regular2".localized,
            "regular3".localized
        ]
        
        if plantStates.contains(where: { state in
            state == .thirsty
        }) {
            message = thirstyMsgs.randomElement() ?? "noMessage".localized
            return message
        } else if plantStates.contains(where: { state in
            state == .needsAttention
        }) {
            message = forgottenMsgs.randomElement() ?? "noMessage".localized
            return message
        }
        
        if mean == 6 {
            message = perfectScoreMsgs.randomElement() ?? "noMessage".localized
            return message
        } else if mean >= 3.5 {
            message = regularMsgs.randomElement() ?? "noMessage".localized
            return message
        } else {
            message = forgottenMsgs.randomElement() ?? "noMessage".localized
            return message
        }
    }
    
}

struct PlantStatsCellData {
    let plants: [PlantDomain]
}


