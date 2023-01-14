//
//  ProfileViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 13/01/2023.
//

import UIKit

final class ProfileViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onFetchSuccess: ((String) -> Void)?
    public var onDeletePlantSuccess: (() -> Void)?
    public var onError: ((Error) -> ())?
    
    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    //MARK: - Initialization
    
//    init(plant: Plant) {
//        self.plant = plant
//    }
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
//        UIAppDelegate?.showLoadingIndicator()
        buildSections()
    }
    
    public func buildSections() {
        sectionSequence = SectionSequence(
            sections: [
                makeEmptyDataSection()
            ]
        )
    }

    
    //MARK: - Private methods
    
    private func makeEmptyDataSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: UserContext.shared.userProfile?.name ?? "JEB"))
        
        return SingleColumnSection(cellConfigurators: [configurator])
        
    }
    // MARK: - Selectors
    
}



