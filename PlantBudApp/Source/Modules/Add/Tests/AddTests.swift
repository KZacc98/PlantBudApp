//
//  AddTests.swift
//  PlantBudAppTests
//
//  Created by Kamil Zachara on 15/01/2023.
//

import XCTest

class AddTests: XCTestCase {
    // MARK: Methods to test
    
    private func makeAddButton() -> SingleColumnSection {
        let didPressButton: () -> Void = {
            Logger.info("TAP ADD")
        }
        let configurator = AddButtonCellConfigurator(data: AddButtonCellData(SFSymbolName: "plus", buttonName: "Add plant", didPressButton: didPressButton))
        
        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeAddCareRoutineButton() -> SingleColumnSection {
        let didPressButton: () -> Void = {
            Logger.info("TAP ADD ROUTINE")
        }
        let configurator = AddButtonCellConfigurator(data: AddButtonCellData(SFSymbolName: "checkmark.seal", buttonName: "Add care routine", didPressButton: didPressButton))
        
        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    // MARK: Tests
    
    func testMakeAddButton() {
        let expectedDidPressButton: () -> Void = {
            Logger.info("TAP ADD")
        }
        let expectedConfigurator = AddButtonCellConfigurator(data: AddButtonCellData(SFSymbolName: "plus", buttonName: "Add plant", didPressButton: expectedDidPressButton))
        
        let expectedSection = SingleColumnSection(cellConfigurators: [expectedConfigurator])
        
        let result = makeAddButton()
        XCTAssertEqual(result, expectedSection)
    }
    
    func testAddCareRoutineButton() {
        let expectedDidPressButton: () -> Void = {
            Logger.info("TAP ADD ROUTINE")
        }
        let expectedConfigurator = AddButtonCellConfigurator(data: AddButtonCellData(SFSymbolName: "checkmark.seal", buttonName: "Add care routine", didPressButton: expectedDidPressButton))
        
        let expectedSection = SingleColumnSection(cellConfigurators: [expectedConfigurator])
        
        let result = makeAddButton()
        XCTAssertEqual(result, expectedSection)
    }
}




