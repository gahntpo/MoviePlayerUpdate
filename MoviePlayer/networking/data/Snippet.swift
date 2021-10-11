//
//  Snippet.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import Foundation

struct Snippet: Codable, Hashable {
    static func == (lhs: Snippet, rhs: Snippet) -> Bool {
        lhs.id == rhs.id
    }
    
  
    let channelID: String
    let title: String
    let description: String
    let thumbnails: Thumbnails
    let id: UUID = UUID()
   
    enum CodingKeys: String, CodingKey {
       
        case channelID = "channelId"
        case title
        case thumbnails
        case description
    }
    
}

struct Thumbnails: Codable, Hashable {
    static func == (lhs: Thumbnails, rhs: Thumbnails) -> Bool {
        lhs.medium == rhs.medium
    }
    
    
    let thumbnailsDefault: Thumbnail
    let medium, high, maxres: Thumbnail?

    enum CodingKeys: String, CodingKey {
        case thumbnailsDefault = "default"
        case medium, high, maxres
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    
        thumbnailsDefault = try values.decode(Thumbnail.self, forKey: .thumbnailsDefault)
        medium = try values.decodeIfPresent(Thumbnail.self, forKey: .medium)
        high =  try values.decodeIfPresent(Thumbnail.self, forKey: .high)
        maxres = try values.decodeIfPresent(Thumbnail.self, forKey: .maxres)
        
    }
    
    init(url: String) {
        thumbnailsDefault = Thumbnail(url: url, width: 100, height: 100 )
        maxres = nil
        medium = nil
        high = nil
    }
    
}


struct Thumbnail: Codable, Hashable {
    let url: String
    let width: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case url
        case width, height
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
    
        url = try values.decode(String.self, forKey: .url)
        width =  try values.decode(Int.self, forKey: .width)
        height =  try values.decode(Int.self, forKey: .height)
    }
    
    init(url: String, width: Int, height: Int) {
        self.url = url
        self.width = width
        self.height = height
    }
}
