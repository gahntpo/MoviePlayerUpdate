//
//  FavoriteDetailView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    
    @EnvironmentObject var favorites: FavoritesManager
    
    @StateObject private var posterLoader = ImageLoader()
    @StateObject private var headerLoader = ImageLoader()
    
    let starColor: Color = .red
    let posterImageHeight: CGFloat = 200
    
    var body: some View {
        
        VStack {
            
           
            if headerLoader.image != nil {
                Image(uiImage: headerLoader.image!)
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: posterImageHeight * 2)
                    .clipped()
                    
            }else {
                Color.gray.frame(height: 300)
            }
                    
            
            
            HStack(alignment: .top, spacing: 15) {
                if posterLoader.image != nil {
                    Image(uiImage: posterLoader.image!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: posterImageHeight * 0.7, height: posterImageHeight)
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                        .shadow(radius: 10, x: 0, y: 10)
                        .shadow(color: .black, radius: 10, x: 0, y: 10)
                    
                }else {
                    Color.black.frame(width: posterImageHeight / 3 * 2, height: posterImageHeight)
                }
                
                VStack(alignment: .leading) {
                
                    Text(movie.title)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.vertical)
                    
                    Text("\(movie.numberOfPeopleWatching) People watching")
                        .font(.subheadline)
                    Text(movie.categories)
                    .font(.subheadline)
                    
                    HStack(spacing: 2) {
                        
                        Text(String(format: "%.1f", movie.rating))
                            .foregroundColor(starColor).padding(.trailing, 2)
                        ForEach(0..<5, id: \.self) { star in
                            Button(action: {
//                                movie.rating = 1
                            }, label: {
                                Image(systemName: "star.fill").foregroundColor(star < Int(movie.rating) ? starColor : Color(.systemGray))
                            })
                           
                            
                        }
                        //TODO: - interactives rating
                    }.padding(.vertical)
                    
                }
              
                Spacer()
            }
            .padding(.leading)
            .offset(x: 0, y: -posterImageHeight * 0.45 )
            .padding(.bottom, -posterImageHeight * 0.45)
           // .padding(.bottom)
            
            
            
            ScrollView {
                Text(movie.description)
                    .font(.body)
            }.padding([.top, .horizontal])
        }
        .navigationTitle(movie.title)
        .navigationBarItems(trailing: Button(action: {
                                    favorites.toggle(movie: movie)
                                }, label: {
                                    Image(favorites.favoritesContain(movie: movie) ? "FavoritesLight" : "FavoritesDisabled")
                                }))
        .onAppear(perform: {
            // loading images when view appears
            posterLoader.load(url: movie.posterImageURL)
            headerLoader.load(url: movie.posterImageURL)
        })
        
        
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.example2())
            .environmentObject(FavoritesManager())
    }
}
