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
        view.plantsMeanStateLabel.text = "\(mean)"
        view.plantsMeanStateCommentLabel.text = stateMessage
//        view.didPressButton = data.didPressButton
    }
    
    func layoutHeight(relativeTo size: CGSize) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func getStateMessage(mean: Double, plantStates: [PlantState]) -> String {
        let perfectScoreMsgsswsssa = [
            "Our plants may not speak, but they surely do sing / When we give them the care that makes their leaves take wing. / We water and fertilize, prune and protect / So that our plants can thrive, and never neglect.",
            "Our plants are like our children, they need love and care / Without it, they wilt and droop, and that just isn't fair. / So we tend to them daily, with water and sunlight / And watch them grow strong, it's a beautiful sight.",
            "Our plants may not have voices, but they have hearts / And when they're well taken care of, they never fall apart. / We water and prune and give them some cheer / So they can grow tall and strong, all throughout the year."
        ]
        var message: String = ""
        let perfectScoreMsgs = [
            "Your plants are always looking so healthy and vibrant - it's clear that you have a real green thumb! Keep up the excellent work with their care.",
            "I am constantly amazed by the care and attention you give to your plants. Your hard work is really paying off - they look fantastic! Keep up the great job.",
            "I have to say, your plants are some of the most well-cared-for ones I've ever seen. Your dedication to their health is really paying off - they look amazing! Keep up the fantastic work."
        ]
        let thirstyMsgs = [
            "Hey there, just a friendly reminder that your plants could use some watering. They'll thank you for it with some healthy growth!",
            "It looks like your plants could use a drink - don't forget to water them to keep them looking their best!",
            "Hey, just a quick note to let you know that your plants are looking a little parched. Make sure to give them some water to keep them happy and healthy!"
        ]
        
        let forgottenMsgs = [
            "Hey there, it looks like your plants could use some love and attention. Don't forget to water and care for them so they can thrive!",
            "I noticed that your plants are looking a little neglected - don't forget to give them the care they need to stay healthy and happy!",
            "Hey, just a friendly reminder that your plants need some attention. Make sure to water and care for them regularly to keep them looking their best."
        ]
        
        let regularMsgs = [
            "I've noticed that you generally do a great job at caring for your plants, but there are a few areas where you could improve. Have you tried using different types of soil or fertilizers to see what works best for your plants? It might help them grow even healthier and stronger.",
            "Your plants are looking great overall, but I've noticed that some of them are getting a little leggy. Have you considered pruning them to encourage new growth and keep them looking their best? It's a simple but effective way to improve their health and appearance.",
            "I really appreciate the care and attention you give to your plants, but have you thought about rotating them to ensure they all get an equal amount of sunlight? It can make a big difference in their growth and overall health. Keep up the great work, and don't be afraid to experiment and try new things!"
        ]
        
        if plantStates.contains(where: { state in
            state == .thirsty
        }) {
            message = thirstyMsgs.randomElement() ?? "NO MESSAGE"
            return message
        } else if plantStates.contains(where: { state in
            state == .needsAttention
        }) {
            message = forgottenMsgs.randomElement() ?? "NO MESSAGE"
            return message
        }
        
        if mean == 6 {
            message = perfectScoreMsgs.randomElement() ?? "NO MESSAGE"
            return message
        } else if mean >= 3.5 {
            message = regularMsgs.randomElement() ?? "NO MESSAGE"
            return message
        } else {
            message = forgottenMsgs.randomElement() ?? "NO MESSAGE"
            return message
        }
    }
    
}

struct PlantStatsCellData {
    let title: String
    let plants: [PlantDomain]
}


