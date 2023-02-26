//
//  VideoResponse.swift
//  Media-Player
//
//  Created by amir on 2/26/23.
//

import Foundation

// MARK: - VideoModel
public struct VideoModel: Codable {
    var uri, name, description, type: String?
    var link, playerEmbedURL: String?
    var duration, width: Int?
    var height: Int?
    var embed: Embed?
    var pictures: Pictures?
    var stats: Stats?
    var metadata: Metadata?
    
    enum CodingKeys: String, CodingKey {
        case uri, name, description, type, link
        case playerEmbedURL = "player_embed_url"
        case duration, width, height, embed, pictures, stats, metadata
    }
}

// MARK: - Embed
struct Embed: Codable {
    var html: String?
}

// MARK: - Metadata
struct Metadata: Codable {
    var connections: Connections?
}

// MARK: - Connections
struct Connections: Codable {
    var comments, credits, likes, pictures: Albums?
    var texttracks: Albums?
    var recommendations: Recommendations?
    var albums, availableAlbums, availableChannels: Albums?
    
    enum CodingKeys: String, CodingKey {
        case comments, credits, likes, pictures, texttracks, recommendations, albums
        case availableAlbums = "available_albums"
        case availableChannels = "available_channels"
    }
}

// MARK: - Albums
struct Albums: Codable {
    var uri: String?
    var options: [Option]?
    var total: Int?
}

enum Option: String, Codable {
    case optionGET = "GET"
    case patch = "PATCH"
    case post = "POST"
}

// MARK: - Recommendations
struct Recommendations: Codable {
    var uri: String?
    var options: [Option]?
}

// MARK: - Pictures
struct Pictures: Codable {
    var uri: String?
    var active: Bool?
    var type: String?
    var baseLink: String?
    
    enum CodingKeys: String, CodingKey {
        case uri, active, type
        case baseLink = "base_link"
    }
}

// MARK: - Stats
struct Stats: Codable {
    var plays: Int?
}
