//
//  CommunityViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 05/12/2022.
//

import UIKit

final class CommunityListViewModel {

    //MARK: - Binding closures

    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onCommunityTilePressed: ((CommunityDomain) -> Void)?
    public var onError: ((Error) -> ())?

    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var communityDomains: [CommunityDomain]?{
        didSet{
            buildSections()
        }
    }
    
    
    //MARK: - Initialization
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        fetchData()
        
    }

    public func buildSections() {
        sectionSequence = SectionSequence(
            sections: [
                makeAllCommunitiesSection(communities: self.communityDomains)
        ])
    }
    
    //MARK: - Private methods
    private func fetchData() {
        UIAppDelegate?.showLoadingIndicator()
        let dispatchGroup = DispatchGroup()
        var communityDomains: [CommunityDomain]?
//        var data2: DataType2?
//        var data3: DataType3?
        
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchCommunitiesQuery()) { result in
            switch result {
            case .success(let data):
                communityDomains = data.community.map { community in
                    CommunityDomain(remote: CommunityRemote(
                        id: community.id,
                        communityName: community.communityName,
                        communityDescription: community.communityDescription,
                        communitySmallImage: community.communitySmallImage,
                        communityBigImage: community.communityBigImage,
                        isActive: community.isActive,
                        createdAt: community.createdAt,
                        updatedAt: community.updatedAt
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
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            // Use data1, data2, and data3 here
            self.communityDomains = communityDomains
            UIAppDelegate?.hideLoadingIndicator()
        }
    }

    private func makeAllCommunitiesSection(communities: [CommunityDomain]?) -> SingleColumnSection {
        guard let communities = communities else { return SingleColumnSection(cellConfigurators: []) }
        let configurators = communities.map { community in
            CommunityCellConfigurator(data: CommunityCellData(
                communityDomain: community,
                didPressCommunityTile: {
                    Logger.info("\(community.communityName) TILE TAPPED")
                    self.onCommunityTilePressed?(community)
                }))
        }

        return SingleColumnSection(cellConfigurators: configurators)
    }

    // MARK: - Selectors

}


