//
//  HomeMenuViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

final class HomeMenuViewModel {

    //MARK: - Binding closures

    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onFetchSuccess: ((String) -> Void)?
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

    //MARK: - Initialization
    

    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        
        Network.shared.apollo.fetch(query: FetchUserPlantsQuery(userId: 2)) { result in
            switch result {
            case .success(let GQLResult):
                //                self.onFetchSuccess?()
                
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
                
                UIAppDelegate?.hideLoadingIndicator()
            case .failure(let error):
                UIAppDelegate?.hideLoadingIndicator()
                Logger.error("ERROR: \(error)")
            }
        }
    }

    public func buildSections() {
        sectionSequence = SectionSequence(
            sections: [
                makeHelloHeaderSection(),
                makePlantCountSection()
        ])
    }

    //MARK: - Private methods

    private func makeHelloHeaderSection() -> SingleColumnSection {

        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "Hello there"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makePlantCountSection() -> SingleColumnSection {
        if let plantCount = plants?.count {
            let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "Plant Count: \(plantCount)"))
            
            return SingleColumnSection(cellConfigurators: [configurator])
        } else {
            let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "JEBŁO"))
            
            return SingleColumnSection(cellConfigurators: [configurator])
        }
    }

    // MARK: - Selectors

}

