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
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var plants: [PlantDomain]?
    
    private var user: UserDomain? {
        didSet{
            buildSections()
        }
    }

    //MARK: - Initialization
    

    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        
        Network.shared.apollo.fetch(query: FetchUserProfileQuery(userId: 2)) { result in
            switch result {
            case .success(let GQLResult):
                //                self.onFetchSuccess?()
                Logger.info("\(GQLResult)")
                
                self.plants = GQLResult.data?.plant.map({ res in
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
                
                self.user = GQLResult.data?.user.first.map({ user in
                    UserDomain(remote: UserRemote(
                        id: user.id,
                        name: user.name,
                        userName: user.userName,
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
                
                UIAppDelegate?.hideLoadingIndicator()
            case .failure(let error):
                UIAppDelegate?.hideLoadingIndicator()
                Logger.error("ERROR: \(error)")
            }
        }
    }

    public func buildSections() {
        sectionSequence = SectionSequence(
            sections: [
                makeUserProfileSection(name: user?.name ?? "TEST", points: user?.points.description ?? "250"),
                makeHelloHeaderSection(title: String(user?.name ?? "TEST")),
                makeHelloHeaderSection(title: String(user?.userName ?? "TEST")),
                makeHelloHeaderSection(title: String(user?.userType.rawValue ?? "TEST")),
                makePlantCountSection()
        ])
    }

    //MARK: - Private methods

    private func makeHelloHeaderSection(title: String) -> SingleColumnSection {

        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: title))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeUserProfileSection(name: String, points: String) -> SingleColumnSection {

        let configurator = UserProfileCellConfigurator(data: UserProfileCellData(name: "Hello \(name)", points: "+\(points)"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makePlantCountSection() -> SingleColumnSection {
        if let plantCount = plants?.count {
            let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "Plant Count: \(plantCount)"))
            
            return SingleColumnSection(cellConfigurators: [configurator])
        } else {
            let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: "JEBŁO"))
            
            return SingleColumnSection(cellConfigurators: [configurator])
        }
    }

    // MARK: - Selectors

}

