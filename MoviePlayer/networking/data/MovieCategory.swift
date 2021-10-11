//
//  MovieCategory.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import Foundation


struct MovieCategory: Identifiable, Decodable {
    
    let playlistId: String
    let snippet: Snippet
    
    var movies: [Movie] = [Movie]()
    
    var title: String {
        snippet.title
    }
    
    var id: String {
        return playlistId
    }
    
    public enum CodingKeys: String, CodingKey {
     case playlistId
     case id
    case snippet
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        let d = try values.decode( [String: String].self, forKey: .id)
        playlistId =  d["playlistId"] ?? ""
        snippet = try values.decode(Snippet.self, forKey: .snippet)

    }
    
    init(playlistId: String, channelID: String, title: String, description: String, thumbnails: Thumbnails) {
        self.playlistId = playlistId
        self.snippet = Snippet(channelID: channelID, title: title, description: description, thumbnails: thumbnails)
    }

    
    //MARK: - preview helper
    static func example1() -> MovieCategory {
       
        var cat = MovieCategory(playlistId: "abcd", channelID: "abcd", title: "Action", description: "", thumbnails: Thumbnails(url: ""))
        cat.movies = [ Movie.example2(), Movie.example1(), Movie.example2(), Movie.example1()]
        return cat
    }
    
    static func example2() -> MovieCategory {
        var cat = MovieCategory(playlistId: "abcd2", channelID: "abcd2", title: "Science Fiction", description: "", thumbnails: Thumbnails(url: ""))
      
        cat.movies = [Movie.example1(), Movie.example2(), Movie.example1(),  Movie.example2()]
        return cat
    }
    
}

extension MovieCategory: Comparable, Hashable {
    static func < (lhs: MovieCategory, rhs: MovieCategory) -> Bool {
        lhs.id == rhs.id && lhs.movies == rhs.movies
    }
    
    
}
