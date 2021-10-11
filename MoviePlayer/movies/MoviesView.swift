//
//  MoviesView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

enum DisplayStyle: String, CaseIterable {
    case grid = "Grid"
    case list = "List"
}


struct MoviesView: View {
    
    
    //save in user defaults
    @State private var displayStyle = DisplayStyle.list
    @ObservedObject var fetcher: MovieFetcher
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Picker("", selection: $displayStyle) {
                    
                    Text("Grid")
                        .tag(DisplayStyle.grid)
                    Text("List")
                        .tag(DisplayStyle.list)
                }.pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // using TabView to keep previous scroll postion
                TabView(selection: $displayStyle,
                        content:  {
                           ListMovieView(categories: fetcher.categories)
                                .tag(DisplayStyle.list)
                          
                            GridMovieView(categories: fetcher.categories)
                                .tag(DisplayStyle.grid)
                            
                })
                    
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                //showing page style without page indicator
            }
            .navigationTitle("Movies")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView(fetcher: MovieFetcher())
    }
}
