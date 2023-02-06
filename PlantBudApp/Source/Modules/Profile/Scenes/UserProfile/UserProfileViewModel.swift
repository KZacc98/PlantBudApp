//
//  UserProfileViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 28/01/2023.
//

import UIKit

final class UserProfileViewModel {
    
    //MARK: - Binding closures
    
    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onLogout: (() -> Void)?
    public var onError: ((Error) -> ())?
    
    //MARK: Private properties
    
    let profilePicturePlaceholder = "https://res.cloudinary.com/dv1dmymg2/image/upload/v1674924697/PlantBuddy/Placeholders/UserImagePlaceholderLight_hthfkm.png"
    
    private var username: String {
        didSet {
            //self.loadData()
        }
    }
    
    private var communityUserProfile: CommunityUserProfileData?
    private var communityUserPlants: [CommunityUserPlantData] = []
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    //MARK: - Initialization
    
    init(username: String) {
        self.username = username
    }
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        fetchUserProfileData(username: self.username)
    }
    
    public func buildSections() {
        var profilePicture: String
        if let validProfilePicture = self.communityUserProfile?.profilePicture, validProfilePicture != "" {
            profilePicture = validProfilePicture
        } else {
            profilePicture = profilePicturePlaceholder
        }
        
        
        
        sectionSequence = SectionSequence(
            sections: [
                makeProfilePictureSection(imageUrl: profilePicture),
                makePlantsSection(plants: self.communityUserPlants)
            ]
        )
    }

    
    //MARK: - Private methods
    
    private func fetchUserProfileData(username: String) {
        let dispatchGroup = DispatchGroup()
        var communityUserProfile: CommunityUserProfileData?
        var communityUserId: Int?
        var communityUserPlants: [CommunityUserPlantData]?
        
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchCommunityUserProfileQuery(username: username)) { result in
            switch result {
            case .success(let data):
                communityUserProfile = CommunityUserProfileData(profilePicture: data.user.first?.profilePicture,
                                                                points: data.user.first?.points)
                communityUserId = data.user.first?.id
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            let dispatchGroup2 = DispatchGroup()
            
            dispatchGroup2.enter()
            Network.fetchData(query: FetchCommunityUserPlantsQuery(userId: Int_comparison_exp(_eq: communityUserId))) { result in
                switch result {
                case .success(let data):
                    communityUserPlants = data.plant.map{ res in
                        CommunityUserPlantData(plantImage: res.plantImage,
                                               plantName: res.plantName,
                                               plantState: PlantState(rawValue: res.plantState))
                    }
                case .failure(let error):
                    Logger.error("ERROR: \(error)")
                }
                dispatchGroup2.leave()
            }
            
            dispatchGroup2.notify(queue: .main) {
                guard
                    let communityUserProfile = communityUserProfile,
                    let communityUserPlants = communityUserPlants
                else { return }
                self.communityUserProfile = communityUserProfile
                self.communityUserPlants = communityUserPlants
                self.buildSections()
                UIAppDelegate?.hideLoadingIndicator()
            }
        }
    }
    
    
    private func makeProfilePictureSection(imageUrl: String) -> SingleColumnSection {
        let configurator = ProfilePictureCellConfigurator(imageUrl: imageUrl)
        
        return SingleColumnSection(cellConfigurators: [configurator])
        
    }
    
    private func makePlantsSection(plants: [CommunityUserPlantData]) -> SingleColumnSection {
        
        let headerData = MainSectionHeaderData(
            title: "communityUserPlantsHeader".localized, insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        
        if plants.isEmpty{
            let configurator = NoDataCellConfigurator(message: "communityUserNoPlants".localized)
            return SingleColumnSection(cellConfigurators: [configurator], headerConfigurator: headerConfigurator)
        } else {
            let cellConfigurators = self.communityUserPlants.map { plant in
                PlantCellConfigurator(data: PlantCellData(
                    imageUrl: URL(string: plant.plantImage ?? profilePicturePlaceholder) ?? URL(string: profilePicturePlaceholder)!,
                    plantName: plant.plantName ?? "",
                    plantState: plant.plantState ?? .default,
                    plantType: nil,
                    didTapPlant: {Logger.info("\(plant.plantName) Tapped")}
                ))
            }
            
            
            return SingleColumnSection(cellConfigurators: cellConfigurators, headerConfigurator: headerConfigurator)
        }
    }
    
    
    // MARK: - Selectors
    
}




