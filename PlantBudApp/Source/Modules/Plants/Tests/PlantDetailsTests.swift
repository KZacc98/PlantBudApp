//
//  PlantDetailsTests.swift
//  PlantBudAppTests
//
//  Created by Kamil Zachara on 15/01/2023.
//

import XCTest

class PlantDetailsTests: XCTestCase {
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
    
    private func makePlantDetailsCellData(plant: Plant) -> PlantDetailsCellData {
        let didTapPlant: () -> Void = {
            Logger.info("TAP")
        }
        
        let data = PlantDetailsCellData(
            imageUrl: URL(string: plant.plantData.plantImage) ?? URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png")!,
            plantName: plant.plantData.plantName,
            plantState: PlantState(rawValue: plant.plantData.plantState.rawValue) ?? .default,
            plantType: plant.plantTypeData,
            didTapPlant: didTapPlant)
        
        return data
    }
    
    private func makePlantDetailsTypeInfoCellData(plant: Plant) -> PlantDetailsTypeInfoCellData {
        let didTapPlant: () -> Void = {
            Logger.info("TAP")
        }
        
        let data = PlantDetailsTypeInfoCellData(
            imageUrl: (URL(string: plant.plantTypeData.plantTypeImage) ?? URL(string: placeholder))! ,
            plantType: plant.plantTypeData,
            didTapPlant: didTapPlant
        )
        
        return data
    }
    
    
    func testMakePlantDetailsTypeInfoCellData() {
        let expectedDidTapPlantClosure: () -> Void = {
            Logger.info("TAP")
        }
        
        let expectedResult = PlantDetailsTypeInfoCellData(
            imageUrl: (URL(string: plant.plantTypeData.plantTypeImage) ?? URL(string: placeholder))! ,
            plantType: plant.plantTypeData,
            didTapPlant: expectedDidTapPlantClosure
        )
        
        let result = makePlantDetailsTypeInfoCellData(plant: plant)
        XCTAssertEqual(result, expectedResult)
    }
    
    func testMakePlantDetailsCellData() {
        let expectedDidTapPlantClosure: () -> Void = {
            Logger.info("TAP")
        }
        
        let expectedResult = PlantDetailsCellData(
            imageUrl: URL(string: plant.plantData.plantImage) ?? URL(string: placeholder)!,
            plantName: plant.plantData.plantName,
            plantState: PlantState(rawValue: plant.plantData.plantState.rawValue) ?? .default,
            plantType: plant.plantTypeData,
            didTapPlant: expectedDidTapPlantClosure)
        
        let result = makePlantDetailsCellData(plant: plant)
        XCTAssertEqual(result, expectedResult)
    }
}


