//
//  PlantsViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class PlantsViewModel {

    //MARK: - Binding closures

    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onFetchSuccess: (() -> Void)?
    public var onError: ((Error) -> ())?

    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var plants: [PlantDomain]? {
        didSet{
            buildSections()
        }
    }
    private var plantTypes: [PlantTypeDomain]?
    let placeholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
    
    //MARK: - Initialization
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        Network.shared.apollo.fetch(query: FetchPlantTypesQuery()) { result in
            switch result {
            case .success(let GQLResult):
                //                self.onFetchSuccess?()
                if GQLResult.data?.plantType.isEmpty == false {
                    self.plantTypes = GQLResult.data?.plantType.map({ res in
                        PlantTypeDomain(remote: PlantTypeRemote(
                            id: res.id,
                            species: res.species,
                            description: res.description,
                            type: res.type,
                            createdAt: res.createdAt
                        ))
                    })
                } else {
                    Logger.error("Nie feczło typów")
                }
            case .failure(let error):
                UIAppDelegate?.hideLoadingIndicator()
                Logger.error("ERROR: \(error)")
            }
            
            Network.shared.apollo.fetch(query: FetchUserPlantsQuery(userId: 2)) { result in
                switch result {
                case .success(let GQLResult):
                    //                self.onFetchSuccess?()
                    if GQLResult.data?.plant.isEmpty == false {
                        self.plants = GQLResult.data?.plant.map({ res in
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
                    } else {
                        self.buildEmptySections()
                    }
                    UIAppDelegate?.hideLoadingIndicator()
                case .failure(let error):
                    UIAppDelegate?.hideLoadingIndicator()
                    Logger.error("ERROR: \(error)")
                }
                
            }
            
            Network.shared.apollo.fetch(query: FetchPlantCareRoutineQuery(plantId: 1)) { result in
                switch result {
                case .success(let GQLResult):
                    //                self.onFetchSuccess?()
                    Logger.info("\(GQLResult.data?.careRoutine.first?.id)")
                    Network.shared.apollo.fetch(query: FetchPlantCareRoutineStepsQuery(careRoutineId: GQLResult.data?.careRoutine.first?.id)) { result in
                        switch result {
                        case .success(let GQLResult):
                            //                self.onFetchSuccess?()
                            Logger.info("\(GQLResult.data?.routineStep)")


                            UIAppDelegate?.hideLoadingIndicator()
                        case .failure(let error):
                            UIAppDelegate?.hideLoadingIndicator()
                            Logger.error("ERROR: \(error)")
                        }

                    }
                    UIAppDelegate?.hideLoadingIndicator()
                case .failure(let error):
                    UIAppDelegate?.hideLoadingIndicator()
                    Logger.error("ERROR: \(error)")
                }
                
            }
            
            
        }
    }

    public func buildSections() {
        sectionSequence = SectionSequence(
            sections: [
//                makeHelloHeaderSection(),
                makePlantsSection(plants: plants!)
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
    
    private func makePlantsSection(plants: [PlantDomain]) -> SingleColumnSection {
        
        
        let configurators = plants.map { plant in
            
            let data = PlantCellData(
                imageUrl: URL(string: plant.plantImage) ?? URL(string: placeholder)!,
                plantName: plant.plantName,
                plantState: PlantState(rawValue: plant.plantState.rawValue) ?? .default,
                plantTypeInfo: plantTypes?.filter({ planttype in
                    planttype.id == plant.id
                }).first?.description ?? "JEBŁO W CHUJ"
            )
            
            return PlantCellConfigurator(data: data)
            
        }
        

//        let configurator = PlantCellConfigurator(
//            data: PlantCellData(
//                imageUrl: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Monstera_Adansonii.jpg/800px-Monstera_Adansonii.jpg")!,
//                plantName: "PLANTNAME",
//                plantState: "FINE")
//        )
        
        return SingleColumnSection(cellConfigurators: configurators)
    }

    // MARK: - Selectors

}
