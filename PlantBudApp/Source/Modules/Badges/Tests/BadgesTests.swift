//
//  BadgesTests.swift
//  PlantBudAppTests
//
//  Created by Kamil Zachara on 06/02/2023.
//

import XCTest

 class BadgesTests: XCTestCase {
     // MARK: Mocked Data
     let userBadges = [
         UserBadgeDomain(remote: .init(userId: 1, badgeId: 2, createdAt: Date().description, updatedAt: Date().description))
     ]

     let badge = BadgeDomain(
         id: 2,
         badgeName: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
         points: 200,
         badgeDescription: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
         badgeImage: "",
         createdAt: Date().description,
         updatedAt: Date().description)

     let badges = [
         BadgeDomain(
             id: 1,
             badgeName: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
             points: 100,
             badgeDescription: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
             badgeImage: "",
             createdAt: Date().description,
             updatedAt: Date().description),
         BadgeDomain(
             id: 2,
             badgeName: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
             points: 200,
             badgeDescription: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
             badgeImage: "",
             createdAt: Date().description,
             updatedAt: Date().description)
     ]
     let placeholder = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png"

     // MARK: Methods to test
     
     private func makeCurrentBadgeSection(badge: BadgeDomain) -> SingleColumnSection {
         let headerData = MainSectionHeaderData(
             title: "Newest Badge", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
         let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
         let configurator = CurrentBadgeCellConfigurator(data: CurrentBadgeCellData(
             points: badge.points,
             badgeName: badge.badgeName,
             imageUrl: badge.badgeImage
         ))

         return SingleColumnSection(cellConfigurators: [configurator], headerConfigurator: headerConfigurator)
     }

     private func makeBadgesSection(badges: [BadgeDomain], userBadges: [UserBadgeDomain]) -> SingleColumnSection {
         let headerData = MainSectionHeaderData(
             title: "All Badges", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
         let headerConfigurator = MainSectionHeaderConfigurator(data: headerData)
         let configurators = badges.map { badge in
             BadgeCellConfigurator(data: BadgeCellData(
                 points: badge.points,
                 badgeName: badge.badgeName,
                 imageUrl: badge.badgeImage,
                 badgeInfo: badge.badgeDescription,
                 isCompleted: userBadges.contains(where: { userBadge in
                     userBadge.badgeId == badge.id
                 })
             ))
         }

         return SingleColumnSection(cellConfigurators: configurators, headerConfigurator: headerConfigurator)
     }

     // MARK: Tests
     
     func testMakeCurrentBadgeSection() {
         let expectedHeaderData = MainSectionHeaderData(
             title: "Newest Badge", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
         let expectedHeaderConfigurator = MainSectionHeaderConfigurator(data: expectedHeaderData)

         let expectedConfigurator = CurrentBadgeCellConfigurator(data: CurrentBadgeCellData(
             points: badge.points,
             badgeName: badge.badgeName,
             imageUrl: badge.badgeImage
         ))

         let expectedSection = SingleColumnSection(cellConfigurators: [expectedConfigurator], headerConfigurator: expectedHeaderConfigurator)

         let result = makeCurrentBadgeSection(badge: badge)
         XCTAssertEqual(result, expectedSection)
     }

     func testMakeBadgesSection() {
         let expectedHeaderData = MainSectionHeaderData(
             title: "All Badges", insets: UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
         let expectedHeaderConfigurator = MainSectionHeaderConfigurator(data: expectedHeaderData)

         let expectedConfigurators = badges.map { badge in
             BadgeCellConfigurator(data: BadgeCellData(
                 points: badge.points,
                 badgeName: badge.badgeName,
                 imageUrl: badge.badgeImage,
                 badgeInfo: badge.badgeDescription,
                 isCompleted: userBadges.contains(where: { userBadge in
                     userBadge.badgeId == badge.id
                 })))
         }

         let expectedSection = SingleColumnSection(cellConfigurators: expectedConfigurators, headerConfigurator: expectedHeaderConfigurator)

         let result = makeBadgesSection(badges: badges, userBadges: userBadges)
         XCTAssertEqual(result, expectedSection)
     }
 }
