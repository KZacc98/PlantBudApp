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
    
    private var post: PostDomain {
        didSet {
            buildSections()
        }
    }
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
        
    }

    public func buildSections() {
        let didPressUpVote: () -> Void = { [weak self] in
            guard let self = self else { return }
            self.postUpvote(postId: self.post.id)
            Logger.info("UP")
        }
        let didPressDownVote: () -> Void = { [weak self] in
            guard let self = self else { return }
            self.postDownVote(postId: self.post.id)
            Logger.info("DOwn")
        }
        let didPressOptions: () -> Void = { [weak self] in
            guard let self = self else { return }
//                self.didPressPostDetails?(post, postComments)
            Logger.info("Options")
        }
        let configurator = PostDetailsHeaderCellConfigurator(data: PostDetailsHeaderCellData(postDomain: post, didPressPostOptions: didPressOptions, didPressUpVote: didPressUpVote, didPressDownVote: didPressDownVote))
            
        
        let comments = self.comments.map { comment -> CommentCellConfigurator in
            CommentCellConfigurator(data: CommentCellData(comment: comment))
        }
        sectionSequence = SectionSequence(
            sections: [
                SingleColumnSection(cellConfigurators: [configurator]),
                SingleColumnSection(cellConfigurators: comments),
                SingleColumnSection(cellConfigurators: [commentInputCellConfigurator])
        ])
    }
    private func makeHelloHeaderSection() -> SingleColumnSection {
        let configurator = HelloHeaderCellConfigurator(data: TestViewCellData(title: self.post.postBody))

        return SingleColumnSection(cellConfigurators: [configurator])
    }
    
    private lazy var commentInputCellConfigurator: TextInputCellConfigurator = {
        let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet.symbols)
                                                          .union(CharacterSet.punctuationCharacters)
                                                          .union(CharacterSet.whitespaces)
        let validator = TextValidator(minimumLength: 4,
                                      maximumLength: 254,
                                      allowedCharacters: allowedCharacters)
        let data = TextInputCellData(title: "",
                                     placeHolder: "Comment...",
                                     isSecureTextEntry: false,
                                     validator: validator)
        let configurator = TextInputCellConfigurator(data: data)
        let textFieldDidEndEditing: (String?) -> () = { [weak self, weak configurator] text in
            guard let configurator = configurator else { return }
            configurator.data.text = text
            self?.commentContent = text
            Logger.info(text ?? "DEEWOsdlkjfhasdlkf")
            ValidationManager.validate(validableInputViewConfigurator: configurator,
                                       sectionSequence: self?.sectionSequence,
                                       tableViewInterface: self?.tableViewInterface)
        }
        configurator.data.textfieldDidEndEditing = textFieldDidEndEditing

//        configurator.didBecomeFirstResponder = { [weak self] input in
//            self?.currentFirstResponderInput = input
//        }

        return configurator
    }()
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
    private func fetchComments() {
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
            UIAppDelegate?.hideLoadingIndicator()
        }
    }
    
    private func updatePoints() {
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
                self.updatePoints()
                Logger.info("BEFORE: \(pointsBefore) -> AFTER: \(res)")
            }
        }
    }

    // MARK: - Selectors

}




