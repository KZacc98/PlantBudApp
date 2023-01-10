//
//  AddViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 08/01/2023.
//

import UIKit
import Apollo

final class AddViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onFetchSuccess: (() -> Void)?
    public var onAddPlantPressed: (() -> Void)?
    public var onAddCareRoutinePressed: (() -> Void)?
    public var onError: ((Error) -> ())?
    
    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    let placeholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
    
    //MARK: - Initialization
    
    
    
    //MARK: - Access methods
    
    
    
    public func loadData(refresh: Bool = false) {
//        UIAppDelegate?.showLoadingIndicator()
        
//        fetchPlantsWithTypes()
    }
    
//    public func buildSections(plants: [Plant]) {
//
//
//        sectionSequence = SectionSequence(
//            sections: [
//                SingleColumnSection(cellConfigurators: cellConfigurators)
//                //                makeAddButton(),
//                //                makePlantsSection(plantDomains: plantDomains!)
//            ])
//    }
    
    public func buildEmptySections() {
        sectionSequence = SectionSequence(
            sections: [
                makeAddButton(),
                makeAddCareRoutineButton()
            ])
    }
    
    //MARK: - Private methods
    
    private func makeAddButton() -> SingleColumnSection {
        let didPressButton: () -> Void = { [weak self] in
            guard let self = self else { return }
            Logger.info("TAP ADD")
            self.onAddPlantPressed?()
        }
        let configurator = AddButtonCellConfigurator(data: AddButtonCellData(SFSymbolName: "plus", buttonName: "Add plant", didPressButton: didPressButton))
        
        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeAddCareRoutineButton() -> SingleColumnSection {
        let didPressButton: () -> Void = { [weak self] in
            guard let self = self else { return }
            Logger.info("TAP ADD ROUTINE")
            self.onAddCareRoutinePressed?()
        }
        let configurator = AddButtonCellConfigurator(data: AddButtonCellData(SFSymbolName: "checkmark.seal", buttonName: "Add care routine", didPressButton: didPressButton))
        
        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
//    private func makePlantCellData(plant: Plant) -> PlantCellData {
//        let didTapPlant: () -> Void = { [weak self] in
//            guard let self = self else { return }
//            self.onPlantPressed?(plant)
//        }
//        
//        let data = PlantCellData(
//            imageUrl: URL(string: plant.plantData.plantImage) ?? URL(string: placeholder)!,
//            plantName: plant.plantData.plantName,
//            plantState: PlantState(rawValue: plant.plantData.plantState.rawValue) ?? .default,
//            plantType: plant.plantTypeData,
//            didTapPlant: didTapPlant)
//        
//        return data
//    }
    
    // MARK: - Selectors
    
}

