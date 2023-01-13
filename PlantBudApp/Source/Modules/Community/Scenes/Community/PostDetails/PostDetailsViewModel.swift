//
//  PostDetailsViewModel.swift
//  PlantBudApp
//
//  Created by Kamil Zachara on 11/01/2023.
//

import UIKit


final class PostDetailsViewModel {

    //MARK: - Binding closures

    public var onSectionSequenceChange: ((SectionSequence) -> Void)?
    public var onError: ((Error) -> ())?
    public var didPressComment: (() -> Void)?
    public var didPressPostOptions: (() -> Void)?

    //MARK: Private properties
    
    private var sectionSequence: SectionSequence = SectionSequence() {
        didSet {
            onSectionSequenceChange?(sectionSequence)
        }
    }
    
    private var post: PostDomain
    private var comments: [CommentDomain]
    private var commentContent: String?
    private weak var tableViewInterface: TableViewControllerInterface?
    
    
    
    //MARK: - Initialization
    init(postDomain: PostDomain, commentDomains: [CommentDomain], tableViewInterface: TableViewControllerInterface) {
        self.post = postDomain
        self.comments = commentDomains
        self.tableViewInterface = tableViewInterface
    }
    
    //MARK: - Access methods
    
    public func loadData(refresh: Bool = false) {
        //        fetchData()
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        fetchComments {
            dispatchGroup.leave()
        }
//        dispatchGroup.enter()
//        updatePoints{
//            dispatchGroup.leave()
//        }
        
        dispatchGroup.notify(queue: .main) {
            self.buildSections(post: self.post, comments: self.comments)
        }
        
    }

    public func buildSections(post: PostDomain, comments: [CommentDomain]) {
        
        sectionSequence = SectionSequence(
            sections: [
                makePostHeaderSection(post: post),
                makeCommentInputSection(),
                makeCommentsSection(comments: comments),
                makeAnimationFillerSection()
        ])
    }
    private func makeAnimationFillerSection() -> SingleColumnSection {
        let configurator = AnimationFillerCellConfigurator(data: AnimationFillerCellData(animationName: "people_talking"))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makePostHeaderSection(post: PostDomain) -> SingleColumnSection {
        let didPressUpVote: () -> Void = { [weak self] in
            guard let self = self else { return }
//            self.postUpvote(postId: post.id)
            Logger.info("UP")
        }
        let didPressDownVote: () -> Void = { [weak self] in
            guard let self = self else { return }
//            self.postDownVote(postId: post.id)
            Logger.info("DOwn")
        }
        let didPressOptions: () -> Void = { [weak self] in
            guard let self = self else { return }
//                self.didPressPostDetails?(post, postComments)
            Logger.info("Options")
        }
        let configurator = PostDetailsHeaderCellConfigurator(data: PostDetailsHeaderCellData(
            postDomain: post,
            didPressPostOptions: didPressOptions,
            didPressUpVote: didPressUpVote,
            didPressDownVote: didPressDownVote))
        
        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private func makeCommentsSection(comments: [CommentDomain]) -> SingleColumnSection {
        let configurators = comments.map { comment -> CommentCellConfigurator in
            CommentCellConfigurator(data: CommentCellData(comment: comment))
        }
        
        return SingleColumnSection(cellConfigurators: configurators)
    }
    
    public func makeCommentInputSection() -> SingleColumnSection
    {
        let didPressAddComment: (String?) -> Void = { [weak self] text in
            guard let self = self, let commentBody = text else { return }
            self.addComment(commentBody: commentBody)
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
    //MARK: - Private methods
    
    
    
    
//    private func makeCommunityHeaderCell(communityDomain: CommunityDomain) -> SingleColumnSection {
//        let configurator = CommunityHeaderCellConfigurator(data: CommunityHeaderCellData(communityDomain: communityDomain))
//
//        return SingleColumnSection(cellConfigurators: [configurator])
//    }
//    
//    private func makeCommunityPostCellData(
//        postDomain: PostDomain,
//        comment: [CommentDomain],
//        didPressComment: (() -> Void)?,
//        didPressPostOptions: (() -> Void)?,
//        didPressUpVote: (() -> Void)?,
//        didPressDownVote: (() -> Void)?
//    ) -> CommunityPostCellData {
//        return CommunityPostCellData(
//            postUser: UserContentDataDomain(remote: UserContentDataRemote(userName: postDomain.userName)),
//            postDomain: postDomain,
//            commentUser: UserContentDataDomain(remote: UserContentDataRemote(userName: comment.first?.userName ?? "dupa")),
//            comments: comment,
//            didPressComment: didPressComment,
//            didPressPostOptions: didPressPostOptions,
//            didPressUpVote: didPressUpVote,
//            didPressDownVote: didPressDownVote
//        )
//    }
    private func addComment(commentBody: String) {
        UIAppDelegate?.showLoadingIndicator()
        Network.shared.apollo.store.clearCache()
        Network.performMutation(mutation: AddCommentMutation(commentInput: Comment_insert_input(
            commentBody: commentBody,
            postId: self.post.id,
            userName: UserContext.shared.userProfile?.userName)
        )) { result in
            switch result {
            case .success(let success):
                Logger.info(success.insertCommentOne.debugDescription)
//                self.fetchComments()
                UIAppDelegate?.hideLoadingIndicator()
                self.loadData()
            case .failure(let failure):
                Logger.error(failure.localizedDescription)
                UIAppDelegate?.hideLoadingIndicator()
            }
        }
    }
    
    private func fetchComments(completion: (() -> Void)? = nil) {
        let dispatchGroup = DispatchGroup()
        var comments: [CommentDomain]?
        
        UIAppDelegate?.showLoadingIndicator()
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchPostCommentsQuery(postId: self.post.id)) { result in
            switch result {
            case .success(let data):
                comments = data.comment.map { comment in
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
            dispatchGroup.leave()
        }
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            // Use data1, data2, and data3 here
            guard let comments = comments else { return }
            self.comments = comments
            completion?()
            UIAppDelegate?.hideLoadingIndicator()
        }
    }
    
    private func updatePoints(completion: (() -> Void)? = nil) {
        let dispatchGroup = DispatchGroup()
        var postPoints: Int?
        
        UIAppDelegate?.showLoadingIndicator()
        // Fetch data1
        dispatchGroup.enter()
        Network.fetchData(query: FetchPostPointsQuery(postId: self.post.id)) { result in
            switch result {
            case .success(let data):
                postPoints = data.post.first?.points
            case .failure(let error):
                Logger.error("ERROR: \(error)")
            }
            dispatchGroup.leave()
        }
        
        // Run a block of code when all requests are completed
        dispatchGroup.notify(queue: .main) {
            // Use data1, data2, and data3 here
            guard let postPoints = postPoints else { return }
            let updatedPost = PostDomain(domain: self.post, points: postPoints)
            self.post = updatedPost
            completion?()
            UIAppDelegate?.hideLoadingIndicator()
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
                self.updatePoints()
                Logger.info("BEFORE: \(pointsBefore) -> AFTER: \(res)")
            }
        }
    }
    
//    private func postDownVote(postId: Int, completion: (() -> Void)? = nil) {
//        UIAppDelegate?.showLoadingIndicator()
//        let dispatchGroup = DispatchGroup()
//        var pointsBefore: Int?
//        var pointsAfter: Int?
//        var res: String?
//
//        // Fetch data1
//        dispatchGroup.enter()
//        Network.fetchData(query: FetchPostPointsQuery(postId: postId)) { result in
//            switch result {
//            case .success(let data):
//                pointsBefore = data.post.first?.points
//            case .failure(let error):
//                Logger.error("ERROR: \(error)")
//            }
//            dispatchGroup.leave()
//        }
//
//        // Run a block of code when all requests are completed
//        dispatchGroup.notify(queue: .main) {
//            // Use data1, data2, and data3 here
//            let dispatchGroup2 = DispatchGroup()
//            dispatchGroup2.enter()
//            guard let pointsBefore = pointsBefore else { return }
//            pointsAfter = pointsBefore - 1
//            Network.performMutation(mutation: UpVotePostMutation(postId: postId, points: pointsAfter)) { result in
//                switch result {
//                case .success(let data):
//                    Logger.debug("POSTAFTER\(data)")
//                    res = data.updatePost.debugDescription
//                case .failure(let failure):
//                    Logger.error("FAILIURE: \(failure)")
//                }
//                dispatchGroup2.leave()
//            }
//            dispatchGroup2.notify(queue: .main) {
//                Network.shared.apollo.store.clearCache()
//                UIAppDelegate?.hideLoadingIndicator()
//                self.updatePoints()
//                completion?()
//                Logger.info("BEFORE: \(pointsBefore) -> AFTER: \(res)")
//            }
//        }
//    }

    // MARK: - Selectors

}




