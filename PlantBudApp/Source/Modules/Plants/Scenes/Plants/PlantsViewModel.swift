//
//  PlantsViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit
import Apollo

final class PlantsViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onFetchSuccess: (() -> Void)?
    public var onPlantPressed: ((PlantDomain) -> Void)?
    public var onError: ((Error) -> ())?
    
    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var plantDomains: [PlantDomain]? {
        didSet{
            buildSections(plantDomains: plantDomains)
        }
    }
    
//    private var careRoutineDomains: [CareRoutineDomain]?
//    private var careRoutines: [CareRoutine] = []
//    private var routineSteps: [RoutineStepDomain]?
    
    private var plantTypes: [PlantTypeDomain]?
    let placeholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
    
    //MARK: - Initialization
    
    
    
    //MARK: - Access methods
    
    //    func fetchPlantsWithTypes() {
    //        let dispatchGroup = DispatchGroup()
    //        var plantTypes: [PlantTypeDomain]?
    //        var plantDomains: [PlantDomain]?
    //        var careRoutineDomains: [CareRoutineDomain]?
    //
    //        dispatchGroup.enter()
    //        Network.fetchData(query: FetchPlantTypesQuery()) { result in
    //            switch result {
    //            case .success(let data):
    //                plantTypes = data.plantType.map({ res in
    //                    PlantTypeDomain(remote: PlantTypeRemote(
    //                        id: res.id,
    //                        species: res.species,
    //                        description: res.description,
    //                        type: res.type,
    //                        createdAt: res.createdAt
    //                    ))
    //                })
    //            case .failure(let error):
    //                Logger.error("ERROR: \(error)")
    //            }
    //            dispatchGroup.leave()
    //        }
    //
    //        dispatchGroup.enter()
    //        #warning("Userid z contextu po zalogowaniu")
    //        Network.fetchData(query: FetchUserPlantsQuery(userId: 2)) { result in
    //            switch result {
    //            case .success(let data):
    //                plantDomains = data.plant.map({ res in
    //                    PlantDomain(remote: PlantRemote(
    //                        id: res.id,
    //                        plantName: res.plantName,
    //                        plantState: res.plantState,
    //                        plantPlacement: res.plantPlacement,
    //                        plantImage: res.plantImage,
    //                        plantTypeId: res.plantTypeId,
    //                        createdAt: res.createdAt,
    //                        updatedAt: res.updatedAt
    //                    ))
    //                })
    //            case .failure(let error):
    //                Logger.error("ERROR: \(error)")
    //            }
    //            dispatchGroup.leave()
    //        }
    //
    //        dispatchGroup.enter()
    //        Network.fetchData(query: FetchPlantCareRoutineQuery(plantId: 1)) { result in
    //            switch result {
    //            case .success(let data):
    //                careRoutineDomains = data.careRoutine.map({ res in
    //                    CareRoutineDomain(remote: CareRoutineRemote(
    //                        id: res.id,
    //                        plantId: res.plantId,
    //                        isActive: res.isActive,
    //                        isCompleted: res.isCompleted,
    //                        isShared: res.isShared,
    //                        flag: res.flag,
    //                        createdAt: res.createdAt,
    //                        updatedAt: res.updatedAt
    //                    ))
    //                })
    //            case .failure(let error):
    //                Logger.error("ERROR: \(error)")
    //            }
    //            dispatchGroup.leave()
    //        }
    //
    //        dispatchGroup.notify(queue: .main) {
    //            self.plantTypes = plantTypes
    //            self.plantDomains = plantDomains
    //            self.careRoutineDomains = careRoutineDomains
    //            UIAppDelegate?.hideLoadingIndicator()
    //        }
    //    }
    
    func fetchPlantsWithTypes() {
        let dispatchGroup = DispatchGroup()
        var plantTypes: [PlantTypeDomain] = []
        var plantDomains: [PlantDomain] = []
        
        dispatchGroup.enter()
        Network.fetchData(query: FetchPlantTypesQuery()) { result in
            switch result {
            case .success(let data):
                plantTypes = data.plantType.map({ res in
                    PlantTypeDomain(remote: PlantTypeRemote(
                        id: res.id,
                        species: res.species,
                        description: res.description,
                        type: res.type,
                        createdAt: res.createdAt
                    ))
                })
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        Network.fetchData(query: FetchUserPlantsQuery(userId: 2)) { result in
            switch result {
            case .success(let data):
                plantDomains = data.plant.map({ res in
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
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
    
        
        dispatchGroup.notify(queue: .main) {
            self.plantTypes = plantTypes
            self.plantDomains = plantDomains
            UIAppDelegate?.hideLoadingIndicator()
        }
    }
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        
        fetchPlantsWithTypes()
    }
    
    public func buildSections(plantDomains: [PlantDomain]?) {
        guard let plantDomains = plantDomains else { return }
        let cellConfigurators = plantDomains.map {
            PlantCellConfigurator(data: makePlantCellData(plant: $0))
        }
        
        sectionSequence = SectionSequence(
            sections: [
                SingleColumnSection(cellConfigurators: cellConfigurators)
                //                makeHelloHeaderSection(),
                //                makePlantsSection(plantDomains: plantDomains!)
            ])
    }
    
    public func buildEmptySections() {
        sectionSequence = SectionSequence(
            sections: [
                makeHelloHeaderSection(),
            ])
    }
    
    //MARK: - Private methods
    
    private func makeHelloHeaderSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "PLANTS"))
        
        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makePlantCellData(plant: PlantDomain) -> PlantCellData {
        let didTapPlant: () -> Void = { [weak self] in
            guard let self = self else { return }
            self.onPlantPressed?(plant)
        }
        
        let data = PlantCellData(
            imageUrl: URL(string: plant.plantImage) ?? URL(string: placeholder)!,
            plantName: plant.plantName,
            plantState: PlantState(rawValue: plant.plantState.rawValue) ?? .default,
            didTapPlant: didTapPlant)
        
        return data
    }
    
    // MARK: - Selectors
    
}
