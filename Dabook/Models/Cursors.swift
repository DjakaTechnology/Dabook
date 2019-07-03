//
//  Cursors.swift
//
//  Created by Djaka Pradana on 02/07/19
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Cursors: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let after = "after"
    static let before = "before"
  }

  // MARK: Properties
  public var after: String?
  public var before: String?

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
    after = json[SerializationKeys.after].string
    before = json[SerializationKeys.before].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = after { dictionary[SerializationKeys.after] = value }
    if let value = before { dictionary[SerializationKeys.before] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.after = aDecoder.decodeObject(forKey: SerializationKeys.after) as? String
    self.before = aDecoder.decodeObject(forKey: SerializationKeys.before) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(after, forKey: SerializationKeys.after)
    aCoder.encode(before, forKey: SerializationKeys.before)
  }

}
