//
//  HomeMenuViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 27/11/2022.
//

import UIKit

class HomeMenuViewModel {

    //MARK: - Binding closures

    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onFetchSuccess: ((String) -> Void)?
    public var onError: ((Error) -> ())?

    //MARK: Private properties
    private let defaults = UserDefaults.standard
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
    private var userPoints: Int?

    //MARK: - Initialization
    

    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        
        self.fetchUserProfile(userId: defaults.integer(forKey: "userId"))
        
    }
    
    public func fetchUserProfile(userId: Int) {
        let dispatchGroup = DispatchGroup()
        var plants: [PlantDomain]?
        var user: UserDomain?
        var userBadgesIdis: [Int]?
        var points: Int = 0
        
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchUserProfileQuery(userId: userId)) { result in
            switch result {
            case .success(let data):
                plants = data.plant.map { res in
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
                }
                
                user = data.user.first.map { user in
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
                }
                
                userBadgesIdis = data.userBadges.compactMap{ res in
                    res.badgeId
                }
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            // Use data1, data2, and data3 here
            self.user = user
            self.plants = plants
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
            UIAppDelegate?.hideLoadingIndicator()
            Logger.error("\(userBadgesIdis)")
            
            Logger.error("\(points)")
        }
    }
    
    

    public func buildSections() {
        guard let user = self.user, let plants = self.plants else { return }
        sectionSequence = SectionSequence(
            sections: [
                makeUserProfileSection(user: user, plants: plants),
                makePlantsStatsSection(plants: plants),
                makeMessageOfTheDaySection()
                
        ])
    }

    //MARK: - Private methods

    private func makeHelloHeaderSection(title: String) -> SingleColumnSection {

        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: title))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeUserProfileSection(user: UserDomain, plants: [PlantDomain]) -> SingleColumnSection {

        let configurator = UserProfileCellConfigurator(
            data: UserProfileCellData(
                name: "Hello \(user.name)",
                plantCount: plants.count.description,
                profilePictureUrl: user.profilePicture
            ))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makePlantsStatsSection(plants: [PlantDomain]) -> SingleColumnSection {
        if plants.count != 0 {
            let headerData = MainSectionHeaderData(
                title: "Your Plants stats", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
            let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
            
            let configurator = PlantStatsCellConfigurator(data: PlantStatsCellData(title: "DUPA", plants: plants))
            
            return SingleColumnSection(cellConfigurators: [configurator], headerConfigurator: headerConfigurator)
        } else {
            let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "title"))

            return SingleColumnSection(cellConfigurators: [configurator])
        }
    }
    
    func makeMessageOfTheDaySection() -> SingleColumnSection {
        
        let headerData = MainSectionHeaderData(
            title: "MessageOfTheDay", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        
        let configurator = MessageOfTheDayCellConfigurator(data: "")
        
        return SingleColumnSection(cellConfigurators: [configurator], headerConfigurator: headerConfigurator)
        
    }

    // MARK: - Selectors

}

