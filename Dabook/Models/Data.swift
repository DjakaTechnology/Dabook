//
//  Data.swift
//
//  Created by Djaka Pradana on 02/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Data: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let picture = "picture"
    static let height = "height"
    static let link = "link"
    static let id = "id"
    static let url = "url"
  }

  // MARK: Properties
  public var picture: String?
  public var height: Int?
  public var link: String?
  public var id: String?
  public var url: String?

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
    picture = json[SerializationKeys.picture].string
    height = json[SerializationKeys.height].int
    link = json[SerializationKeys.link].string
    id = json[SerializationKeys.id].string
    url = json[SerializationKeys.url].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = picture { dictionary[SerializationKeys.picture] = value }
    if let value = height { dictionary[SerializationKeys.height] = value }
    if let value = link { dictionary[SerializationKeys.link] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.picture = aDecoder.decodeObject(forKey: SerializationKeys.picture) as? String
    self.height = aDecoder.decodeObject(forKey: SerializationKeys.height) as? Int
    self.link = aDecoder.decodeObject(forKey: SerializationKeys.link) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(picture, forKey: SerializationKeys.picture)
    aCoder.encode(height, forKey: SerializationKeys.height)
    aCoder.encode(link, forKey: SerializationKeys.link)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(url, forKey: SerializationKeys.url)
  }

}
