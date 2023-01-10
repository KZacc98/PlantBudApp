// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// input type for updating data in table "RoutineStep"
public struct RoutineStep_set_input: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - careRoutineId
  ///   - completedAt
  ///   - createdAt
  ///   - description
  ///   - id
  ///   - isCompleted
  ///   - otherFrequency
  ///   - stepFrequency
  ///   - updatedAt
  public init(careRoutineId: Swift.Optional<Int?> = nil, completedAt: Swift.Optional<String?> = nil, createdAt: Swift.Optional<String?> = nil, description: Swift.Optional<String?> = nil, id: Swift.Optional<Int?> = nil, isCompleted: Swift.Optional<Bool?> = nil, otherFrequency: Swift.Optional<String?> = nil, stepFrequency: Swift.Optional<String?> = nil, updatedAt: Swift.Optional<String?> = nil) {
    graphQLMap = ["careRoutineId": careRoutineId, "completedAt": completedAt, "createdAt": createdAt, "description": description, "id": id, "isCompleted": isCompleted, "otherFrequency": otherFrequency, "stepFrequency": stepFrequency, "updatedAt": updatedAt]
  }

  public var careRoutineId: Swift.Optional<Int?> {
    get {
      return graphQLMap["careRoutineId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "careRoutineId")
    }
  }

  public var completedAt: Swift.Optional<String?> {
    get {
      return graphQLMap["completedAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "completedAt")
    }
  }

  public var createdAt: Swift.Optional<String?> {
    get {
      return graphQLMap["createdAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var description: Swift.Optional<String?> {
    get {
      return graphQLMap["description"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "description")
    }
  }

  public var id: Swift.Optional<Int?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var isCompleted: Swift.Optional<Bool?> {
    get {
      return graphQLMap["isCompleted"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isCompleted")
    }
  }

  public var otherFrequency: Swift.Optional<String?> {
    get {
      return graphQLMap["otherFrequency"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "otherFrequency")
    }
  }

  public var stepFrequency: Swift.Optional<String?> {
    get {
      return graphQLMap["stepFrequency"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "stepFrequency")
    }
  }

  public var updatedAt: Swift.Optional<String?> {
    get {
      return graphQLMap["updatedAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "updatedAt")
    }
  }
}

/// input type for inserting data into table "Plant"
public struct Plant_insert_input: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - createdAt
  ///   - id
  ///   - plantImage
  ///   - plantName
  ///   - plantPlacement
  ///   - plantState
  ///   - plantTypeId
  ///   - updatedAt
  ///   - userId
  public init(createdAt: Swift.Optional<String?> = nil, id: Swift.Optional<Int?> = nil, plantImage: Swift.Optional<String?> = nil, plantName: Swift.Optional<String?> = nil, plantPlacement: Swift.Optional<String?> = nil, plantState: Swift.Optional<String?> = nil, plantTypeId: Swift.Optional<Int?> = nil, updatedAt: Swift.Optional<String?> = nil, userId: Swift.Optional<Int?> = nil) {
    graphQLMap = ["createdAt": createdAt, "id": id, "plantImage": plantImage, "plantName": plantName, "plantPlacement": plantPlacement, "plantState": plantState, "plantTypeId": plantTypeId, "updatedAt": updatedAt, "userId": userId]
  }

  public var createdAt: Swift.Optional<String?> {
    get {
      return graphQLMap["createdAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "createdAt")
    }
  }

  public var id: Swift.Optional<Int?> {
    get {
      return graphQLMap["id"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var plantImage: Swift.Optional<String?> {
    get {
      return graphQLMap["plantImage"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "plantImage")
    }
  }

  public var plantName: Swift.Optional<String?> {
    get {
      return graphQLMap["plantName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "plantName")
    }
  }

  public var plantPlacement: Swift.Optional<String?> {
    get {
      return graphQLMap["plantPlacement"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "plantPlacement")
    }
  }

  public var plantState: Swift.Optional<String?> {
    get {
      return graphQLMap["plantState"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "plantState")
    }
  }

  public var plantTypeId: Swift.Optional<Int?> {
    get {
      return graphQLMap["plantTypeId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "plantTypeId")
    }
  }

  public var updatedAt: Swift.Optional<String?> {
    get {
      return graphQLMap["updatedAt"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "updatedAt")
    }
  }

  public var userId: Swift.Optional<Int?> {
    get {
      return graphQLMap["userId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userId")
    }
  }
}

public final class FetchBadgesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchBadges {
      Badge {
        __typename
        id
        badgeName
        points
        badgeDescription
        badgeImage
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchBadges"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Badge", type: .nonNull(.list(.nonNull(.object(Badge.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(badge: [Badge]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Badge": badge.map { (value: Badge) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Badge"
    public var badge: [Badge] {
      get {
        return (resultMap["Badge"] as! [ResultMap]).map { (value: ResultMap) -> Badge in Badge(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Badge) -> ResultMap in value.resultMap }, forKey: "Badge")
      }
    }

    public struct Badge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Badge"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("badgeName", type: .nonNull(.scalar(String.self))),
          GraphQLField("points", type: .nonNull(.scalar(Int.self))),
          GraphQLField("badgeDescription", type: .nonNull(.scalar(String.self))),
          GraphQLField("badgeImage", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, badgeName: String, points: Int, badgeDescription: String, badgeImage: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Badge", "id": id, "badgeName": badgeName, "points": points, "badgeDescription": badgeDescription, "badgeImage": badgeImage, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var badgeName: String {
        get {
          return resultMap["badgeName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "badgeName")
        }
      }

      public var points: Int {
        get {
          return resultMap["points"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "points")
        }
      }

      public var badgeDescription: String {
        get {
          return resultMap["badgeDescription"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "badgeDescription")
        }
      }

      public var badgeImage: String? {
        get {
          return resultMap["badgeImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "badgeImage")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class FetchUserBadgesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchUserBadges($userId: Int) {
      UserBadges(where: {userId: {_eq: $userId}}) {
        __typename
        userId
        badgeId
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchUserBadges"

  public var userId: Int?

  public init(userId: Int? = nil) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("UserBadges", arguments: ["where": ["userId": ["_eq": GraphQLVariable("userId")]]], type: .nonNull(.list(.nonNull(.object(UserBadge.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userBadges: [UserBadge]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "UserBadges": userBadges.map { (value: UserBadge) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "UserBadges"
    public var userBadges: [UserBadge] {
      get {
        return (resultMap["UserBadges"] as! [ResultMap]).map { (value: ResultMap) -> UserBadge in UserBadge(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: UserBadge) -> ResultMap in value.resultMap }, forKey: "UserBadges")
      }
    }

    public struct UserBadge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UserBadges"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("badgeId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: Int, badgeId: Int, createdAt: String, updatedAt: String) {
        self.init(unsafeResultMap: ["__typename": "UserBadges", "userId": userId, "badgeId": badgeId, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: Int {
        get {
          return resultMap["userId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      public var badgeId: Int {
        get {
          return resultMap["badgeId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "badgeId")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return resultMap["updatedAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class FetchCommunitiesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchCommunities {
      Community {
        __typename
        id
        communityName
        communitySmallImage
        communityBigImage
        isActive
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchCommunities"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Community", type: .nonNull(.list(.nonNull(.object(Community.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(community: [Community]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Community": community.map { (value: Community) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Community"
    public var community: [Community] {
      get {
        return (resultMap["Community"] as! [ResultMap]).map { (value: ResultMap) -> Community in Community(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Community) -> ResultMap in value.resultMap }, forKey: "Community")
      }
    }

    public struct Community: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Community"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("communityName", type: .nonNull(.scalar(String.self))),
          GraphQLField("communitySmallImage", type: .nonNull(.scalar(String.self))),
          GraphQLField("communityBigImage", type: .nonNull(.scalar(String.self))),
          GraphQLField("isActive", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, communityName: String, communitySmallImage: String, communityBigImage: String, isActive: Bool, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Community", "id": id, "communityName": communityName, "communitySmallImage": communitySmallImage, "communityBigImage": communityBigImage, "isActive": isActive, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var communityName: String {
        get {
          return resultMap["communityName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "communityName")
        }
      }

      public var communitySmallImage: String {
        get {
          return resultMap["communitySmallImage"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "communitySmallImage")
        }
      }

      public var communityBigImage: String {
        get {
          return resultMap["communityBigImage"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "communityBigImage")
        }
      }

      public var isActive: Bool {
        get {
          return resultMap["isActive"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isActive")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class FetchCommunityContentQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchCommunityContent($communityId: Int) {
      CommunityUsers(where: {communityId: {_eq: $communityId}}) {
        __typename
        userId
        createdAt
        updatedAt
      }
      Post(where: {communityId: {_eq: $communityId}}) {
        __typename
        id
        communityId
        image
        userName
        postBody
        isAnnouncement
        points
        flag
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchCommunityContent"

  public var communityId: Int?

  public init(communityId: Int? = nil) {
    self.communityId = communityId
  }

  public var variables: GraphQLMap? {
    return ["communityId": communityId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("CommunityUsers", arguments: ["where": ["communityId": ["_eq": GraphQLVariable("communityId")]]], type: .nonNull(.list(.nonNull(.object(CommunityUser.selections))))),
        GraphQLField("Post", arguments: ["where": ["communityId": ["_eq": GraphQLVariable("communityId")]]], type: .nonNull(.list(.nonNull(.object(Post.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(communityUsers: [CommunityUser], post: [Post]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "CommunityUsers": communityUsers.map { (value: CommunityUser) -> ResultMap in value.resultMap }, "Post": post.map { (value: Post) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "CommunityUsers"
    public var communityUsers: [CommunityUser] {
      get {
        return (resultMap["CommunityUsers"] as! [ResultMap]).map { (value: ResultMap) -> CommunityUser in CommunityUser(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: CommunityUser) -> ResultMap in value.resultMap }, forKey: "CommunityUsers")
      }
    }

    /// fetch data from the table: "Post"
    public var post: [Post] {
      get {
        return (resultMap["Post"] as! [ResultMap]).map { (value: ResultMap) -> Post in Post(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Post) -> ResultMap in value.resultMap }, forKey: "Post")
      }
    }

    public struct CommunityUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CommunityUsers"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userId: Int, createdAt: String, updatedAt: String) {
        self.init(unsafeResultMap: ["__typename": "CommunityUsers", "userId": userId, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userId: Int {
        get {
          return resultMap["userId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return resultMap["updatedAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Post"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("communityId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
          GraphQLField("postBody", type: .scalar(String.self)),
          GraphQLField("isAnnouncement", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("points", type: .nonNull(.scalar(Int.self))),
          GraphQLField("flag", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, communityId: Int, image: String? = nil, userName: String, postBody: String? = nil, isAnnouncement: Bool, points: Int, flag: String, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Post", "id": id, "communityId": communityId, "image": image, "userName": userName, "postBody": postBody, "isAnnouncement": isAnnouncement, "points": points, "flag": flag, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var communityId: Int {
        get {
          return resultMap["communityId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "communityId")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var userName: String {
        get {
          return resultMap["userName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userName")
        }
      }

      public var postBody: String? {
        get {
          return resultMap["postBody"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "postBody")
        }
      }

      public var isAnnouncement: Bool {
        get {
          return resultMap["isAnnouncement"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isAnnouncement")
        }
      }

      public var points: Int {
        get {
          return resultMap["points"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "points")
        }
      }

      public var flag: String {
        get {
          return resultMap["flag"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "flag")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class BatchFetchCommentsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query BatchFetchComments($postIds: [Int!]) {
      Comment(where: {postId: {_in: $postIds}}) {
        __typename
        id
        postId
        userName
        commentBody
        image
        points
        flag
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "BatchFetchComments"

  public var postIds: [Int]?

  public init(postIds: [Int]?) {
    self.postIds = postIds
  }

  public var variables: GraphQLMap? {
    return ["postIds": postIds]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Comment", arguments: ["where": ["postId": ["_in": GraphQLVariable("postIds")]]], type: .nonNull(.list(.nonNull(.object(Comment.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(comment: [Comment]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Comment": comment.map { (value: Comment) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Comment"
    public var comment: [Comment] {
      get {
        return (resultMap["Comment"] as! [ResultMap]).map { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Comment) -> ResultMap in value.resultMap }, forKey: "Comment")
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Comment"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("postId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
          GraphQLField("commentBody", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("points", type: .nonNull(.scalar(Int.self))),
          GraphQLField("flag", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, postId: Int, userName: String, commentBody: String, image: String? = nil, points: Int, flag: String, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "postId": postId, "userName": userName, "commentBody": commentBody, "image": image, "points": points, "flag": flag, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var postId: Int {
        get {
          return resultMap["postId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "postId")
        }
      }

      public var userName: String {
        get {
          return resultMap["userName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userName")
        }
      }

      public var commentBody: String {
        get {
          return resultMap["commentBody"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "commentBody")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var points: Int {
        get {
          return resultMap["points"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "points")
        }
      }

      public var flag: String {
        get {
          return resultMap["flag"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "flag")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class FetchPostCommentsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchPostComments($postId: Int) {
      Comment(where: {postId: {_eq: $postId}}) {
        __typename
        id
        postId
        userName
        commentBody
        image
        points
        flag
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchPostComments"

  public var postId: Int?

  public init(postId: Int? = nil) {
    self.postId = postId
  }

  public var variables: GraphQLMap? {
    return ["postId": postId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Comment", arguments: ["where": ["postId": ["_eq": GraphQLVariable("postId")]]], type: .nonNull(.list(.nonNull(.object(Comment.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(comment: [Comment]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Comment": comment.map { (value: Comment) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Comment"
    public var comment: [Comment] {
      get {
        return (resultMap["Comment"] as! [ResultMap]).map { (value: ResultMap) -> Comment in Comment(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Comment) -> ResultMap in value.resultMap }, forKey: "Comment")
      }
    }

    public struct Comment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Comment"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("postId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
          GraphQLField("commentBody", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("points", type: .nonNull(.scalar(Int.self))),
          GraphQLField("flag", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, postId: Int, userName: String, commentBody: String, image: String? = nil, points: Int, flag: String, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "postId": postId, "userName": userName, "commentBody": commentBody, "image": image, "points": points, "flag": flag, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var postId: Int {
        get {
          return resultMap["postId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "postId")
        }
      }

      public var userName: String {
        get {
          return resultMap["userName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userName")
        }
      }

      public var commentBody: String {
        get {
          return resultMap["commentBody"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "commentBody")
        }
      }

      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      public var points: Int {
        get {
          return resultMap["points"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "points")
        }
      }

      public var flag: String {
        get {
          return resultMap["flag"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "flag")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class FetchUserContentDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchUserContentData($userName: Int) {
      User(where: {id: {_eq: $userName}}) {
        __typename
        userName
        userType
        profilePicture
      }
    }
    """

  public let operationName: String = "FetchUserContentData"

  public var userName: Int?

  public init(userName: Int? = nil) {
    self.userName = userName
  }

  public var variables: GraphQLMap? {
    return ["userName": userName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", arguments: ["where": ["id": ["_eq": GraphQLVariable("userName")]]], type: .nonNull(.list(.nonNull(.object(User.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: [User]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "User": user.map { (value: User) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "User"
    public var user: [User] {
      get {
        return (resultMap["User"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "User")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
          GraphQLField("userType", type: .nonNull(.scalar(String.self))),
          GraphQLField("profilePicture", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userName: String, userType: String, profilePicture: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "userName": userName, "userType": userType, "profilePicture": profilePicture])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userName: String {
        get {
          return resultMap["userName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userName")
        }
      }

      public var userType: String {
        get {
          return resultMap["userType"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userType")
        }
      }

      public var profilePicture: String? {
        get {
          return resultMap["profilePicture"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePicture")
        }
      }
    }
  }
}

public final class BatchFetchUserContentDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query BatchFetchUserContentData($userIds: [Int!]) {
      User(where: {id: {_in: $userIds}}) {
        __typename
        userName
        userType
        profilePicture
      }
    }
    """

  public let operationName: String = "BatchFetchUserContentData"

  public var userIds: [Int]?

  public init(userIds: [Int]?) {
    self.userIds = userIds
  }

  public var variables: GraphQLMap? {
    return ["userIds": userIds]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", arguments: ["where": ["id": ["_in": GraphQLVariable("userIds")]]], type: .nonNull(.list(.nonNull(.object(User.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: [User]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "User": user.map { (value: User) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "User"
    public var user: [User] {
      get {
        return (resultMap["User"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "User")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
          GraphQLField("userType", type: .nonNull(.scalar(String.self))),
          GraphQLField("profilePicture", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userName: String, userType: String, profilePicture: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "userName": userName, "userType": userType, "profilePicture": profilePicture])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userName: String {
        get {
          return resultMap["userName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userName")
        }
      }

      public var userType: String {
        get {
          return resultMap["userType"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userType")
        }
      }

      public var profilePicture: String? {
        get {
          return resultMap["profilePicture"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePicture")
        }
      }
    }
  }
}

public final class FetchPlantTypesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchPlantTypes {
      PlantType {
        __typename
        id
        species
        description
        plantTypeImage
        type
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchPlantTypes"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("PlantType", type: .nonNull(.list(.nonNull(.object(PlantType.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(plantType: [PlantType]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "PlantType": plantType.map { (value: PlantType) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "PlantType"
    public var plantType: [PlantType] {
      get {
        return (resultMap["PlantType"] as! [ResultMap]).map { (value: ResultMap) -> PlantType in PlantType(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: PlantType) -> ResultMap in value.resultMap }, forKey: "PlantType")
      }
    }

    public struct PlantType: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PlantType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("species", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("plantTypeImage", type: .scalar(String.self)),
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, species: String? = nil, description: String? = nil, plantTypeImage: String? = nil, type: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "PlantType", "id": id, "species": species, "description": description, "plantTypeImage": plantTypeImage, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var species: String? {
        get {
          return resultMap["species"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "species")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var plantTypeImage: String? {
        get {
          return resultMap["plantTypeImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantTypeImage")
        }
      }

      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class FetchUserPlantsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchUserPlants($userId: Int) {
      Plant(where: {userId: {_eq: $userId}}) {
        __typename
        id
        plantName
        plantState
        plantPlacement
        plantImage
        plantTypeId
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchUserPlants"

  public var userId: Int?

  public init(userId: Int? = nil) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Plant", arguments: ["where": ["userId": ["_eq": GraphQLVariable("userId")]]], type: .nonNull(.list(.nonNull(.object(Plant.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(plant: [Plant]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Plant": plant.map { (value: Plant) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Plant"
    public var plant: [Plant] {
      get {
        return (resultMap["Plant"] as! [ResultMap]).map { (value: ResultMap) -> Plant in Plant(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Plant) -> ResultMap in value.resultMap }, forKey: "Plant")
      }
    }

    public struct Plant: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Plant"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("plantName", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantState", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantPlacement", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantImage", type: .scalar(String.self)),
          GraphQLField("plantTypeId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, plantName: String, plantState: String, plantPlacement: String, plantImage: String? = nil, plantTypeId: Int, createdAt: String, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Plant", "id": id, "plantName": plantName, "plantState": plantState, "plantPlacement": plantPlacement, "plantImage": plantImage, "plantTypeId": plantTypeId, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var plantName: String {
        get {
          return resultMap["plantName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantName")
        }
      }

      public var plantState: String {
        get {
          return resultMap["plantState"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantState")
        }
      }

      public var plantPlacement: String {
        get {
          return resultMap["plantPlacement"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantPlacement")
        }
      }

      public var plantImage: String? {
        get {
          return resultMap["plantImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantImage")
        }
      }

      public var plantTypeId: Int {
        get {
          return resultMap["plantTypeId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantTypeId")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class FetchPlantQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchPlant($plantId: Int) {
      Plant(where: {id: {_eq: $plantId}}) {
        __typename
        id
        plantName
        plantState
        plantPlacement
        plantImage
        plantTypeId
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchPlant"

  public var plantId: Int?

  public init(plantId: Int? = nil) {
    self.plantId = plantId
  }

  public var variables: GraphQLMap? {
    return ["plantId": plantId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Plant", arguments: ["where": ["id": ["_eq": GraphQLVariable("plantId")]]], type: .nonNull(.list(.nonNull(.object(Plant.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(plant: [Plant]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Plant": plant.map { (value: Plant) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Plant"
    public var plant: [Plant] {
      get {
        return (resultMap["Plant"] as! [ResultMap]).map { (value: ResultMap) -> Plant in Plant(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Plant) -> ResultMap in value.resultMap }, forKey: "Plant")
      }
    }

    public struct Plant: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Plant"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("plantName", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantState", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantPlacement", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantImage", type: .scalar(String.self)),
          GraphQLField("plantTypeId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, plantName: String, plantState: String, plantPlacement: String, plantImage: String? = nil, plantTypeId: Int, createdAt: String, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Plant", "id": id, "plantName": plantName, "plantState": plantState, "plantPlacement": plantPlacement, "plantImage": plantImage, "plantTypeId": plantTypeId, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var plantName: String {
        get {
          return resultMap["plantName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantName")
        }
      }

      public var plantState: String {
        get {
          return resultMap["plantState"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantState")
        }
      }

      public var plantPlacement: String {
        get {
          return resultMap["plantPlacement"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantPlacement")
        }
      }

      public var plantImage: String? {
        get {
          return resultMap["plantImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantImage")
        }
      }

      public var plantTypeId: Int {
        get {
          return resultMap["plantTypeId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantTypeId")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class FetchPlantCareRoutineQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchPlantCareRoutine($plantId: Int) {
      CareRoutine(where: {plantId: {_eq: $plantId}}) {
        __typename
        id
        plantId
        isActive
        isCompleted
        isShared
        flag
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchPlantCareRoutine"

  public var plantId: Int?

  public init(plantId: Int? = nil) {
    self.plantId = plantId
  }

  public var variables: GraphQLMap? {
    return ["plantId": plantId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("CareRoutine", arguments: ["where": ["plantId": ["_eq": GraphQLVariable("plantId")]]], type: .nonNull(.list(.nonNull(.object(CareRoutine.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(careRoutine: [CareRoutine]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "CareRoutine": careRoutine.map { (value: CareRoutine) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "CareRoutine"
    public var careRoutine: [CareRoutine] {
      get {
        return (resultMap["CareRoutine"] as! [ResultMap]).map { (value: ResultMap) -> CareRoutine in CareRoutine(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: CareRoutine) -> ResultMap in value.resultMap }, forKey: "CareRoutine")
      }
    }

    public struct CareRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CareRoutine"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("plantId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("isActive", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("isCompleted", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("isShared", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("flag", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, plantId: Int, isActive: Bool, isCompleted: Bool, isShared: Bool, flag: String, createdAt: String, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "CareRoutine", "id": id, "plantId": plantId, "isActive": isActive, "isCompleted": isCompleted, "isShared": isShared, "flag": flag, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var plantId: Int {
        get {
          return resultMap["plantId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantId")
        }
      }

      public var isActive: Bool {
        get {
          return resultMap["isActive"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isActive")
        }
      }

      public var isCompleted: Bool {
        get {
          return resultMap["isCompleted"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isCompleted")
        }
      }

      public var isShared: Bool {
        get {
          return resultMap["isShared"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isShared")
        }
      }

      public var flag: String {
        get {
          return resultMap["flag"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "flag")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class FetchCareRoutineStepsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchCareRoutineSteps($careRoutineId: Int) {
      RoutineStep(where: {careRoutineId: {_eq: $careRoutineId}}) {
        __typename
        id
        careRoutineId
        stepFrequency
        otherFrequency
        description
        isCompleted
        completedAt
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchCareRoutineSteps"

  public var careRoutineId: Int?

  public init(careRoutineId: Int? = nil) {
    self.careRoutineId = careRoutineId
  }

  public var variables: GraphQLMap? {
    return ["careRoutineId": careRoutineId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("RoutineStep", arguments: ["where": ["careRoutineId": ["_eq": GraphQLVariable("careRoutineId")]]], type: .nonNull(.list(.nonNull(.object(RoutineStep.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(routineStep: [RoutineStep]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "RoutineStep": routineStep.map { (value: RoutineStep) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "RoutineStep"
    public var routineStep: [RoutineStep] {
      get {
        return (resultMap["RoutineStep"] as! [ResultMap]).map { (value: ResultMap) -> RoutineStep in RoutineStep(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: RoutineStep) -> ResultMap in value.resultMap }, forKey: "RoutineStep")
      }
    }

    public struct RoutineStep: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RoutineStep"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("careRoutineId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("stepFrequency", type: .nonNull(.scalar(String.self))),
          GraphQLField("otherFrequency", type: .scalar(String.self)),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("isCompleted", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("completedAt", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, careRoutineId: Int, stepFrequency: String, otherFrequency: String? = nil, description: String? = nil, isCompleted: Bool, completedAt: String? = nil, createdAt: String, updatedAt: String) {
        self.init(unsafeResultMap: ["__typename": "RoutineStep", "id": id, "careRoutineId": careRoutineId, "stepFrequency": stepFrequency, "otherFrequency": otherFrequency, "description": description, "isCompleted": isCompleted, "completedAt": completedAt, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var careRoutineId: Int {
        get {
          return resultMap["careRoutineId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "careRoutineId")
        }
      }

      public var stepFrequency: String {
        get {
          return resultMap["stepFrequency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "stepFrequency")
        }
      }

      public var otherFrequency: String? {
        get {
          return resultMap["otherFrequency"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "otherFrequency")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var isCompleted: Bool {
        get {
          return resultMap["isCompleted"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isCompleted")
        }
      }

      public var completedAt: String? {
        get {
          return resultMap["completedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "completedAt")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return resultMap["updatedAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class CareRoutineStepUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CareRoutineStepUpdate($stepId: Int, $_set: RoutineStep_set_input) {
      update_RoutineStep(where: {id: {_eq: $stepId}}, _set: $_set) {
        __typename
        returning {
          __typename
          id
          careRoutineId
          isCompleted
          stepFrequency
          otherFrequency
          description
          completedAt
          createdAt
          updatedAt
        }
      }
    }
    """

  public let operationName: String = "CareRoutineStepUpdate"

  public var stepId: Int?
  public var _set: RoutineStep_set_input?

  public init(stepId: Int? = nil, _set: RoutineStep_set_input? = nil) {
    self.stepId = stepId
    self._set = _set
  }

  public var variables: GraphQLMap? {
    return ["stepId": stepId, "_set": _set]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_RoutineStep", arguments: ["where": ["id": ["_eq": GraphQLVariable("stepId")]], "_set": GraphQLVariable("_set")], type: .object(UpdateRoutineStep.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateRoutineStep: UpdateRoutineStep? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "update_RoutineStep": updateRoutineStep.flatMap { (value: UpdateRoutineStep) -> ResultMap in value.resultMap }])
    }

    /// update data of the table: "RoutineStep"
    public var updateRoutineStep: UpdateRoutineStep? {
      get {
        return (resultMap["update_RoutineStep"] as? ResultMap).flatMap { UpdateRoutineStep(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "update_RoutineStep")
      }
    }

    public struct UpdateRoutineStep: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RoutineStep_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("returning", type: .nonNull(.list(.nonNull(.object(Returning.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(returning: [Returning]) {
        self.init(unsafeResultMap: ["__typename": "RoutineStep_mutation_response", "returning": returning.map { (value: Returning) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// data from the rows affected by the mutation
      public var returning: [Returning] {
        get {
          return (resultMap["returning"] as! [ResultMap]).map { (value: ResultMap) -> Returning in Returning(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Returning) -> ResultMap in value.resultMap }, forKey: "returning")
        }
      }

      public struct Returning: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RoutineStep"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("careRoutineId", type: .nonNull(.scalar(Int.self))),
            GraphQLField("isCompleted", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("stepFrequency", type: .nonNull(.scalar(String.self))),
            GraphQLField("otherFrequency", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("completedAt", type: .scalar(String.self)),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, careRoutineId: Int, isCompleted: Bool, stepFrequency: String, otherFrequency: String? = nil, description: String? = nil, completedAt: String? = nil, createdAt: String, updatedAt: String) {
          self.init(unsafeResultMap: ["__typename": "RoutineStep", "id": id, "careRoutineId": careRoutineId, "isCompleted": isCompleted, "stepFrequency": stepFrequency, "otherFrequency": otherFrequency, "description": description, "completedAt": completedAt, "createdAt": createdAt, "updatedAt": updatedAt])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var careRoutineId: Int {
          get {
            return resultMap["careRoutineId"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "careRoutineId")
          }
        }

        public var isCompleted: Bool {
          get {
            return resultMap["isCompleted"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "isCompleted")
          }
        }

        public var stepFrequency: String {
          get {
            return resultMap["stepFrequency"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "stepFrequency")
          }
        }

        public var otherFrequency: String? {
          get {
            return resultMap["otherFrequency"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "otherFrequency")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var completedAt: String? {
          get {
            return resultMap["completedAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "completedAt")
          }
        }

        public var createdAt: String {
          get {
            return resultMap["createdAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return resultMap["updatedAt"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "updatedAt")
          }
        }
      }
    }
  }
}

public final class AddPlantMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddPlant($object: Plant_insert_input!) {
      insert_Plant_one(object: $object) {
        __typename
        plantName
        plantTypeId
        plantImage
        userId
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "AddPlant"

  public var object: Plant_insert_input

  public init(object: Plant_insert_input) {
    self.object = object
  }

  public var variables: GraphQLMap? {
    return ["object": object]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_Plant_one", arguments: ["object": GraphQLVariable("object")], type: .object(InsertPlantOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertPlantOne: InsertPlantOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_Plant_one": insertPlantOne.flatMap { (value: InsertPlantOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "Plant"
    public var insertPlantOne: InsertPlantOne? {
      get {
        return (resultMap["insert_Plant_one"] as? ResultMap).flatMap { InsertPlantOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_Plant_one")
      }
    }

    public struct InsertPlantOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Plant"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantName", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantTypeId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("plantImage", type: .scalar(String.self)),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(plantName: String, plantTypeId: Int, plantImage: String? = nil, userId: Int, createdAt: String, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Plant", "plantName": plantName, "plantTypeId": plantTypeId, "plantImage": plantImage, "userId": userId, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var plantName: String {
        get {
          return resultMap["plantName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantName")
        }
      }

      public var plantTypeId: Int {
        get {
          return resultMap["plantTypeId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantTypeId")
        }
      }

      public var plantImage: String? {
        get {
          return resultMap["plantImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantImage")
        }
      }

      public var userId: Int {
        get {
          return resultMap["userId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "userId")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class DeletePlantMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeletePlant($_eq: Int) {
      delete_Plant(where: {id: {_eq: $_eq}}) {
        __typename
        returning {
          __typename
          id
          plantName
        }
      }
    }
    """

  public let operationName: String = "DeletePlant"

  public var _eq: Int?

  public init(_eq: Int? = nil) {
    self._eq = _eq
  }

  public var variables: GraphQLMap? {
    return ["_eq": _eq]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("delete_Plant", arguments: ["where": ["id": ["_eq": GraphQLVariable("_eq")]]], type: .object(DeletePlant.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deletePlant: DeletePlant? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "delete_Plant": deletePlant.flatMap { (value: DeletePlant) -> ResultMap in value.resultMap }])
    }

    /// delete data from the table: "Plant"
    public var deletePlant: DeletePlant? {
      get {
        return (resultMap["delete_Plant"] as? ResultMap).flatMap { DeletePlant(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete_Plant")
      }
    }

    public struct DeletePlant: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Plant_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("returning", type: .nonNull(.list(.nonNull(.object(Returning.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(returning: [Returning]) {
        self.init(unsafeResultMap: ["__typename": "Plant_mutation_response", "returning": returning.map { (value: Returning) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// data from the rows affected by the mutation
      public var returning: [Returning] {
        get {
          return (resultMap["returning"] as! [ResultMap]).map { (value: ResultMap) -> Returning in Returning(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Returning) -> ResultMap in value.resultMap }, forKey: "returning")
        }
      }

      public struct Returning: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Plant"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("plantName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, plantName: String) {
          self.init(unsafeResultMap: ["__typename": "Plant", "id": id, "plantName": plantName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: Int {
          get {
            return resultMap["id"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var plantName: String {
          get {
            return resultMap["plantName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "plantName")
          }
        }
      }
    }
  }
}

public final class FetchUserProfileQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchUserProfile($userId: Int) {
      User(where: {id: {_eq: $userId}}) {
        __typename
        id
        name
        userName
        profilePicture
        email
        gender
        phoneNumber
        points
        active
        userType
        createdAt
        updatedAt
      }
      Plant(where: {userId: {_eq: $userId}}) {
        __typename
        id
        plantName
        plantState
        plantPlacement
        plantImage
        plantTypeId
        createdAt
        updatedAt
      }
      UserBadges(where: {userId: {_eq: $userId}}) {
        __typename
        badgeId
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "FetchUserProfile"

  public var userId: Int?

  public init(userId: Int? = nil) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", arguments: ["where": ["id": ["_eq": GraphQLVariable("userId")]]], type: .nonNull(.list(.nonNull(.object(User.selections))))),
        GraphQLField("Plant", arguments: ["where": ["userId": ["_eq": GraphQLVariable("userId")]]], type: .nonNull(.list(.nonNull(.object(Plant.selections))))),
        GraphQLField("UserBadges", arguments: ["where": ["userId": ["_eq": GraphQLVariable("userId")]]], type: .nonNull(.list(.nonNull(.object(UserBadge.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: [User], plant: [Plant], userBadges: [UserBadge]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "User": user.map { (value: User) -> ResultMap in value.resultMap }, "Plant": plant.map { (value: Plant) -> ResultMap in value.resultMap }, "UserBadges": userBadges.map { (value: UserBadge) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "User"
    public var user: [User] {
      get {
        return (resultMap["User"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "User")
      }
    }

    /// fetch data from the table: "Plant"
    public var plant: [Plant] {
      get {
        return (resultMap["Plant"] as! [ResultMap]).map { (value: ResultMap) -> Plant in Plant(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Plant) -> ResultMap in value.resultMap }, forKey: "Plant")
      }
    }

    /// fetch data from the table: "UserBadges"
    public var userBadges: [UserBadge] {
      get {
        return (resultMap["UserBadges"] as! [ResultMap]).map { (value: ResultMap) -> UserBadge in UserBadge(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: UserBadge) -> ResultMap in value.resultMap }, forKey: "UserBadges")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
          GraphQLField("profilePicture", type: .scalar(String.self)),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("gender", type: .nonNull(.scalar(String.self))),
          GraphQLField("phoneNumber", type: .scalar(String.self)),
          GraphQLField("points", type: .nonNull(.scalar(Int.self))),
          GraphQLField("active", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("userType", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, userName: String, profilePicture: String? = nil, email: String, gender: String, phoneNumber: String? = nil, points: Int, active: Bool, userType: String, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "userName": userName, "profilePicture": profilePicture, "email": email, "gender": gender, "phoneNumber": phoneNumber, "points": points, "active": active, "userType": userType, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var userName: String {
        get {
          return resultMap["userName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userName")
        }
      }

      public var profilePicture: String? {
        get {
          return resultMap["profilePicture"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "profilePicture")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var gender: String {
        get {
          return resultMap["gender"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var phoneNumber: String? {
        get {
          return resultMap["phoneNumber"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "phoneNumber")
        }
      }

      public var points: Int {
        get {
          return resultMap["points"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "points")
        }
      }

      public var active: Bool {
        get {
          return resultMap["active"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "active")
        }
      }

      public var userType: String {
        get {
          return resultMap["userType"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userType")
        }
      }

      public var createdAt: String? {
        get {
          return resultMap["createdAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }

    public struct Plant: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Plant"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("plantName", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantState", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantPlacement", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantImage", type: .scalar(String.self)),
          GraphQLField("plantTypeId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, plantName: String, plantState: String, plantPlacement: String, plantImage: String? = nil, plantTypeId: Int, createdAt: String, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Plant", "id": id, "plantName": plantName, "plantState": plantState, "plantPlacement": plantPlacement, "plantImage": plantImage, "plantTypeId": plantTypeId, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var plantName: String {
        get {
          return resultMap["plantName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantName")
        }
      }

      public var plantState: String {
        get {
          return resultMap["plantState"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantState")
        }
      }

      public var plantPlacement: String {
        get {
          return resultMap["plantPlacement"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantPlacement")
        }
      }

      public var plantImage: String? {
        get {
          return resultMap["plantImage"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantImage")
        }
      }

      public var plantTypeId: Int {
        get {
          return resultMap["plantTypeId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "plantTypeId")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String? {
        get {
          return resultMap["updatedAt"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }

    public struct UserBadge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UserBadges"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("badgeId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(badgeId: Int, createdAt: String, updatedAt: String) {
        self.init(unsafeResultMap: ["__typename": "UserBadges", "badgeId": badgeId, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var badgeId: Int {
        get {
          return resultMap["badgeId"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "badgeId")
        }
      }

      public var createdAt: String {
        get {
          return resultMap["createdAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return resultMap["updatedAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "updatedAt")
        }
      }
    }
  }
}

public final class FetchUserPointsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchUserPoints($_in: [Int!]) {
      Badge(where: {id: {_in: $_in}}) {
        __typename
        points
      }
    }
    """

  public let operationName: String = "FetchUserPoints"

  public var _in: [Int]?

  public init(_in: [Int]?) {
    self._in = _in
  }

  public var variables: GraphQLMap? {
    return ["_in": _in]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Badge", arguments: ["where": ["id": ["_in": GraphQLVariable("_in")]]], type: .nonNull(.list(.nonNull(.object(Badge.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(badge: [Badge]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Badge": badge.map { (value: Badge) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Badge"
    public var badge: [Badge] {
      get {
        return (resultMap["Badge"] as! [ResultMap]).map { (value: ResultMap) -> Badge in Badge(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Badge) -> ResultMap in value.resultMap }, forKey: "Badge")
      }
    }

    public struct Badge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Badge"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("points", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(points: Int) {
        self.init(unsafeResultMap: ["__typename": "Badge", "points": points])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var points: Int {
        get {
          return resultMap["points"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "points")
        }
      }
    }
  }
}

public final class FetchUserByUsernameQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query fetchUserByUsername($userName: String) {
      User(where: {userName: {_eq: $userName}}) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "fetchUserByUsername"

  public var userName: String?

  public init(userName: String? = nil) {
    self.userName = userName
  }

  public var variables: GraphQLMap? {
    return ["userName": userName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", arguments: ["where": ["userName": ["_eq": GraphQLVariable("userName")]]], type: .nonNull(.list(.nonNull(.object(User.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: [User]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "User": user.map { (value: User) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "User"
    public var user: [User] {
      get {
        return (resultMap["User"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "User")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class UserListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query UserList {
      User {
        __typename
        id
        name
      }
    }
    """

  public let operationName: String = "UserList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", type: .nonNull(.list(.nonNull(.object(User.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: [User]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "User": user.map { (value: User) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "User"
    public var user: [User] {
      get {
        return (resultMap["User"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "User")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class FetchUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchUser($email: String, $password: String) {
      User(where: {email: {_eq: $email}, password: {_eq: $password}}) {
        __typename
        id
        name
      }
    }
    """

  public let operationName: String = "FetchUser"

  public var email: String?
  public var password: String?

  public init(email: String? = nil, password: String? = nil) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", arguments: ["where": ["email": ["_eq": GraphQLVariable("email")], "password": ["_eq": GraphQLVariable("password")]]], type: .nonNull(.list(.nonNull(.object(User.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: [User]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "User": user.map { (value: User) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "User"
    public var user: [User] {
      get {
        return (resultMap["User"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "User")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}
