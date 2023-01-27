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
    
    private var communityDomains: [CommunityDomain]?
    
    private var userCommunityIds: [Int]?{
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
        guard let userCommunityIds = self.userCommunityIds else { return }
        let userCommunities = self.communityDomains?.filter { communityDomain in
            userCommunityIds.contains(where: {$0 == communityDomain.id}) &&
            communityDomain.isActive == true
        }
        let allCommunities = self.communityDomains?.filter { communityDomain in
            communityDomain.isActive == true
        }
        sectionSequence = SectionSequence(
            sections: [
                makeUserCommunitiesSection(communities: userCommunities),
                makeAllCommunitiesSection(communities: allCommunities)
        ])
    }
    
    //MARK: - Private methods
    private func fetchData() {
        UIAppDelegate?.showLoadingIndicator()
        let dispatchGroup = DispatchGroup()
        var communityDomains: [CommunityDomain]?
        var userCommunityIds: [Int]?
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
        
        // Fetch data2
        dispatchGroup.enter()
        guard let userId = UserContext.shared.userProfile?.id else {
            dispatchGroup.leave()
            return
        }
        Network.fetchData(query: FetchUserCommunitiesQuery(userId: userId)) { result in
            switch result {
            case .success(let data):
                userCommunityIds = data.communityUsers.map({ res in
                    res.communityId
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
            self.communityDomains = communityDomains
            self.userCommunityIds = userCommunityIds
            UIAppDelegate?.hideLoadingIndicator()
        }
    }
    
    private func makeUserCommunitiesSection(communities: [CommunityDomain]?) -> SingleColumnSection {
        guard let communities = communities else { return SingleColumnSection(cellConfigurators: []) }
        let headerData = MainSectionHeaderData(
            title: "userCommunitiesHeaderTitle".localized, insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        let configurators = communities.map { community in
            CommunityCellConfigurator(data: CommunityCellData(
                communityDomain: community,
                tileColor: Color.brandGreen,
                textColor: Color.brandWhite,
                didPressCommunityTile: {
                    Logger.info("\(community.communityName) TILE TAPPED")
                    self.onCommunityTilePressed?(community)
                }))
        }

        return SingleColumnSection(cellConfigurators: configurators, headerConfigurator: headerConfigurator)
    }


    private func makeAllCommunitiesSection(communities: [CommunityDomain]?) -> SingleColumnSection {
        guard let communities = communities else { return SingleColumnSection(cellConfigurators: []) }
        let headerData = MainSectionHeaderData(
            title: "allCommunitiesHeaderTitle".localized, insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        let configurators = communities.map { community in
            CommunityCellConfigurator(data: CommunityCellData(
                communityDomain: community,
                tileColor: Color.brandWhite,
                textColor: Color.brandBlack,
                didPressCommunityTile: {
                    Logger.info("\(community.communityName) TILE TAPPED")
                    self.onCommunityTilePressed?(community)
                }))
        }

        return SingleColumnSection(cellConfigurators: configurators, headerConfigurator: headerConfigurator)
    }

    // MARK: - Selectors

}


