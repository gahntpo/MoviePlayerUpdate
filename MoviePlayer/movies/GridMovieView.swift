//
//  GridMovieView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import SwiftUI

struct GridMovieView: View {

    let categories: [MovieCategory]
    
    var body: some View {
        
        List {
        //Note: LazyVStack makes list jump during scrolling
//        ScrollView(showsIndicators: false) {
//            LazyVStack(alignment: .leading, spacing: 10) {
            ForEach(categories) { category in
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(category.title)
                        .modifier(MovieSectionStyle())
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        LazyHStack(alignment: .top, spacing: 0) {
                            ForEach(category.movies) { movie in
                                
                                NavigationLink(
                                    destination: MovieDetailView(movie: movie),
                                    label: {
                                        MovieLoadCard(movie: movie)
                                    })
                                    .contentShape(Rectangle())
                                    .buttonStyle(PlainButtonStyle())
                                
                            }
                        }
                    })
                }
                
            }.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
            
//        }
        }
    }
}

struct GridMovieView_Previews: PreviewProvider {
    static var previews: some View {
        GridMovieView(categories: [MovieCategory.example1(), MovieCategory.example2(), MovieCategory.example1()])
    }
}

