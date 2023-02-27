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
    public let query: String
    
    public init(page: Int,
                perPage: Int = 25,
                query: String) {
        self.page = page
        self.perPage = perPage
        self.query = query
    }
    
    var dictionary: [String: Any] {
        return ["page": page,
                "per_page": perPage,
                "query": query]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
