// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// input type for inserting data into table "RoutineStep"
public struct RoutineStep_insert_input: GraphQLMapConvertible {
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

/// input type for inserting data into table "CommunityUsers"
public struct CommunityUsers_insert_input: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - communityId
  ///   - createdAt
  ///   - updatedAt
  ///   - userId
  public init(communityId: Swift.Optional<Int?> = nil, createdAt: Swift.Optional<String?> = nil, updatedAt: Swift.Optional<String?> = nil, userId: Swift.Optional<Int?> = nil) {
    graphQLMap = ["communityId": communityId, "createdAt": createdAt, "updatedAt": updatedAt, "userId": userId]
  }

  public var communityId: Swift.Optional<Int?> {
    get {
      return graphQLMap["communityId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "communityId")
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

/// input type for inserting data into table "Comment"
public struct Comment_insert_input: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - commentBody
  ///   - createdAt
  ///   - flag
  ///   - id
  ///   - image
  ///   - points
  ///   - postId
  ///   - updatedAt
  ///   - userName
  public init(commentBody: Swift.Optional<String?> = nil, createdAt: Swift.Optional<String?> = nil, flag: Swift.Optional<String?> = nil, id: Swift.Optional<Int?> = nil, image: Swift.Optional<String?> = nil, points: Swift.Optional<Int?> = nil, postId: Swift.Optional<Int?> = nil, updatedAt: Swift.Optional<String?> = nil, userName: Swift.Optional<String?> = nil) {
    graphQLMap = ["commentBody": commentBody, "createdAt": createdAt, "flag": flag, "id": id, "image": image, "points": points, "postId": postId, "updatedAt": updatedAt, "userName": userName]
  }

  public var commentBody: Swift.Optional<String?> {
    get {
      return graphQLMap["commentBody"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "commentBody")
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

  public var flag: Swift.Optional<String?> {
    get {
      return graphQLMap["flag"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "flag")
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

  public var image: Swift.Optional<String?> {
    get {
      return graphQLMap["image"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var points: Swift.Optional<Int?> {
    get {
      return graphQLMap["points"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var postId: Swift.Optional<Int?> {
    get {
      return graphQLMap["postId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "postId")
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

  public var userName: Swift.Optional<String?> {
    get {
      return graphQLMap["userName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userName")
    }
  }
}

/// input type for inserting data into table "Post"
public struct Post_insert_input: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - communityId
  ///   - createdAt
  ///   - flag
  ///   - id
  ///   - image
  ///   - isAnnouncement
  ///   - points
  ///   - postBody
  ///   - updatedAt
  ///   - userName
  public init(communityId: Swift.Optional<Int?> = nil, createdAt: Swift.Optional<String?> = nil, flag: Swift.Optional<String?> = nil, id: Swift.Optional<Int?> = nil, image: Swift.Optional<String?> = nil, isAnnouncement: Swift.Optional<Bool?> = nil, points: Swift.Optional<Int?> = nil, postBody: Swift.Optional<String?> = nil, updatedAt: Swift.Optional<String?> = nil, userName: Swift.Optional<String?> = nil) {
    graphQLMap = ["communityId": communityId, "createdAt": createdAt, "flag": flag, "id": id, "image": image, "isAnnouncement": isAnnouncement, "points": points, "postBody": postBody, "updatedAt": updatedAt, "userName": userName]
  }

  public var communityId: Swift.Optional<Int?> {
    get {
      return graphQLMap["communityId"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "communityId")
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

  public var flag: Swift.Optional<String?> {
    get {
      return graphQLMap["flag"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "flag")
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

  public var image: Swift.Optional<String?> {
    get {
      return graphQLMap["image"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "image")
    }
  }

  public var isAnnouncement: Swift.Optional<Bool?> {
    get {
      return graphQLMap["isAnnouncement"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "isAnnouncement")
    }
  }

  public var points: Swift.Optional<Int?> {
    get {
      return graphQLMap["points"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var postBody: Swift.Optional<String?> {
    get {
      return graphQLMap["postBody"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "postBody")
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

  public var userName: Swift.Optional<String?> {
    get {
      return graphQLMap["userName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userName")
    }
  }
}

/// Boolean expression to compare columns of type "Int". All fields are combined with logical 'AND'.
public struct Int_comparison_exp: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - _eq
  ///   - _gt
  ///   - _gte
  ///   - _in
  ///   - _isNull
  ///   - _lt
  ///   - _lte
  ///   - _neq
  ///   - _nin
  public init(_eq: Swift.Optional<Int?> = nil, _gt: Swift.Optional<Int?> = nil, _gte: Swift.Optional<Int?> = nil, _in: Swift.Optional<[Int]?> = nil, _isNull: Swift.Optional<Bool?> = nil, _lt: Swift.Optional<Int?> = nil, _lte: Swift.Optional<Int?> = nil, _neq: Swift.Optional<Int?> = nil, _nin: Swift.Optional<[Int]?> = nil) {
    graphQLMap = ["_eq": _eq, "_gt": _gt, "_gte": _gte, "_in": _in, "_is_null": _isNull, "_lt": _lt, "_lte": _lte, "_neq": _neq, "_nin": _nin]
  }

  public var _eq: Swift.Optional<Int?> {
    get {
      return graphQLMap["_eq"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_eq")
    }
  }

  public var _gt: Swift.Optional<Int?> {
    get {
      return graphQLMap["_gt"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_gt")
    }
  }

  public var _gte: Swift.Optional<Int?> {
    get {
      return graphQLMap["_gte"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_gte")
    }
  }

  public var _in: Swift.Optional<[Int]?> {
    get {
      return graphQLMap["_in"] as? Swift.Optional<[Int]?> ?? Swift.Optional<[Int]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_in")
    }
  }

  public var _isNull: Swift.Optional<Bool?> {
    get {
      return graphQLMap["_is_null"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_is_null")
    }
  }

  public var _lt: Swift.Optional<Int?> {
    get {
      return graphQLMap["_lt"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_lt")
    }
  }

  public var _lte: Swift.Optional<Int?> {
    get {
      return graphQLMap["_lte"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_lte")
    }
  }

  public var _neq: Swift.Optional<Int?> {
    get {
      return graphQLMap["_neq"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_neq")
    }
  }

  public var _nin: Swift.Optional<[Int]?> {
    get {
      return graphQLMap["_nin"] as? Swift.Optional<[Int]?> ?? Swift.Optional<[Int]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "_nin")
    }
  }
}

/// input type for inserting data into table "User"
public struct User_insert_input: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - active
  ///   - createdAt
  ///   - email
  ///   - gender
  ///   - id
  ///   - name
  ///   - password
  ///   - phoneNumber
  ///   - points
  ///   - profilePicture
  ///   - updatedAt
  ///   - userName
  ///   - userType
  public init(active: Swift.Optional<Bool?> = nil, createdAt: Swift.Optional<String?> = nil, email: Swift.Optional<String?> = nil, gender: Swift.Optional<String?> = nil, id: Swift.Optional<Int?> = nil, name: Swift.Optional<String?> = nil, password: Swift.Optional<String?> = nil, phoneNumber: Swift.Optional<String?> = nil, points: Swift.Optional<Int?> = nil, profilePicture: Swift.Optional<String?> = nil, updatedAt: Swift.Optional<String?> = nil, userName: Swift.Optional<String?> = nil, userType: Swift.Optional<String?> = nil) {
    graphQLMap = ["active": active, "createdAt": createdAt, "email": email, "gender": gender, "id": id, "name": name, "password": password, "phoneNumber": phoneNumber, "points": points, "profilePicture": profilePicture, "updatedAt": updatedAt, "userName": userName, "userType": userType]
  }

  public var active: Swift.Optional<Bool?> {
    get {
      return graphQLMap["active"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "active")
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

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var gender: Swift.Optional<String?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
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

  public var name: Swift.Optional<String?> {
    get {
      return graphQLMap["name"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var password: Swift.Optional<String?> {
    get {
      return graphQLMap["password"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  public var phoneNumber: Swift.Optional<String?> {
    get {
      return graphQLMap["phoneNumber"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phoneNumber")
    }
  }

  public var points: Swift.Optional<Int?> {
    get {
      return graphQLMap["points"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var profilePicture: Swift.Optional<String?> {
    get {
      return graphQLMap["profilePicture"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "profilePicture")
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

  public var userName: Swift.Optional<String?> {
    get {
      return graphQLMap["userName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userName")
    }
  }

  public var userType: Swift.Optional<String?> {
    get {
      return graphQLMap["userType"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userType")
    }
  }
}

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

public final class CreateCareRoutineMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateCareRoutine($plantId: Int!) {
      insert_CareRoutine_one(object: {plantId: $plantId}) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "CreateCareRoutine"

  public var plantId: Int

  public init(plantId: Int) {
    self.plantId = plantId
  }

  public var variables: GraphQLMap? {
    return ["plantId": plantId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_CareRoutine_one", arguments: ["object": ["plantId": GraphQLVariable("plantId")]], type: .object(InsertCareRoutineOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertCareRoutineOne: InsertCareRoutineOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_CareRoutine_one": insertCareRoutineOne.flatMap { (value: InsertCareRoutineOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "CareRoutine"
    public var insertCareRoutineOne: InsertCareRoutineOne? {
      get {
        return (resultMap["insert_CareRoutine_one"] as? ResultMap).flatMap { InsertCareRoutineOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_CareRoutine_one")
      }
    }

    public struct InsertCareRoutineOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CareRoutine"]

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
        self.init(unsafeResultMap: ["__typename": "CareRoutine", "id": id])
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

public final class AddRoutineStepMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddRoutineStep($input: RoutineStep_insert_input!) {
      insert_RoutineStep_one(object: $input) {
        __typename
        stepFrequency
        description
      }
    }
    """

  public let operationName: String = "AddRoutineStep"

  public var input: RoutineStep_insert_input

  public init(input: RoutineStep_insert_input) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_RoutineStep_one", arguments: ["object": GraphQLVariable("input")], type: .object(InsertRoutineStepOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertRoutineStepOne: InsertRoutineStepOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_RoutineStep_one": insertRoutineStepOne.flatMap { (value: InsertRoutineStepOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "RoutineStep"
    public var insertRoutineStepOne: InsertRoutineStepOne? {
      get {
        return (resultMap["insert_RoutineStep_one"] as? ResultMap).flatMap { InsertRoutineStepOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_RoutineStep_one")
      }
    }

    public struct InsertRoutineStepOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RoutineStep"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("stepFrequency", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(stepFrequency: String, description: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "RoutineStep", "stepFrequency": stepFrequency, "description": description])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }
    }
  }
}

public final class FetchPlantCareRoutineIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query fetchPlantCareRoutineId($plantId: Int!) {
      CareRoutine(where: {plantId: {_eq: $plantId}}) {
        __typename
        id
        plantId
      }
    }
    """

  public let operationName: String = "fetchPlantCareRoutineId"

  public var plantId: Int

  public init(plantId: Int) {
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
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, plantId: Int) {
        self.init(unsafeResultMap: ["__typename": "CareRoutine", "id": id, "plantId": plantId])
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
    }
  }
}

public final class UpdateRoutineStepStatusMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateRoutineStepStatus($_in: [Int!], $isCompleted: Boolean!) {
      update_RoutineStep(where: {id: {_in: $_in}}, _set: {isCompleted: $isCompleted}) {
        __typename
        returning {
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
    }
    """

  public let operationName: String = "UpdateRoutineStepStatus"

  public var _in: [Int]?
  public var isCompleted: Bool

  public init(_in: [Int]?, isCompleted: Bool) {
    self._in = _in
    self.isCompleted = isCompleted
  }

  public var variables: GraphQLMap? {
    return ["_in": _in, "isCompleted": isCompleted]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_RoutineStep", arguments: ["where": ["id": ["_in": GraphQLVariable("_in")]], "_set": ["isCompleted": GraphQLVariable("isCompleted")]], type: .object(UpdateRoutineStep.selections)),
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
            GraphQLField("stepFrequency", type: .nonNull(.scalar(String.self))),
            GraphQLField("otherFrequency", type: .scalar(String.self)),
            GraphQLField("description", type: .scalar(String.self)),
            GraphQLField("isCompleted", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("completedAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, careRoutineId: Int, stepFrequency: String, otherFrequency: String? = nil, description: String? = nil, isCompleted: Bool, completedAt: String, createdAt: String, updatedAt: String) {
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

        public var completedAt: String {
          get {
            return resultMap["completedAt"]! as! String
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

public final class FetchCommunitiesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchCommunities {
      Community {
        __typename
        id
        communityName
        communityDescription
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
          GraphQLField("communityDescription", type: .nonNull(.scalar(String.self))),
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

      public init(id: Int, communityName: String, communityDescription: String, communitySmallImage: String, communityBigImage: String, isActive: Bool, createdAt: String? = nil, updatedAt: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Community", "id": id, "communityName": communityName, "communityDescription": communityDescription, "communitySmallImage": communitySmallImage, "communityBigImage": communityBigImage, "isActive": isActive, "createdAt": createdAt, "updatedAt": updatedAt])
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

      public var communityDescription: String {
        get {
          return resultMap["communityDescription"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "communityDescription")
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

public final class FetchUserCommunitiesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchUserCommunities($userId: Int!) {
      CommunityUsers(where: {userId: {_eq: $userId}}) {
        __typename
        communityId
      }
    }
    """

  public let operationName: String = "FetchUserCommunities"

  public var userId: Int

  public init(userId: Int) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("CommunityUsers", arguments: ["where": ["userId": ["_eq": GraphQLVariable("userId")]]], type: .nonNull(.list(.nonNull(.object(CommunityUser.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(communityUsers: [CommunityUser]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "CommunityUsers": communityUsers.map { (value: CommunityUser) -> ResultMap in value.resultMap }])
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

    public struct CommunityUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CommunityUsers"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("communityId", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(communityId: Int) {
        self.init(unsafeResultMap: ["__typename": "CommunityUsers", "communityId": communityId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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
    }
  }
}

public final class JoinCommunityMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation JoinCommunity($joinComunityInput: CommunityUsers_insert_input!) {
      insert_CommunityUsers_one(object: $joinComunityInput) {
        __typename
        communityId
        userId
        createdAt
        updatedAt
      }
    }
    """

  public let operationName: String = "JoinCommunity"

  public var joinComunityInput: CommunityUsers_insert_input

  public init(joinComunityInput: CommunityUsers_insert_input) {
    self.joinComunityInput = joinComunityInput
  }

  public var variables: GraphQLMap? {
    return ["joinComunityInput": joinComunityInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_CommunityUsers_one", arguments: ["object": GraphQLVariable("joinComunityInput")], type: .object(InsertCommunityUsersOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertCommunityUsersOne: InsertCommunityUsersOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_CommunityUsers_one": insertCommunityUsersOne.flatMap { (value: InsertCommunityUsersOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "CommunityUsers"
    public var insertCommunityUsersOne: InsertCommunityUsersOne? {
      get {
        return (resultMap["insert_CommunityUsers_one"] as? ResultMap).flatMap { InsertCommunityUsersOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_CommunityUsers_one")
      }
    }

    public struct InsertCommunityUsersOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CommunityUsers"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("communityId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("userId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(communityId: Int, userId: Int, createdAt: String, updatedAt: String) {
        self.init(unsafeResultMap: ["__typename": "CommunityUsers", "communityId": communityId, "userId": userId, "createdAt": createdAt, "updatedAt": updatedAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

public final class FetchPostPointsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query fetchPostPoints($postId: Int) {
      Post(where: {id: {_eq: $postId}}) {
        __typename
        points
      }
    }
    """

  public let operationName: String = "fetchPostPoints"

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
        GraphQLField("Post", arguments: ["where": ["id": ["_eq": GraphQLVariable("postId")]]], type: .nonNull(.list(.nonNull(.object(Post.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(post: [Post]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Post": post.map { (value: Post) -> ResultMap in value.resultMap }])
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

    public struct Post: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Post"]

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
        self.init(unsafeResultMap: ["__typename": "Post", "points": points])
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

public final class UpVotePostMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation upVotePost($postId: Int, $points: Int) {
      update_Post(where: {id: {_eq: $postId}}, _set: {points: $points}) {
        __typename
        returning {
          __typename
          points
        }
      }
    }
    """

  public let operationName: String = "upVotePost"

  public var postId: Int?
  public var points: Int?

  public init(postId: Int? = nil, points: Int? = nil) {
    self.postId = postId
    self.points = points
  }

  public var variables: GraphQLMap? {
    return ["postId": postId, "points": points]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_Post", arguments: ["where": ["id": ["_eq": GraphQLVariable("postId")]], "_set": ["points": GraphQLVariable("points")]], type: .object(UpdatePost.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updatePost: UpdatePost? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "update_Post": updatePost.flatMap { (value: UpdatePost) -> ResultMap in value.resultMap }])
    }

    /// update data of the table: "Post"
    public var updatePost: UpdatePost? {
      get {
        return (resultMap["update_Post"] as? ResultMap).flatMap { UpdatePost(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "update_Post")
      }
    }

    public struct UpdatePost: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Post_mutation_response"]

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
        self.init(unsafeResultMap: ["__typename": "Post_mutation_response", "returning": returning.map { (value: Returning) -> ResultMap in value.resultMap }])
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
        public static let possibleTypes: [String] = ["Post"]

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
          self.init(unsafeResultMap: ["__typename": "Post", "points": points])
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
}

public final class AddCommentMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddComment($commentInput: Comment_insert_input!) {
      insert_Comment_one(object: $commentInput) {
        __typename
        id
        postId
        commentBody
        createdAt
        userName
      }
    }
    """

  public let operationName: String = "AddComment"

  public var commentInput: Comment_insert_input

  public init(commentInput: Comment_insert_input) {
    self.commentInput = commentInput
  }

  public var variables: GraphQLMap? {
    return ["commentInput": commentInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_Comment_one", arguments: ["object": GraphQLVariable("commentInput")], type: .object(InsertCommentOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertCommentOne: InsertCommentOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_Comment_one": insertCommentOne.flatMap { (value: InsertCommentOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "Comment"
    public var insertCommentOne: InsertCommentOne? {
      get {
        return (resultMap["insert_Comment_one"] as? ResultMap).flatMap { InsertCommentOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_Comment_one")
      }
    }

    public struct InsertCommentOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Comment"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("postId", type: .nonNull(.scalar(Int.self))),
          GraphQLField("commentBody", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, postId: Int, commentBody: String, createdAt: String? = nil, userName: String) {
        self.init(unsafeResultMap: ["__typename": "Comment", "id": id, "postId": postId, "commentBody": commentBody, "createdAt": createdAt, "userName": userName])
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

      public var commentBody: String {
        get {
          return resultMap["commentBody"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "commentBody")
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

      public var userName: String {
        get {
          return resultMap["userName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userName")
        }
      }
    }
  }
}

public final class AddPostMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AddPost($postInput: Post_insert_input!) {
      insert_Post_one(object: $postInput) {
        __typename
        id
        postBody
        createdAt
        userName
      }
    }
    """

  public let operationName: String = "AddPost"

  public var postInput: Post_insert_input

  public init(postInput: Post_insert_input) {
    self.postInput = postInput
  }

  public var variables: GraphQLMap? {
    return ["postInput": postInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_Post_one", arguments: ["object": GraphQLVariable("postInput")], type: .object(InsertPostOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertPostOne: InsertPostOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_Post_one": insertPostOne.flatMap { (value: InsertPostOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "Post"
    public var insertPostOne: InsertPostOne? {
      get {
        return (resultMap["insert_Post_one"] as? ResultMap).flatMap { InsertPostOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_Post_one")
      }
    }

    public struct InsertPostOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Post"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("postBody", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, postBody: String? = nil, createdAt: String? = nil, userName: String) {
        self.init(unsafeResultMap: ["__typename": "Post", "id": id, "postBody": postBody, "createdAt": createdAt, "userName": userName])
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

      public var postBody: String? {
        get {
          return resultMap["postBody"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "postBody")
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

      public var userName: String {
        get {
          return resultMap["userName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userName")
        }
      }
    }
  }
}

public final class UpdatePostFlagMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdatePostFlag($postId: Int!, $flag: userContentFlag!) {
      update_Post(where: {id: {_eq: $postId}}, _set: {flag: $flag}) {
        __typename
        returning {
          __typename
          id
          flag
        }
      }
    }
    """

  public let operationName: String = "UpdatePostFlag"

  public var postId: Int
  public var flag: String

  public init(postId: Int, flag: String) {
    self.postId = postId
    self.flag = flag
  }

  public var variables: GraphQLMap? {
    return ["postId": postId, "flag": flag]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("update_Post", arguments: ["where": ["id": ["_eq": GraphQLVariable("postId")]], "_set": ["flag": GraphQLVariable("flag")]], type: .object(UpdatePost.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updatePost: UpdatePost? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "update_Post": updatePost.flatMap { (value: UpdatePost) -> ResultMap in value.resultMap }])
    }

    /// update data of the table: "Post"
    public var updatePost: UpdatePost? {
      get {
        return (resultMap["update_Post"] as? ResultMap).flatMap { UpdatePost(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "update_Post")
      }
    }

    public struct UpdatePost: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Post_mutation_response"]

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
        self.init(unsafeResultMap: ["__typename": "Post_mutation_response", "returning": returning.map { (value: Returning) -> ResultMap in value.resultMap }])
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
        public static let possibleTypes: [String] = ["Post"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(Int.self))),
            GraphQLField("flag", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, flag: String) {
          self.init(unsafeResultMap: ["__typename": "Post", "id": id, "flag": flag])
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

        public var flag: String {
          get {
            return resultMap["flag"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "flag")
          }
        }
      }
    }
  }
}

public final class FetchCommunityUserProfileQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchCommunityUserProfile($username: String!) {
      User(where: {userName: {_eq: $username}}) {
        __typename
        profilePicture
        points
        id
      }
    }
    """

  public let operationName: String = "FetchCommunityUserProfile"

  public var username: String

  public init(username: String) {
    self.username = username
  }

  public var variables: GraphQLMap? {
    return ["username": username]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", arguments: ["where": ["userName": ["_eq": GraphQLVariable("username")]]], type: .nonNull(.list(.nonNull(.object(User.selections))))),
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
          GraphQLField("profilePicture", type: .scalar(String.self)),
          GraphQLField("points", type: .nonNull(.scalar(Int.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(profilePicture: String? = nil, points: Int, id: Int) {
        self.init(unsafeResultMap: ["__typename": "User", "profilePicture": profilePicture, "points": points, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var points: Int {
        get {
          return resultMap["points"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "points")
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

public final class FetchCommunityUserPlantsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchCommunityUserPlants($userId: Int_comparison_exp!) {
      Plant(where: {userId: $userId}) {
        __typename
        plantImage
        plantName
        plantState
      }
    }
    """

  public let operationName: String = "FetchCommunityUserPlants"

  public var userId: Int_comparison_exp

  public init(userId: Int_comparison_exp) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Plant", arguments: ["where": ["userId": GraphQLVariable("userId")]], type: .nonNull(.list(.nonNull(.object(Plant.selections))))),
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
          GraphQLField("plantImage", type: .scalar(String.self)),
          GraphQLField("plantName", type: .nonNull(.scalar(String.self))),
          GraphQLField("plantState", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(plantImage: String? = nil, plantName: String, plantState: String) {
        self.init(unsafeResultMap: ["__typename": "Plant", "plantImage": plantImage, "plantName": plantName, "plantState": plantState])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

public final class RegisterUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RegisterUser($userInput: User_insert_input!) {
      insert_User_one(object: $userInput) {
        __typename
        id
        name
        userName
        email
        userName
        userType
      }
    }
    """

  public let operationName: String = "RegisterUser"

  public var userInput: User_insert_input

  public init(userInput: User_insert_input) {
    self.userInput = userInput
  }

  public var variables: GraphQLMap? {
    return ["userInput": userInput]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert_User_one", arguments: ["object": GraphQLVariable("userInput")], type: .object(InsertUserOne.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertUserOne: InsertUserOne? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert_User_one": insertUserOne.flatMap { (value: InsertUserOne) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "User"
    public var insertUserOne: InsertUserOne? {
      get {
        return (resultMap["insert_User_one"] as? ResultMap).flatMap { InsertUserOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert_User_one")
      }
    }

    public struct InsertUserOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Int.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("userName", type: .nonNull(.scalar(String.self))),
          GraphQLField("userType", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, name: String, userName: String, email: String, userType: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "userName": userName, "email": email, "userType": userType])
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

      public var userType: String {
        get {
          return resultMap["userType"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userType")
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
          GraphQLField("completedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, careRoutineId: Int, stepFrequency: String, otherFrequency: String? = nil, description: String? = nil, isCompleted: Bool, completedAt: String, createdAt: String, updatedAt: String) {
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

      public var completedAt: String {
        get {
          return resultMap["completedAt"]! as! String
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
            GraphQLField("completedAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int, careRoutineId: Int, isCompleted: Bool, stepFrequency: String, otherFrequency: String? = nil, description: String? = nil, completedAt: String, createdAt: String, updatedAt: String) {
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

        public var completedAt: String {
          get {
            return resultMap["completedAt"]! as! String
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

public final class DeleteCareRoutineMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteCareRoutine($careRoutineId: Int!, $plantId: Int!) {
      delete_RoutineStep(where: {careRoutineId: {_eq: $careRoutineId}}) {
        __typename
        affected_rows
        returning {
          __typename
          id
        }
      }
      delete_CareRoutine(where: {plantId: {_eq: $plantId}}) {
        __typename
        affected_rows
        returning {
          __typename
          id
        }
      }
    }
    """

  public let operationName: String = "DeleteCareRoutine"

  public var careRoutineId: Int
  public var plantId: Int

  public init(careRoutineId: Int, plantId: Int) {
    self.careRoutineId = careRoutineId
    self.plantId = plantId
  }

  public var variables: GraphQLMap? {
    return ["careRoutineId": careRoutineId, "plantId": plantId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("delete_RoutineStep", arguments: ["where": ["careRoutineId": ["_eq": GraphQLVariable("careRoutineId")]]], type: .object(DeleteRoutineStep.selections)),
        GraphQLField("delete_CareRoutine", arguments: ["where": ["plantId": ["_eq": GraphQLVariable("plantId")]]], type: .object(DeleteCareRoutine.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteRoutineStep: DeleteRoutineStep? = nil, deleteCareRoutine: DeleteCareRoutine? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "delete_RoutineStep": deleteRoutineStep.flatMap { (value: DeleteRoutineStep) -> ResultMap in value.resultMap }, "delete_CareRoutine": deleteCareRoutine.flatMap { (value: DeleteCareRoutine) -> ResultMap in value.resultMap }])
    }

    /// delete data from the table: "RoutineStep"
    public var deleteRoutineStep: DeleteRoutineStep? {
      get {
        return (resultMap["delete_RoutineStep"] as? ResultMap).flatMap { DeleteRoutineStep(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete_RoutineStep")
      }
    }

    /// delete data from the table: "CareRoutine"
    public var deleteCareRoutine: DeleteCareRoutine? {
      get {
        return (resultMap["delete_CareRoutine"] as? ResultMap).flatMap { DeleteCareRoutine(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete_CareRoutine")
      }
    }

    public struct DeleteRoutineStep: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RoutineStep_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("affected_rows", type: .nonNull(.scalar(Int.self))),
          GraphQLField("returning", type: .nonNull(.list(.nonNull(.object(Returning.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(affectedRows: Int, returning: [Returning]) {
        self.init(unsafeResultMap: ["__typename": "RoutineStep_mutation_response", "affected_rows": affectedRows, "returning": returning.map { (value: Returning) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// number of rows affected by the mutation
      public var affectedRows: Int {
        get {
          return resultMap["affected_rows"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "affected_rows")
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
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int) {
          self.init(unsafeResultMap: ["__typename": "RoutineStep", "id": id])
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

    public struct DeleteCareRoutine: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CareRoutine_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("affected_rows", type: .nonNull(.scalar(Int.self))),
          GraphQLField("returning", type: .nonNull(.list(.nonNull(.object(Returning.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(affectedRows: Int, returning: [Returning]) {
        self.init(unsafeResultMap: ["__typename": "CareRoutine_mutation_response", "affected_rows": affectedRows, "returning": returning.map { (value: Returning) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// number of rows affected by the mutation
      public var affectedRows: Int {
        get {
          return resultMap["affected_rows"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "affected_rows")
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
        public static let possibleTypes: [String] = ["CareRoutine"]

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
          self.init(unsafeResultMap: ["__typename": "CareRoutine", "id": id])
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
