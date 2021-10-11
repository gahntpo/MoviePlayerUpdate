//
//  ErrorView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 06.08.21.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var fetcher: MovieFetcher
    var body: some View {
        VStack(spacing: 20) {
            
            
            Image("SorryImage")
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(fetcher.error ?? "")
            
            Button(action: {
                fetcher.fetchInitialPlaylistsPage()
            }, label: {
                Text("Try again")
            })
            .buttonStyle(SimpleButtonStyle(isDisabled: false))

        }.padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let fetcher = MovieFetcher()
        fetcher.error = "The internet connection seems to be offline."
       return ErrorView(fetcher: fetcher)
    }
}
