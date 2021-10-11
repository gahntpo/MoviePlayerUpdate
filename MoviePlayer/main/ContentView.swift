//
//  ContentView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 11.10.21.
//

import SwiftUI

enum TabSelection {
    case movies
    case favorites
    case settings
    
}


struct ContentView: View {
    @State private var selection: TabSelection = .movies
    
    @StateObject var favorties = FavoritesManager()
    @StateObject var fetcher = MovieFetcher()
    
  
    var body: some View {
        
        if fetcher.isLoading {
            
            VStack(spacing: 20) {
                ProgressView()
                   
                Text("Loading movies")
                    .font(.headline)
            }
            
        }else if fetcher.error != nil {
            
           ErrorView(fetcher: fetcher)
            
        }else {
            
            TabView(selection: $selection) {
                MoviesView(fetcher: fetcher)
                    .tabItem { Label("Movies", image: selection == .movies ? "MovieLight" : "MovieDisabled") }
                    .tag(TabSelection.movies)
                
                FavoritesView()
                    .tabItem { Label("Favorites", image: selection == .favorites ? "FavoritesLight" : "FavoritesDisabled") }
                    .tag(TabSelection.favorites)
                
                SettingsView()
                    .tabItem { Label("Settings", image: selection == .settings ? "SettingsLight" : "SettingsDisabled") }
                    .tag(TabSelection.settings)
                
                
                
            }
            .environmentObject(favorties)
         
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
