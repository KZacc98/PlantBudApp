//
//  HomeMenuViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

final class HomeMenuViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onFetchSuccess: ((String) -> Void)?
    public var onError: ((Error) -> ())?
    
    //MARK: Private properties
    
    private let defaults = UserDefaults.standard
    private var userPoints: Int?
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var plants: [PlantDomain]? {
        didSet{
            buildSections()
        }
    }
    
    private var user: UserDomain? {
        didSet {
            UserContext.shared.userProfile = user
        }
    }
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        
        let dispatchGroup = DispatchGroup()
        var plants: [PlantDomain]?
        var user: UserDomain?
        var userBadgesIdis: [Int]?
        
        dispatchGroup.enter()
        Network.shared.apollo.fetch(query: FetchUserProfileQuery(
            userId: defaults.integer(forKey: "userId"))) { [weak self] result in
                switch result {
                case .success(let GQLResult):
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
                    self?.onError?(error)
                }
                dispatchGroup.leave()
            }
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            self?.user = user
            self?.plants = plants
            Network.fetchData(query: FetchUserPointsQuery(_in: userBadgesIdis)) { result in
                switch result {
                case .success(let data):
                    let points = data.badge.reduce(0) { (result, badge) in
                        return result + badge.points
                    }
                    UserContext.shared.points = points
                case .failure(let error):
                    self?.onError?(error)
                }
            }
        }
    }
    
    public func buildSections() {
        sectionSequence = SectionSequence(
            sections: [
                makeUserProfileSection(
                    name: user?.name ?? "TEST",
                    plantCount: plants?.count.description ?? "no plants",
                    profilePicture: user?.profilePicture),
                makePlantsStatsSection(plants: self.plants),
                makeMessageOfTheDaySection()
            ])
    }
    
    //MARK: - Private methods
    
    private func makeHelloHeaderSection(title: String) -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(
            data: TestViewCellData(title: title))
        
        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeUserProfileSection(
        name: String,
        plantCount: String,
        profilePicture: String?) -> SingleColumnSection {
            let configurator = UserProfileCellConfigurator(
                data: UserProfileCellData(
                    name: String(format: "userProfileCellName".localized, name),
                    plantCount: plantCount,
                    profilePictureUrl: profilePicture
                ))
            
            return SingleColumnSection(cellConfigurators: [configurator])
        }
    
    private func makePlantsStatsSection(plants: [PlantDomain]?) -> SingleColumnSection {
        let headerData = MainSectionHeaderData(
            title: "plantStatsHeaderLabel".localized,
            insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        
        if let plants = plants, plants.isEmpty == false {
            let configurator = PlantStatsCellConfigurator(data: PlantStatsCellData(plants: plants))
            
            return SingleColumnSection(cellConfigurators: [configurator], headerConfigurator: headerConfigurator)
        } else {
            let configurator = NoDataCellConfigurator(message: "plantStatsNoPlants".localized)
            
            return SingleColumnSection(
                cellConfigurators: [configurator],
                headerConfigurator: headerConfigurator)
        }
    }
    
    private func makeMessageOfTheDaySection() -> SingleColumnSection {
        let headerData = MainSectionHeaderData(
            title: "messageOfTheDayHeaderLabel".localized,
            insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        
        let configurator = MessageOfTheDayCellConfigurator(data: "")
        
        return SingleColumnSection(
            cellConfigurators: [configurator],
            headerConfigurator: headerConfigurator)
    }
}
