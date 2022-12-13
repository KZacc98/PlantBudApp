//
//  PlantsWorker.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 10/12/2022.
//

import Foundation

final class PlantsWorker {
    
    public func getUserPlants(userId: Int) -> [PlantDomain]? {
        var output: [PlantDomain]?
        Network.shared.apollo.fetch(query: FetchUserPlantsQuery(userId: userId)) { result in
            switch result {
            case .success(let GQLResult):
                output = GQLResult.data?.plant.map({ res in
                    PlantDomain(remote: PlantRemote(
                        id: res.id,
                        plantName: res.plantName,
                        plantState: res.plantState,
                        plantPlacement: res.plantPlacement,
                        plantImage: res.plantImage,
                        plantTypeId: res.plantTypeId,
                        createdAt: res.createdAt,
                        updatedAt: res.updatedAt
                    ))
                })
                UIAppDelegate?.hideLoadingIndicator()
            case .failure(let error):
                UIAppDelegate?.hideLoadingIndicator()
                Logger.error("ERROR: \(error)")
            }
        }
        
        return output
    }
}
