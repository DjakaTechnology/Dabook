//
//  Data.swift
//
//  Created by Djaka Pradana on 01/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class PictureData: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let height = "height"
    static let isSilhouette = "is_silhouette"
    static let url = "url"
    static let width = "width"
  }

  // MARK: Properties
  public var height: Int?
  public var isSilhouette: Bool? = false
  public var url: String?
  public var width: Int?

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
    height = json[SerializationKeys.height].int
    isSilhouette = json[SerializationKeys.isSilhouette].boolValue
    url = json[SerializationKeys.url].string
    width = json[SerializationKeys.width].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = height { dictionary[SerializationKeys.height] = value }
    dictionary[SerializationKeys.isSilhouette] = isSilhouette
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = width { dictionary[SerializationKeys.width] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.height = aDecoder.decodeObject(forKey: SerializationKeys.height) as? Int
    self.isSilhouette = aDecoder.decodeBool(forKey: SerializationKeys.isSilhouette)
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
    self.width = aDecoder.decodeObject(forKey: SerializationKeys.width) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(height, forKey: SerializationKeys.height)
    aCoder.encode(isSilhouette, forKey: SerializationKeys.isSilhouette)
    aCoder.encode(url, forKey: SerializationKeys.url)
    aCoder.encode(width, forKey: SerializationKeys.width)
  }

}
