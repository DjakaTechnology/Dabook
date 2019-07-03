//
//  Comments.swift
//
//  Created by Djaka Pradana on 01/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Comments: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let data = "data"
    static let paging = "paging"
  }

  // MARK: Properties
  public var data: [Data]?
  public var paging: Paging?

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
    if let items = json[SerializationKeys.data].array { data = items.map { Data(json: $0) } }
    paging = Paging(json: json[SerializationKeys.paging])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = data { dictionary[SerializationKeys.data] = value.map { $0.dictionaryRepresentation() } }
    if let value = paging { dictionary[SerializationKeys.paging] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.data = aDecoder.decodeObject(forKey: SerializationKeys.data) as? [Data]
    self.paging = aDecoder.decodeObject(forKey: SerializationKeys.paging) as? Paging
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(data, forKey: SerializationKeys.data)
    aCoder.encode(paging, forKey: SerializationKeys.paging)
  }

}
