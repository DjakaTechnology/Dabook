//
//  URLHelper.swift
//  Dabook
//
//  Created by Djaka Pradana on 02/07/19.
//  Copyright © 2019 Djaka Pradana. All rights reserved.
//

import Foundation

struct URLHelper {
    static let baseUrl: String = "https://graph.facebook.com/v3.3/"
    static let profile: String = "me?fields=address,work,education,website,gender,birthday,location,feed{full_picture,message,from},picture{url},name,photos{link,picture.type(large),height}"
    static let tokenKey: String = "token"
}
