//
//  CommunityTests.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 15/01/2023.
//

import XCTest

class CommunityTests: XCTestCase {
    
    // MARK: Mocked data
    let communities = [
        CommunityDomain(remote: .init(
            id: 1,
            communityName: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
            communityDescription: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
            communitySmallImage: "https://res.cloudinary.com/dv1dmymg2/image/upload/c_fill,h_256,w_512,x_0/v1673289877/PlantBuddy/Communities/BackgroundHeaders/DALL_E_2023-01-09_19.42.52_-_corporateStyle_people_figures_smiling_and_talking_surrounded_by_lots_of_different_home_plants_klh4dh.png",
            communityBigImage: "https://res.cloudinary.com/dv1dmymg2/image/upload/c_fill,h_256,w_512,x_0/v1673289877/PlantBuddy/Communities/BackgroundHeaders/DALL_E_2023-01-09_19.42.52_-_corporateStyle_people_figures_smiling_and_talking_surrounded_by_lots_of_different_home_plants_klh4dh.png",
            isActive: true,
            createdAt: Date().description,
            updatedAt: Date().description
        )),
        CommunityDomain(remote: .init(
            id: 2,
            communityName: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
            communityDescription: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
            communitySmallImage: "https://res.cloudinary.com/dv1dmymg2/image/upload/c_fill,h_256,w_512,x_0/v1673289877/PlantBuddy/Communities/BackgroundHeaders/DALL_E_2023-01-09_19.42.52_-_corporateStyle_people_figures_smiling_and_talking_surrounded_by_lots_of_different_home_plants_klh4dh.png",
            communityBigImage: "https://res.cloudinary.com/dv1dmymg2/image/upload/c_fill,h_256,w_512,x_0/v1673289877/PlantBuddy/Communities/BackgroundHeaders/DALL_E_2023-01-09_19.42.52_-_corporateStyle_people_figures_smiling_and_talking_surrounded_by_lots_of_different_home_plants_klh4dh.png",
            isActive: false,
            createdAt: Date().description,
            updatedAt: Date().description
        )),
        CommunityDomain(remote: .init(
            id: 3,
            communityName: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
            communityDescription: "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';",
            communitySmallImage: "https://res.cloudinary.com/dv1dmymg2/image/upload/c_fill,h_256,w_512,x_0/v1673289877/PlantBuddy/Communities/BackgroundHeaders/DALL_E_2023-01-09_19.42.52_-_corporateStyle_people_figures_smiling_and_talking_surrounded_by_lots_of_different_home_plants_klh4dh.png",
            communityBigImage: "https://res.cloudinary.com/dv1dmymg2/image/upload/c_fill,h_256,w_512,x_0/v1673289877/PlantBuddy/Communities/BackgroundHeaders/DALL_E_2023-01-09_19.42.52_-_corporateStyle_people_figures_smiling_and_talking_surrounded_by_lots_of_different_home_plants_klh4dh.png",
            isActive: true,
            createdAt: Date().description,
            updatedAt: Date().description
        ))
    ]
    
    var onCommunityTilePressed: ((CommunityDomain) -> Void)?
    var addPost: ((String) -> Void)?
    
    
    // MARK: Methods to test
    
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
    
    func makeTextViewShouldChangeInRange(commentTextLenght: Int) -> (UITextView, NSRange, String) -> (Bool) {
        return { textView, range, text in
            if text == "\n" {
                textView.resignFirstResponder()
                return false
            }
            
            let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
            let numberOfCharacters = newText.count
            
            return numberOfCharacters < commentTextLenght
        }
    }
    
    func makeCommentInputSection() -> SingleColumnSection {
        let didPressAddComment: (String?) -> Void = { [weak self] text in
            guard let self = self, let postBody = text else { return }
            self.addPost?(postBody)
            Logger.info("ADDPRESSED")
        }
        
        let commentCellData = CommentTextFieldCellData(
            text: "Comment...",
            textViewHeight: 100.deviceSizeAware,
            maximumCommentTextLength: 499,
            returnTypeKey: .done,
            didPressAddComment: didPressAddComment,
            textViewDidChange: {text in Logger.error("\(text)")},
            textViewDidEndEditing: {text in Logger.error("EDITING END \(text)")},
            textViewShouldChangeInRange: makeTextViewShouldChangeInRange(commentTextLenght: 499))
        let commentCellConfigurator = CommentTextFieldCellConfigurator(data: commentCellData)
        
        return SingleColumnSection(cellConfigurators: [commentCellConfigurator])
    }
    
    func makeCommunityHeaderCell(communityDomain: CommunityDomain) -> SingleColumnSection {
        let configurator = CommunityHeaderCellConfigurator(data: CommunityHeaderCellData(communityDomain: communityDomain))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeAnimationFillerSection() -> SingleColumnSection {
        let configurator = AnimationFillerCellConfigurator(data: AnimationFillerCellData(animationName: "girl_community"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    // MARK: Tests
    func testMakeAnimationFillerSection() {
        let expectedConfigurator = AnimationFillerCellConfigurator(data: AnimationFillerCellData(animationName: "girl_community"))
        
        let expectedSection = SingleColumnSection(cellConfigurators: [expectedConfigurator])
        
        let result = makeAnimationFillerSection()
        XCTAssertEqual(result, expectedSection)
    }
    
    
    func testMakeAllCommunitiesSection() {
        let expectedConfigurators = communities.map { community in
            CommunityCellConfigurator(data: CommunityCellData(
                communityDomain: community,
                didPressCommunityTile: {
                    Logger.info("\(community.communityName) TILE TAPPED")
                    self.onCommunityTilePressed?(community)
                }))
        }
        
        let expectedSection = SingleColumnSection(cellConfigurators: expectedConfigurators)
        
        let result = makeAllCommunitiesSection(communities: communities)
        XCTAssertEqual(result, expectedSection)
    }
    
    func testMakeCommentInputSection() {
        let expectedDidPressAddComment: (String?) -> Void = { [weak self] text in
            guard let self = self, let postBody = text else { return }
            self.addPost?(postBody)
            Logger.info("ADDPRESSED")
        }
        
        let expectedCommentCellData = CommentTextFieldCellData(
            text: "Comment...",
            textViewHeight: 100.deviceSizeAware,
            maximumCommentTextLength: 499,
            returnTypeKey: .done,
            didPressAddComment: expectedDidPressAddComment,
            textViewDidChange: {text in Logger.error("\(text)")},
            textViewDidEndEditing: {text in Logger.error("EDITING END \(text)")},
            textViewShouldChangeInRange: makeTextViewShouldChangeInRange(commentTextLenght: 499))
        
        let expectedConfigurator = CommentTextFieldCellConfigurator(data: expectedCommentCellData)
        
        let expectedSection = SingleColumnSection(cellConfigurators: [expectedConfigurator])
        
        let result = makeCommentInputSection()
        XCTAssertEqual(result, expectedSection)
    }
    
    func testMakeCommunityHeaderCell() {
        let expectedConfigurator = CommunityHeaderCellConfigurator(data: CommunityHeaderCellData(communityDomain: communities.first!))
        
        let expectedSection = SingleColumnSection(cellConfigurators: [expectedConfigurator])
        
        let result = makeCommunityHeaderCell(communityDomain: communities.first!)
        XCTAssertEqual(result, expectedSection)
    }
}
