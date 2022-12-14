// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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
