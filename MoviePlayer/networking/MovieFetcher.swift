//
//  MovieFetcher.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import Foundation
import Combine

class MovieFetcher: ObservableObject {
    
    private let apiKey: String = Constants.key()
    
    private var pages: [PlaylistPage] = []   // use to store all data including nextPageToken
    @Published var categories: [MovieCategory] = []
    
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    
    @Published var movieError: String? = nil

    init() {
      
        fetchInitialPlaylistsPage()
    }
    
    private let maxResults = 5
    
    private let dataProvider = DataProvider()  // TODO: add Protocol type and unit tests
    
    
    func fetchInitialPlaylistsPage() {
        error = nil
        isLoading = true
        
        //TODO: compose url with URLComponents, different endpoints and QueryItems
        let searchPlaylistsPath = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=\(maxResults)&q=trailer&safeSearch=safeSearchSettingUnspecified&type=playlist&key=\(apiKey)"
    
        dataProvider.fetch(PlaylistPage.self, url: URL(string: searchPlaylistsPath)) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .failure(let error):
                    self?.error = error.localizedDescription
                    print("error fetching playlists: \(error.description)")
                case .success(let playlist):
                    self?.pages.append(playlist)
                    self?.categories = playlist.categories //TODO: fetch more "categories"
                    
                    for list in playlist.categories {
                        self?.fetchPlaylist(with: list.id)
                    }
                }
            }
        }
        
    }
    
    func fetchPlaylist(with playlistID: String) {
        
        let playlistpath = "https://www.googleapis.com/youtube/v3/playlistItems?maxResults=\(maxResults)&part=snippet&playlistId=\(playlistID)&key=\(apiKey)"
        dataProvider.fetch(PlaylistItemPage.self, url: URL(string: playlistpath)) { [weak self] result in
            DispatchQueue.main.async {
             
                switch result {
                case .failure(let error):
                    self?.movieError = error.localizedDescription
                    print("error fetching movies: \(error.description)")
                case .success(let data):
                    if let index =  self?.categories.firstIndex(where: { $0.id == playlistID }) {
                        self?.categories[index].movies = data.movies
                    }
                }
            }
        }
    }
    
}
