//
//  PlantsViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit
import Apollo

final class PlantListViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onFetchSuccess: (() -> Void)?
    public var onPlantPressed: ((Plant) -> Void)?
    public var onError: ((Error) -> ())?
    
    //MARK: Private properties
    
    private var plantDomains: [PlantDomain]?
    private var plantTypes: [PlantTypeDomain]?
    private let defaults = UserDefaults.standard
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var plants: [Plant]? {
        didSet{
            guard let plants = plants else { return }
            buildSections(plants: plants)
        }
    }
    
    let placeholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
    
    //MARK: - Initialization
    
    
    
    //MARK: - Access methods
    
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
                        plantTypeImage: res.plantTypeImage,
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
        Network.fetchData(query: FetchUserPlantsQuery(userId: defaults.integer(forKey: "userId"))) { result in
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
            
            guard let plantTypeDomains = self.plantTypes else { return }
            let plantTypeDomainDict = Dictionary(uniqueKeysWithValues: plantTypeDomains.map { ($0.id, $0) })
            let plants = plantDomains.map { plantDomain in
                // Look up the corresponding PlantTypeDomain object using the plantTypeId property of the PlantDomain object
                let plantTypeDomain = plantTypeDomainDict[plantDomain.plantTypeId]
                return Plant(plantData: plantDomain, plantTypeData: plantTypeDomain!)
            }
            self.plants = plants
            
            
            
            UIAppDelegate?.hideLoadingIndicator()
        }
    }
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        
        fetchPlantsWithTypes()
    }
    
    public func buildSections(plants: [Plant]) {
        let cellConfigurators = plants.map { plant in
            PlantCellConfigurator(data: makePlantCellData(plant: plant))
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
    
    private func makePlantCellData(plant: Plant) -> PlantCellData {
        let didTapPlant: () -> Void = { [weak self] in
            guard let self = self else { return }
            self.onPlantPressed?(plant)
        }
        
        let data = PlantCellData(
            imageUrl: URL(string: plant.plantData.plantImage) ?? URL(string: placeholder)!,
            plantName: plant.plantData.plantName,
            plantState: PlantState(rawValue: plant.plantData.plantState.rawValue) ?? .default,
            plantType: plant.plantTypeData,
            didTapPlant: didTapPlant)
        
        return data
    }
    
    // MARK: - Selectors
    
}
