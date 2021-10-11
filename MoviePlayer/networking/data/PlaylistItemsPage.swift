//
//  PlaylistItemsPage.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

/*
 use to decode json returned from
"https://www.googleapis.com/youtube/v3/playlistItems?maxResults=\(maxResults)&part=snippet&playlistId=\(playlistID)&key=\(apiKey)"
 when fetching movies for playlist with playlistID
 
 
 */

import Foundation


struct PlaylistItemPage: Decodable {
    
    let nextPageToken: String
    let movies: [Movie]
    
   // let id: UUID = UUID()
    
    public enum CodingKeys: String, CodingKey {
        case nextPageToken
       case movies = "items"
        
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nextPageToken = try values.decode(String.self, forKey: .nextPageToken)
        movies = try values.decode([Movie].self, forKey: .movies)
    }
    
    
}



