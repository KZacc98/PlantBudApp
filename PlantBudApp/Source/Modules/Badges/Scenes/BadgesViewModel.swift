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
    
    private var userBadges: [UserBadgeDomain]?
    private let defaults = UserDefaults.standard
    
    private var badges: [BadgeDomain]? {
        didSet{
            buildSections()
        }
    }
    
    private var displayBadges: [BadgeDomain]? {
        didSet{
            badges = displayBadges?.filter{ displayBadge in
                userBadges?.contains(where: {userBadge in
                    userBadge.badgeId == displayBadge.id
                }) ?? false
            }
        }
    }
    
    //MARK: - Initialization
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        UIAppDelegate?.showLoadingIndicator()
        
        let dispatchGroup = DispatchGroup()
        var allBadges: [BadgeDomain]?
        var userBadges: [UserBadgeDomain]?
//        var data3: DataType3?
        
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchBadgesQuery()) { result in
            switch result {
            case .success(let data):
                allBadges = data.badge.map({ res in
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
                Logger.error(error.localizedDescription)
            }
            dispatchGroup.leave()
        }
        
        // Fetch data2
        dispatchGroup.enter()
        Network.fetchData(query: FetchUserBadgesQuery(userId: defaults.integer(forKey: "userId"))) { result in
            switch result {
            case .success(let data):
                userBadges = data.userBadges.map({ res in
                    UserBadgeDomain(remote: UserBadgeRemote(
                        userId: res.userId,
                        badgeId: res.badgeId,
                        createdAt: res.createdAt,
                        updatedAt: res.updatedAt
                    ))
                })
            case .failure(let error):
                Logger.error(error.localizedDescription)
            }
            dispatchGroup.leave()
        }

        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            // Use data1, data2, and data3 here
            self.userBadges = userBadges
            self.displayBadges = allBadges
        }

    }

    public func buildSections() {
        let cellConfigurators: [any ReusableViewConfiguratorInterface]
        if let badge = self.badges?.last, let badges = self.displayBadges {
            sectionSequence = SectionSequence(
                sections: [
                    makeCurrentBadgeSection(badge: badge),
                    makeBadgesSection(badges: badges)
                ])
        } else {
            let headerData = MainSectionHeaderData(
                title: "allBadgesHeaderLabel".localized, insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
            let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
            cellConfigurators = [
                NoDataCellConfigurator(message: "noBadges".localized)
            ]
            sectionSequence = SectionSequence(
                sections: [SingleColumnSection(cellConfigurators: cellConfigurators, headerConfigurator: headerConfigurator),
                           makeBadgesSection(badges: self.displayBadges!)])
        }
        UIAppDelegate?.hideLoadingIndicator()
    }
    
    //MARK: - Private methods

    private func makeCurrentBadgeSection(badge: BadgeDomain) -> SingleColumnSection {
        let headerData = MainSectionHeaderData(
            title: "newestBadgeHeaderLabel".localized, insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        let configurator = CurrentBadgeCellConfigurator(data: CurrentBadgeCellData(
            points: badge.points,
            badgeName: badge.badgeName,
            imageUrl: badge.badgeImage
        ))

        return SingleColumnSection(cellConfigurators: [configurator], headerConfigurator: headerConfigurator)
    }
    
    private func makeBadgesSection(badges: [BadgeDomain]) -> SingleColumnSection {
        let headerData = MainSectionHeaderData(
            title: "allBadgesHeaderLabel".localized, insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
        let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
        let configurators = badges.map { badge in
            BadgeCellConfigurator(data: BadgeCellData(
                points: badge.points,
                badgeName: badge.badgeName,
                imageUrl: badge.badgeImage,
                badgeInfo: badge.badgeDescription,
                isCompleted: self.userBadges?.contains(where: { userBadge in
                    userBadge.badgeId == badge.id
                }) ?? false
            ))
        }

        return SingleColumnSection(cellConfigurators: configurators, headerConfigurator: headerConfigurator)
    }

    // MARK: - Selectors

}

