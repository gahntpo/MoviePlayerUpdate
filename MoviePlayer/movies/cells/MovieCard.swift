//
//  MoviewCard.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

struct MovieCard: View {
    let image: UIImage?
    let title: String
    
    let width: CGFloat = 140
    let cornerRadius: CGFloat = 10
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width * 1.5)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .shadow(radius: 10, x: 0, y: 10)
            }else {
                Color.gray
                    .cornerRadius(cornerRadius)
                    .frame(width: width, height: width * 1.5)
            }
            Text(title)
                .modifier(MovieCellStyle())
                .multilineTextAlignment(.leading)
                .lineLimit(3)
               
                .frame(width: width, alignment: .leading)
            
        } .padding(10)
        
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieCard(image: UIImage(named: "venom_thumbnail"), title: "Venom")
            MovieCard(image: UIImage(named: "affen_movieposter"), title: "Planet der Affen: Prevolution")
            MovieCard(image: nil, title: "Needs to be fetched")
        }
        .previewLayout(.fixed(width: 200, height: 300))
    }
}
