//
//  ListVideoRequest.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation

public struct ListVideoRequest {
    public let page: Int
    public let perPage: Int
    
    public init(page: Int, perPage: Int) {
        self.page = page
        self.perPage = perPage
    }
    
    var dictionary: [String: Any] {
        return ["page": page,
                "per_page": perPage]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
