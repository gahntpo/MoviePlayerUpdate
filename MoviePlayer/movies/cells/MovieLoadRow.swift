//
//  MovieLoadRow.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import SwiftUI

struct MovieLoadRow: View {
    
    let movie: Movie
    
    @StateObject private var headerLoader = ImageLoader()

    
    var body: some View {
        MovieRow(image: headerLoader.image, title: movie.title)
            .onAppear {
                headerLoader.load(url: movie.posterImageURL)
            }
    }
}

struct MovieLoadRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieLoadRow(movie: Movie.example1())
    }
}
