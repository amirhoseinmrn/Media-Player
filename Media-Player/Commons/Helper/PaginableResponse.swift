//
//  PaginableResponse.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation

struct Paginable<Body: Codable>: Codable {
    var data: [Body]
    var total: Int
    var page: Int
    var perPage: Int
    
    enum CodingKeys: String, CodingKey {
        case total, page
        case perPage = "per_page"
        case data
    }
}
