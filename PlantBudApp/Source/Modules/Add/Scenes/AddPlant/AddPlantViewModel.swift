//
//  AddPlantViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//
#warning("Do wywalenia")
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
    
    //MARK: - Initialization
    
    
    
    //MARK: - Access methods
    
    
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        fetchPlantTypes()
        
//        fetchPlantsWithTypes()
    }
    
    public func buildSections(plantTypeDomains: [PlantTypeDomain]?) {
        
        guard let plantTypeDomains = plantTypeDomains else { return }
        
        let typeInfoCellConfigurators = plantTypeDomains.map {
            PlantTypeCellConfigurator(data: makeTypeInfoCellData(plantTypeDomain: $0))
        }
        sectionSequence = SectionSequence(
            sections: [
                SingleColumnSection(cellConfigurators: typeInfoCellConfigurators)
                //                makeAddButton(),
                //                makePlantsSection(plantDomains: plantDomains!)
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
//        var data2: DataType2?
//        var data3: DataType3?
        
        // Fetch data1
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
        
//        // Fetch data2
//        dispatchGroup.enter()
//        Network.fetchData(query: Query2()) { result in
//            switch result {
//            case .success(let data):
//                data2 = data
//            case .failure(let error):
//                Logger.error("ERROR: \(error)")
//            }
//            dispatchGroup.leave()
//        }
//
//        // Fetch data3
//        dispatchGroup.enter()
//        Network.fetchData(query: Query3()) { result in
//            switch result {
//            case .success(let data):
//                data3 = data
//            case .failure(let error):
//                Logger.error("ERROR: \(error)")
//            }
//            dispatchGroup.leave()
//        }
//
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            // Use data1, data2, and data3 here
            Logger.info("\(plantTypeDomains)")
            self.plantTypeDomains = plantTypeDomains
            UIAppDelegate?.hideLoadingIndicator()
        }

    }
    
//    private func makeAddButton() -> SingleColumnSection {
//        let didPressButton: () -> Void = { [weak self] in
//            guard let self = self else { return }
//            Logger.info("TAP ADD")
//            self.onAddPlantPressed?()
//        }
//        let configurator = AddButtonCellConfigurator(data: AddButtonCellData(SFSymbolName: "plus", buttonName: "Add plant", didPressButton: didPressButton))
//
//        return SingleColumnSection(cellConfigurators: [configurator])
//    }
//
//    private func makeAddCareRoutineButton() -> SingleColumnSection {
//        let didPressButton: () -> Void = { [weak self] in
//            guard let self = self else { return }
//            Logger.info("TAP ADD ROUTINE")
//            self.onAddCareRoutinePressed?()
//        }
//        let configurator = AddButtonCellConfigurator(data: AddButtonCellData(SFSymbolName: "checkmark.seal", buttonName: "Add care routine", didPressButton: didPressButton))
//
//        return SingleColumnSection(cellConfigurators: [configurator])
//    }
    
    private func makeTypeInfoCellData(plantTypeDomain: PlantTypeDomain) -> PlantTypeCellData {
        let didTapPlantType: () -> Void = { [weak self] in
//            guard let self = self else { return }
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
    
    // MARK: - Selectors
    
}


