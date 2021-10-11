//
//  ListMovieView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import SwiftUI

struct ListMovieView: View {
    

   let categories: [MovieCategory]
    
    
   
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(categories) { category in
                    
                    Text(category.title)
                        .modifier(MovieSectionStyle())
                        .padding(.horizontal)
                    
                    
                    ForEach(category.movies) { movie in
                        NavigationLink(
                            destination: MovieDetailView(movie: movie),
                            label: {
                                MovieLoadRow(movie: movie)
                            })
                            .buttonStyle(PlainButtonStyle())

                    }
                }
                
            }
            
            
        })

        
    }
}

struct ListMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ListMovieView(categories: [MovieCategory.example1(), MovieCategory.example2(), MovieCategory.example1()])
    }
}
