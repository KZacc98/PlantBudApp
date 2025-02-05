//
//  AddPlantViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import UIKit

final class AddPlantViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onFetchSuccess: (() -> Void)?
    public var onPlantTypePressed: ((PlantTypeDomain) -> Void)?
    public var onError: ((Error) -> ())?
    
    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    var plantTypeDomains: [PlantTypeDomain]? {
        didSet{
            buildSections(plantTypeDomains: self.plantTypeDomains)
        }
    }
    
    let placeholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        fetchPlantTypes()
    }
    
    public func buildSections(plantTypeDomains: [PlantTypeDomain]?) {
        
        guard let plantTypeDomains = plantTypeDomains else { return }
        
        let typeInfoCellConfigurators = plantTypeDomains.map {
            PlantTypeCellConfigurator(data: makeTypeInfoCellData(plantTypeDomain: $0))
        }
        sectionSequence = SectionSequence(
            sections: [
                SingleColumnSection(cellConfigurators: typeInfoCellConfigurators)
            ])
    }
    
    public func buildEmptySections() {
        sectionSequence = SectionSequence(
            sections: [
                makeHelloHeaderSection()
            ])
    }
    
    //MARK: - Private methods
    
    private func fetchPlantTypes(){
        let dispatchGroup = DispatchGroup()
        var plantTypeDomains: [PlantTypeDomain]?

        dispatchGroup.enter()
        Network.fetchData(query: FetchPlantTypesQuery()) { result in
            switch result {
            case .success(let data):
                plantTypeDomains = data.plantType.map{ res in
                    PlantTypeDomain(remote: PlantTypeRemote(
                        id: res.id,
                        species: res.species,
                        description: res.description,
                        plantTypeImage: res.plantTypeImage,
                        type: res.type,
                        createdAt: res.createdAt
                    ))
                }
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            Logger.info("\(plantTypeDomains)")
            self.plantTypeDomains = plantTypeDomains
            UIAppDelegate?.hideLoadingIndicator()
        }

    }
    
    private func makeTypeInfoCellData(plantTypeDomain: PlantTypeDomain) -> PlantTypeCellData {
        let didTapPlantType: () -> Void = { [weak self] in
            self?.onPlantTypePressed?(plantTypeDomain)
            Logger.info("TAP \(plantTypeDomain.species)")
            
        }
        
        let data = PlantTypeCellData(
            imageUrl: (URL(string: plantTypeDomain.plantTypeImage) ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"))! ,
            plantType: plantTypeDomain,
            didTapPlantType: didTapPlantType
        )
        
        return data
    }
    
    private func makeHelloHeaderSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "ADDPLANT"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
}
