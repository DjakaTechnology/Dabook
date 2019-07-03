//
//  ProfileModel.swift
//
//  Created by Djaka Pradana on 02/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class ProfileModel: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let picture = "picture"
    static let name = "name"
    static let location = "location"
    static let id = "id"
    static let feed = "feed"
    static let gender = "gender"
    static let photos = "photos"
    static let birthday = "birthday"
  }

  // MARK: Properties
  public var picture: Picture?
  public var name: String?
  public var location: Location?
  public var id: String?
  public var feed: Feed?
  public var gender: String?
  public var photos: Photos?
  public var birthday: String?

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
    picture = Picture(json: json[SerializationKeys.picture])
    name = json[SerializationKeys.name].string
    location = Location(json: json[SerializationKeys.location])
    id = json[SerializationKeys.id].string
    feed = Feed(json: json[SerializationKeys.feed])
    gender = json[SerializationKeys.gender].string
    photos = Photos(json: json[SerializationKeys.photos])
    birthday = json[SerializationKeys.birthday].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = picture { dictionary[SerializationKeys.picture] = value.dictionaryRepresentation() }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = location { dictionary[SerializationKeys.location] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = feed { dictionary[SerializationKeys.feed] = value.dictionaryRepresentation() }
    if let value = gender { dictionary[SerializationKeys.gender] = value }
    if let value = photos { dictionary[SerializationKeys.photos] = value.dictionaryRepresentation() }
    if let value = birthday { dictionary[SerializationKeys.birthday] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.picture = aDecoder.decodeObject(forKey: SerializationKeys.picture) as? Picture
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.location = aDecoder.decodeObject(forKey: SerializationKeys.location) as? Location
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? String
    self.feed = aDecoder.decodeObject(forKey: SerializationKeys.feed) as? Feed
    self.gender = aDecoder.decodeObject(forKey: SerializationKeys.gender) as? String
    self.photos = aDecoder.decodeObject(forKey: SerializationKeys.photos) as? Photos
    self.birthday = aDecoder.decodeObject(forKey: SerializationKeys.birthday) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(picture, forKey: SerializationKeys.picture)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(location, forKey: SerializationKeys.location)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(feed, forKey: SerializationKeys.feed)
    aCoder.encode(gender, forKey: SerializationKeys.gender)
    aCoder.encode(photos, forKey: SerializationKeys.photos)
    aCoder.encode(birthday, forKey: SerializationKeys.birthday)
  }

}
