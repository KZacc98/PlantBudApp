//
//  PlantBudAppTests.swift
//  PlantBudAppTests
//
//  Created by Kamil Zachara on 06/02/2023.
//

import XCTest

final class PlantBudAppTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    //
    //    func testExample() throws {
    //        // This is an example of a functional test case.
    //        // Use XCTAssert and related functions to verify your tests produce the correct results.
    //        // Any test you write for XCTest can be annotated as throws and async.
    //        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    //        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    //    }
    //
    func testApiResponseTime() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            UIAppDelegate?.showLoadingIndicator()
            
            let dispatchGroup = DispatchGroup()
            var plants: [PlantDomain]?
            var user: UserDomain?
            var userBadgesIdis: [Int]?
            var points: Int = 0
            
            // Fetch data1
            dispatchGroup.enter()
            
            Network.shared.apollo.fetch(query: FetchUserProfileQuery(userId: 1)) { result in
                switch result {
                case .success(let GQLResult):
                    //                self.onFetchSuccess?()
                    Logger.info("\(GQLResult)")
                    
                    plants = GQLResult.data?.plant.map({ res in
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
                    
                    user = GQLResult.data?.user.first.map({ user in
                        UserDomain(remote: UserRemote(
                            id: user.id,
                            name: user.name,
                            userName: user.userName,
                            profilePicture: user.profilePicture,
                            email: user.email,
                            gender: user.gender,
                            phoneNumber: user.phoneNumber,
                            points: user.points,
                            active: user.active,
                            userType: user.userType,
                            createdAt: user.createdAt,
                            updatedAt: user.updatedAt)
                        )
                    })
                    
                    userBadgesIdis = GQLResult.data?.userBadges.compactMap{ res in
                        res.badgeId
                    }
                    
                    UIAppDelegate?.hideLoadingIndicator()
                case .failure(let error):
                    UIAppDelegate?.hideLoadingIndicator()
                    Logger.error("ERROR: \(error)")
                }
                dispatchGroup.leave()
            }
            
            
            // Run a block of code when all requests are completed
            dispatchGroup.notify(queue: .main) {
                // Use data1, data2, and data3 here
//                self.user = user
//                self.plants = plants
                Network.fetchData(query: FetchUserPointsQuery(_in: userBadgesIdis)) { result in
                    switch result {
                    case .success(let data):
                        let points = data.badge.reduce(0) { (result, badge) in
                            return result + badge.points
                        }
                        UserContext.shared.points = points
                    case .failure(let error):
                        Logger.error("ERROR: \(error)")
                    }
                }
                Logger.error("\(userBadgesIdis)")
                
                Logger.error("\(points)")
            }
            
        }
        
    }
}
