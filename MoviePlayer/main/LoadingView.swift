//
//  LoadingView.swift
//  MoviePlayer
//
//  Created by Karin Prater on 06.08.21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            ProgressView()
          
               
            Text("Loading movies ...")
                .font(.headline)
        }.padding()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
