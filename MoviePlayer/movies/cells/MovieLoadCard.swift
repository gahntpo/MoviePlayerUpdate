//
//  MovieLoadCard.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import SwiftUI

struct MovieLoadCard: View {
    let movie: Movie
    
    @StateObject private var posterLoader = ImageLoader()
    
    var body: some View {
        
        MovieCard(image: posterLoader.image, title: movie.title)
            .onAppear(perform: {
             
                if posterLoader.image == nil {
                     posterLoader.load(url: movie.posterImageURL)
                }
            })
    }
}

struct MovieLoadCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieLoadCard(movie:  Movie.example2())
    }
}
