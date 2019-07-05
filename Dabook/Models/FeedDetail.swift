//
//  Data.swift
//
//  Created by Djaka Pradana on 05/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class FeedDetail: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let from = "from"
    static let message = "message"
    static let id = "id"
    static let fullPicture = "full_picture"
  }

  // MARK: Properties
  public var from: From?
  public var message: String?
  public var id: String?
  public var fullPicture: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    from = From(json: json[SerializationKeys.from])
    message = json[SerializationKeys.message].string
    id = json[SerializationKeys.id].string
    fullPicture = json[SerializationKeys.fullPicture].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = from { dictionary[SerializationKeys.from] = value.dictionaryRepresentation() }
    if let value = message { dictionary[SerializationKeys.message] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = fullPicture { dictionary[SerializationKeys.fullPicture] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.from = aDecoder.decodeObject(forKey: SerializationKeys.from) as? From
    self.message = aDecoder.decodeObject(forKey: SerializationKeys.message) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.fullPicture = aDecoder.decodeObject(forKey: SerializationKeys.fullPicture) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(from, forKey: SerializationKeys.from)
    aCoder.encode(message, forKey: SerializationKeys.message)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(fullPicture, forKey: SerializationKeys.fullPicture)
  }

}
