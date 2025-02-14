//
//  CommunityViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 09/01/2023.
//

import UIKit
import Apollo

final class CommunityViewModel {

    //MARK: - Binding closures

    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onError: ((Error) -> ())?
    public var didPressPostDetails: ((PostDomain, [CommentDomain]) -> Void)?
    public var didPressPostOptions: (() -> Void)?
    public var didPressUserHeader: ((String) -> Void)?

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
    
    private lazy var joinCommunityButton: MainButtonCellConfigurator = {
        let didPressButton: () -> () = { [weak self] in
            DialogManager.showConfirmationDialog(
                title: "joinCommunityDialogTitle".localized,
                message: "joinCommunityDialogMessage".localized,
                cancelButtonTitle: "no".localized,
                acceptBlock: {
                    guard let communityId = self?.communityDomain.id else { return }
                    Logger.info("JoinCommunity request")
                    self?.joinCommunity(communityId: communityId)
                },
                rejectBlock: {
                    Logger.info("go back")
                }
            )
            
        }
        let buttonInsets = UIEdgeInsets(top: 24.deviceSizeAware,
                                        left: 12,
                                        bottom: -24.deviceSizeAware,
                                        right: -12)
        let data = MainButtonCellData(title: "joinCommunityButtonTitle".localized,
                                      buttonInsets: buttonInsets,
                                      didPressButton: didPressButton)
        
        return MainButtonCellConfigurator(data: data)
    }()
    
    //MARK: - Initialization
    init(communityDomain: CommunityDomain) {
        self.communityDomain = communityDomain
    }
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        fetchData(communityId: communityDomain.id)
        
    }

    public func buildSections(community: CommunityDomain, posts: [PostDomain], comments: [CommentDomain]) {
        if let userId = UserContext.shared.userProfile?.id, let communityContent = self.communityContent,
           communityContent.communityUsers.filter({ communityUserDomain in
               communityUserDomain.userId == userId
           }).isEmpty{
            sectionSequence = SectionSequence(
                sections: [
                    makeCommunityHeaderCell(communityDomain: community),
                    SingleColumnSection(cellConfigurators: [joinCommunityButton]),
                    makeAnimationFillerSection()
                ])
        } else {
            let sortedPosts = posts.sorted(by: sortPosts)
            
            let configurators = sortedPosts.map { post -> CommunityPostCellConfigurator in
                let postComments = comments.filter { comment in comment.postId == post.id }
                let didPressUpVote: () -> Void = { [weak self] in
                    guard let self = self else { return }
                    self.postUpvote(postId: post.id)
                }
                let didPressDownVote: () -> Void = { [weak self] in
                    guard let self = self else { return }
                    self.postDownVote(postId: post.id)
                }
                let didPressComment: () -> Void = { [weak self] in
                    guard let self = self else { return }
                    self.didPressPostDetails?(post, postComments)
                }
                let didPressUserHeader: () -> Void = { [weak self] in
                    guard let self = self else { return }
                    self.didPressUserHeader?(post.userName)
                }
                
                return CommunityPostCellConfigurator(data: makeCommunityPostCellData(
                    postDomain: post,
                    comment: postComments,
                    didPressComment: didPressComment,
                    didPressPostOptions: {
                        DialogManager.showConfirmationDialog(
                            title: "postOptionsDialogTitle".localized,
                            message: "postOptionsDialogMessage".localized,
                            cancelButtonTitle: "back".localized,
                            otherButtonTitles: ["postOptionReport".localized],
                            acceptBlock: { [weak self] in
                                self?.reportPost(postId: post.id)
                                Logger.info("\(posts.debugDescription) reported by: \(String(describing: UserContext.shared.userProfile?.id))")
                            },
                            rejectBlock: {
                                Logger.info("Option dialog closed")
                            })
                    },
                    didPressUpVote: didPressUpVote,
                    didPressDownVote: didPressDownVote,
                    didPressUserHeader: didPressUserHeader
                ))
            }
            sectionSequence = SectionSequence(
                sections: [
                    makeCommunityHeaderCell(communityDomain: community),
                    makeCommentInputSection(),
                    SingleColumnSection(cellConfigurators: configurators),
                    makeAnimationFillerSection()
                ])
        }
    }
    
    //MARK: - Private methods
    
    private func sortPosts(post1: PostDomain, post2: PostDomain) -> Bool {
        let currentDate = Date()
        guard let oneWeekAgo = Calendar.current.date(byAdding: .day, value: -7, to: currentDate) else { return false }
        
        if post1.createdAt < oneWeekAgo && post2.createdAt < oneWeekAgo {
            return post1.points > post2.points
        } else if post1.createdAt > oneWeekAgo && post2.createdAt > oneWeekAgo {
            return post1.createdAt > post2.createdAt
        } else {
            return post1.createdAt > post2.createdAt
        }
    }

    private func reportPost(postId: Int) {
        Network.performMutation(mutation: UpdatePostFlagMutation(postId: postId, flag: "offfensive")) { result in
            switch result {
            case .success(let success):
                Logger.info("\(success)")
            case .failure(let failure):
                Logger.error("\(failure)")
            }
        }
    }
    
    private func postUpvote(postId: Int) {
        UIAppDelegate?.showLoadingIndicator()
        let dispatchGroup = DispatchGroup()
        var pointsBefore: Int?
        var pointsAfter: Int?
        var res: String?
        
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchPostPointsQuery(postId: postId)) { result in
            switch result {
            case .success(let data):
                pointsBefore = data.post.first?.points
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            // Use data1, data2, and data3 here
            let dispatchGroup2 = DispatchGroup()
            dispatchGroup2.enter()
            guard let pointsBefore = pointsBefore else { return }
            pointsAfter = pointsBefore + 1
            Network.performMutation(mutation: UpVotePostMutation(postId: postId, points: pointsAfter)) { result in
                switch result {
                case .success(let data):
                    Logger.debug("POSTAFTER\(data)")
                    res = data.updatePost.debugDescription
                case .failure(let failure):
                    Logger.error("FAILIURE: \(failure)")
                }
                dispatchGroup2.leave()
            }
            dispatchGroup2.notify(queue: .main) {
                Network.shared.apollo.store.clearCache()
                UIAppDelegate?.hideLoadingIndicator()
                self.fetchData(communityId: self.communityDomain.id)
                Logger.info("BEFORE: \(pointsBefore) -> AFTER: \(res)")
            }
        }
    }
    
    private func postDownVote(postId: Int) {
        UIAppDelegate?.showLoadingIndicator()
        let dispatchGroup = DispatchGroup()
        var pointsBefore: Int?
        var pointsAfter: Int?
        var res: String?
        
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchPostPointsQuery(postId: postId)) { result in
            switch result {
            case .success(let data):
                pointsBefore = data.post.first?.points
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            // Use data1, data2, and data3 here
            let dispatchGroup2 = DispatchGroup()
            dispatchGroup2.enter()
            guard let pointsBefore = pointsBefore else { return }
            pointsAfter = pointsBefore - 1
            Network.performMutation(mutation: UpVotePostMutation(postId: postId, points: pointsAfter)) { result in
                switch result {
                case .success(let data):
                    Logger.debug("POSTAFTER\(data)")
                    res = data.updatePost.debugDescription
                case .failure(let failure):
                    Logger.error("FAILIURE: \(failure)")
                }
                dispatchGroup2.leave()
            }
            dispatchGroup2.notify(queue: .main) {
                Network.shared.apollo.store.clearCache()
                UIAppDelegate?.hideLoadingIndicator()
                self.fetchData(communityId: self.communityDomain.id)
                Logger.info("BEFORE: \(pointsBefore) -> AFTER: \(res)")
            }
        }
    }
    

    private func addPost(postBody: String) {
        UIAppDelegate?.showLoadingIndicator()
        Network.shared.apollo.store.clearCache()
        Network.performMutation(mutation: AddPostMutation(postInput: Post_insert_input(
            communityId: communityDomain.id,
            postBody: postBody,
            userName: UserContext.shared.userProfile?.userName))) { result in
                switch result {
                case .success(let success):
                    Logger.info("\(success.insertPostOne.debugDescription)")
                    UIAppDelegate?.hideLoadingIndicator()
                    self.fetchData(communityId: self.communityDomain.id)
                case .failure(let failure):
                    Logger.error(failure.localizedDescription)
                    UIAppDelegate?.hideLoadingIndicator()
                }
            }
    }
    
    private func joinCommunity(communityId: Int) {
        let timestamp = Network.getTimestamp()
        UIAppDelegate?.showLoadingIndicator()
        Network.shared.apollo.store.clearCache()
        Network.performMutation(mutation: JoinCommunityMutation(joinComunityInput: CommunityUsers_insert_input(
            communityId: communityId,
            updatedAt: timestamp,
            userId: UserContext.shared.userProfile?.id
        ))) { result in
            switch result {
            case .success(let success):
                Logger.info(success.insertCommunityUsersOne.debugDescription)
                self.fetchData(communityId: self.communityDomain.id)
            case .failure(let failure):
                Logger.error(failure.localizedDescription)
            }
        }
    }
    
    
    private func fetchData(communityId: Int) {
        let dispatchGroup = DispatchGroup()
        var communityUsers: [CommunityUserDomain]?
        var communityPosts: [PostDomain]?
        var comments: [CommentDomain]? //DO WYWALENIA PRZEKAŻ Z CommunityList
        
        UIAppDelegate?.showLoadingIndicator()
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
                UIAppDelegate?.hideLoadingIndicator()
            }
            
        }
    }

    private func makeHelloHeaderSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: self.communityDomain.id.description))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    public func makeCommentInputSection() -> SingleColumnSection
    {
        let didPressAddComment: (String?) -> Void = { [weak self] text in
            guard let self = self, let postBody = text else { return }
            self.addPost(postBody: postBody)
            Logger.info("ADDPRESSED")
        }
        
        let commentCellData = CommentTextFieldCellData(
            text: "",
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
    
    private func makeAnimationFillerSection() -> SingleColumnSection {
        let configurator = AnimationFillerCellConfigurator(data: AnimationFillerCellData(animationName: "girl_community"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeCommunityHeaderCell(communityDomain: CommunityDomain) -> SingleColumnSection {
        let configurator = CommunityHeaderCellConfigurator(data: CommunityHeaderCellData(communityDomain: communityDomain))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeCommunityPostCellData(
        postDomain: PostDomain,
        comment: [CommentDomain],
        didPressComment: (() -> Void)?,
        didPressPostOptions: (() -> Void)?,
        didPressUpVote: (() -> Void)?,
        didPressDownVote: (() -> Void)?,
        didPressUserHeader: (() -> Void)?
    ) -> CommunityPostCellData {
        return CommunityPostCellData(
            postUser: UserContentDataDomain(remote: UserContentDataRemote(userName: postDomain.userName)),
            postDomain: postDomain,
            commentUser: UserContentDataDomain(remote: UserContentDataRemote(userName: comment.first?.userName ?? "")),
            comments: comment,
            didPressComment: didPressComment,
            didPressPostOptions: didPressPostOptions,
            didPressUpVote: didPressUpVote,
            didPressDownVote: didPressDownVote,
            didPressUserHeader: didPressUserHeader
        )
    }
    
    public func makeTextViewShouldChangeInRange(commentTextLenght: Int) -> (UITextView, NSRange, String) -> (Bool) {
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

    // MARK: - Selectors

}



