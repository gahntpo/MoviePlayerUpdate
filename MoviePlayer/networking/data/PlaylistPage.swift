//
//  PlaylistPage.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//


/*
 use to decode json returned from
 "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=\(maxResults)&q=trailer&safeSearch=safeSearchSettingUnspecified&type=playlist&key=\(apiKey)"
 when fetching playlists with trailer movies
 
 */

import Foundation

struct PlaylistPage: Decodable {
    
    let nextPageToken: String
    let categories: [MovieCategory]
    
    public enum CodingKeys: String, CodingKey {
        case nextPageToken
       case categories = "items"
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nextPageToken = try values.decode(String.self, forKey: .nextPageToken)
        categories = try values.decode([MovieCategory].self, forKey: .categories)
    }
    
    
}






