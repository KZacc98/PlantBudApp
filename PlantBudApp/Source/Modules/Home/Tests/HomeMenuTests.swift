//
//  HomeMenuTests.swift
//  PlantBudAppTests
//
//  Created by Kamil Zachara on 14/01/2023.
//

import XCTest

class HomeMenuTests: XCTestCase {
    // MARK: Mocked Data
    let user = UserDomain(
        id: 1,
        name: "",
        userName: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
        profilePicture: "",
        email: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&'*+-/=?^_@",
        gender: .preferNotToTell,
        phoneNumber: "+12345678900987654321",
        points: 1,
        active: true,
        userType: .user,
        createdAt: Date().description,
        updatedAt: Date().description
    )
    let plants = [
        PlantDomain(
            id: 1,
            plantName: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
            plantState: .default,
            plantPlacement: .default,
            plantImage: "",
            plantTypeId: 1,
            createdAt: Date().description,
            updatedAt: Date().description
        ),
        PlantDomain(
            id: 2,
            plantName: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
            plantState: .dead,
            plantPlacement: .inside,
            plantImage: "",
            plantTypeId: 2,
            createdAt: Date().description,
            updatedAt: Date().description
        )
    ]
    
    func makeMessageOfTheDaySection() -> SingleColumnSection {
        
        let headerData = MainSectionHeaderData(
            title: "MessageOfTheDay", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        
        let configurator = MessageOfTheDayCellConfigurator(data: "")
        
        return SingleColumnSection(cellConfigurators: [configurator], headerConfigurator: headerConfigurator)
        
    }
    
    func makePlantsStatsSection(plants: [PlantDomain]) -> SingleColumnSection {
        if plants.count != 0 {
            let headerData = MainSectionHeaderData(
                title: "Your Plants stats", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
            let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
            
            let configurator = PlantStatsCellConfigurator(data: PlantStatsCellData(title: "", plants: plants))
            
            return SingleColumnSection(cellConfigurators: [configurator], headerConfigurator: headerConfigurator)
        } else {
            let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "title"))

            return SingleColumnSection(cellConfigurators: [configurator])
        }
    }
    
    func makeUserProfileSection(user: UserDomain, plants: [PlantDomain]) -> SingleColumnSection {
        let configurator = UserProfileCellConfigurator(
            data: UserProfileCellData(
                name: "Hello \(user.name)",
                plantCount: plants.count.description,
                profilePictureUrl: user.profilePicture
            ))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    func testMakeUserProfileSection() {
        let expectedConfigurator = UserProfileCellConfigurator(
            data: UserProfileCellData(
                name: "Hello \(user.name)",
                plantCount: plants.count.description,
                profilePictureUrl: user.profilePicture
            ))
        
        let expectedSection = SingleColumnSection(cellConfigurators: [expectedConfigurator])
        
        let result = makeUserProfileSection(user: user, plants: plants)
        XCTAssertEqual(result, expectedSection)
    }
    
    func testMakePlantsStatsSection() {
        let expectedHeaderData = MainSectionHeaderData(
            title: "Your Plants stats", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let expectedHeaderConfigurator = MainSectionHeaderConfigurator(data: expectedHeaderData)
        
        let expectedConfigurator = PlantStatsCellConfigurator(data: PlantStatsCellData(title: "PlantStats", plants: plants))
        
        let expectedSection = SingleColumnSection(cellConfigurators: [expectedConfigurator], headerConfigurator: expectedHeaderConfigurator)
        
        let result = makePlantsStatsSection(plants: plants)
        XCTAssertEqual(result, expectedSection)
    }
    
    
    func testMakeMessageOfTheDaySection() {
        let expectedHeaderData = MainSectionHeaderData(
            title: "MessageOfTheDay", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let expectedHeaderConfigurator = MainSectionHeaderConfigurator(data: expectedHeaderData)
        
        let expectedConfigurator = MessageOfTheDayCellConfigurator(data: "")
        
        let expectedSection = SingleColumnSection(cellConfigurators: [expectedConfigurator], headerConfigurator: expectedHeaderConfigurator)
        
        let result = makeMessageOfTheDaySection()
        XCTAssertEqual(result, expectedSection)
    }
}
