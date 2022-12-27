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
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, badgeName: String, points: Int, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Badge", "id": id, "badgeName": badgeName, "points": points, "createdAt": createdAt, "updatedAt": updatedAt])
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
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("updatedAt", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, species: String? = nil, description: String? = nil, type: String? = nil, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "PlantType", "id": id, "species": species, "description": description, "type": type, "createdAt": createdAt, "updatedAt": updatedAt])
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

      public init(id: Int, name: String, userName: String, email: String, gender: String, phoneNumber: String? = nil, points: Int, active: Bool, userType: String, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "userName": userName, "email": email, "gender": gender, "phoneNumber": phoneNumber, "points": points, "active": active, "userType": userType, "createdAt": createdAt, "updatedAt": updatedAt])
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
