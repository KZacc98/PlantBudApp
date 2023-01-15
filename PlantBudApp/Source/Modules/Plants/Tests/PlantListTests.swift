//
//  PlantListTests.swift
//  PlantBudAppTests
//
//  Created by Kamil Zachara on 15/01/2023.
//

import XCTest

class PlantListTests: XCTestCase {
    // MARK: Mocked Data
    var onPlantPressed: ((Plant) -> Void)?
    
    let plant =
        Plant(plantData: PlantDomain(
            id: 2,
            plantName: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
            plantState: .dead,
            plantPlacement: .inside,
            plantImage: "",
            plantTypeId: 2,
            createdAt: Date().description,
            updatedAt: Date().description
        ), plantTypeData: PlantTypeDomain(
            id: 2,
            species: "TEST",
            description: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
            plantTypeImage: "",
            type: "",
            createdAt: Date().description
        ))
    let placeholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"
    
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
    
    
    func testMakePlantCellData() {
        let expectedDidTapPlantClosure: () -> Void = { [weak self] in
            guard let self = self else { return }
            self.onPlantPressed?(self.plant)
        }
        
        let expectedResult = PlantCellData(
            imageUrl: URL(string: plant.plantData.plantImage) ?? URL(string: placeholder)!,
            plantName: plant.plantData.plantName,
            plantState: PlantState(rawValue: plant.plantData.plantState.rawValue) ?? .default,
            plantType: plant.plantTypeData,
            didTapPlant: expectedDidTapPlantClosure)
        
        let result = makePlantCellData(plant: plant)
        XCTAssertEqual(result, expectedResult)
    }
}

