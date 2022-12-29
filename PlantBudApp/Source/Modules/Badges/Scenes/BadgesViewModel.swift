//
//  BadgesViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class BadgesViewModel {

    //MARK: - Binding closures

    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onError: ((Error) -> ())?

    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    //MARK: - Initialization
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        
        
        let dispatchGroup = DispatchGroup()
        var data1: [BadgeDomain]?
        var data2: [UserBadgeDomain]?
//        var data3: DataType3?
        
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchBadgesQuery()) { result in
            switch result {
            case .success(let data):
                data1 = data.badge.map({ res in
                    BadgeDomain(remote: BadgeRemote(
                        id: res.id,
                        badgeName: res.badgeName,
                        points: res.points,
                        badgeDescription: res.badgeDescription,
                        badgeImage: res.badgeImage ?? "",
                        createdAt: res.createdAt ?? "",
                        updatedAt: res.updatedAt ?? ""
                    ))
                })
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
        
        // Fetch data2
        dispatchGroup.enter()
        Network.fetchData(query: FetchUserBadgesQuery(userId: UserContext.shared.userId)) { result in
            switch result {
            case .success(let data):
                data2 = data.userBadges.map({ res in
                    UserBadgeDomain(remote: UserBadgeRemote(
                        userId: res.userId,
                        badgeId: res.badgeId,
                        createdAt: res.createdAt,
                        updatedAt: res.updatedAt
                    ))
                })
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
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
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            // Use data1, data2, and data3 here
            Logger.info("\(data1)")
            Logger.info("\(data2)")
        }

    }

    public func buildSections() {
        sectionSequence = SectionSequence(
            sections: [
                makeHelloHeaderSection()
        ])
    }
    
    //MARK: - Private methods

    private func makeHelloHeaderSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "Badges"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }

    // MARK: - Selectors

}

