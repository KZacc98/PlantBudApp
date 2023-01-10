//
//  CommunityViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import UIKit

final class CommunityViewModel {

    //MARK: - Binding closures

    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onError: ((Error) -> ())?

    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private let communityDomain: CommunityDomain
    
    private var communityContent: CommunityContent? {
        didSet{
            guard let communityContent = communityContent else {return}
            buildSections(community: communityContent.community, posts: communityContent.posts, comments: communityContent.comments)
            Logger.debug("\(communityContent.posts.debugDescription)")
        }
    }
    
    
    //MARK: - Initialization
    init(communityDomain: CommunityDomain) {
        self.communityDomain = communityDomain
    }
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        fetchData(communityId: communityDomain.id)
        
    }

    public func buildSections(community: CommunityDomain, posts: [PostDomain], comments: [CommentDomain]) {
        let configurators = posts.map { post -> CommunityPostCellConfigurator in
            let postComments = comments.filter { comment in comment.postId == post.id }
            return CommunityPostCellConfigurator(data: makeCommunityPostCellData(postDomain: post, comment: postComments))
        }
        sectionSequence = SectionSequence(
            sections: [
                makeCommunityHeaderCell(communityDomain: community),
                SingleColumnSection(cellConfigurators: configurators)
        ])
    }
    
    //MARK: - Private methods
    private func fetchData(communityId: Int) {
        
        let dispatchGroup = DispatchGroup()
        var communityUsers: [CommunityUserDomain]?
        var communityPosts: [PostDomain]?
        var comments: [CommentDomain]? //DO WYWALENIA PRZEKAŻ Z CommunityList
        
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchCommunityContentQuery(communityId: communityId)) { result in
            switch result {
            case .success(let data):
                communityUsers = data.communityUsers.map { communityUser in
                    CommunityUserDomain(remote: CommunityUserRemote(
                        userId: communityUser.userId,
                        createdAt: communityUser.createdAt,
                        updatedAt: communityUser.updatedAt
                    ))
                }
                communityPosts = data.post.map { post in
                    PostDomain(remote: PostRemote(
                        id: post.id,
                        communityId: post.communityId,
                        image: post.image,
                        userName: post.userName,
                        postBody: post.postBody,
                        isAnnouncement: post.isAnnouncement,
                        points: post.points,
                        flag: post.flag,
                        createdAt: post.createdAt,
                        updatedAt: post.updatedAt
                    ))
                }
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
        
//        // Fetch data2
//        dispatchGroup.enter()
//        Network.fetchData(query: fe()) { result in
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
            guard let communityUsers = communityUsers, let communityPosts = communityPosts else { return }
            let postIds = communityPosts.compactMap { $0.id }
            let dispatchGroup2 = DispatchGroup()
            var userContentDataDomains: [UserContentDataDomain]?
            
            dispatchGroup2.enter()
            Network.fetchData(query: BatchFetchCommentsQuery(postIds: postIds)) { result in
                switch result {
                case .success(let data):
                    comments = data.comment.map{ comment in
                        CommentDomain(remote: CommentRemote(
                            id: comment.id,
                            postId: comment.postId,
                            userName: comment.userName,
                            commentBody: comment.commentBody,
                            image: comment.image,
                            points: comment.points,
                            flag: comment.flag,
                            createdAt: comment.createdAt,
                            updatedAt: comment.updatedAt
                        ))
                    }
                case .failure(let error):
                    Logger.error("ERROR: \(error)")
                }
                dispatchGroup2.leave()
            }
            
            
            dispatchGroup2.notify(queue: .main) {
                guard let comments = comments else { return }
                Logger.error("\(comments.debugDescription)")
                self.communityContent = CommunityContent(
                    community: self.communityDomain,
                    communityUsers: communityUsers,
                    posts: communityPosts,
                    comments: comments
                )
                
            }
            
        }
    }

    private func makeHelloHeaderSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: self.communityDomain.id.description))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeCommunityHeaderCell(communityDomain: CommunityDomain) -> SingleColumnSection {
        let configurator = CommunityHeaderCellConfigurator(data: CommunityHeaderCellData(communityName: communityDomain.communityName, bigImage: communityDomain.communityBigImage))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeCommunityPostCellData(postDomain: PostDomain, comment: [CommentDomain]) -> CommunityPostCellData {
        return CommunityPostCellData(
            postUser: UserContentDataDomain(remote: UserContentDataRemote(userName: postDomain.userName)),
            postBody: postDomain.postBody,
            postImage: postDomain.image,
            commentUser: UserContentDataDomain(remote: UserContentDataRemote(userName: comment.first?.userName ?? "dupa")),
            comments: comment
//            didPressCommunityTile: {Logger.error("sdl;kfhasdjhfkl;jasdhfgbjklSDKJH")}
        )
    }

    // MARK: - Selectors

}



