//
//  MovieRow.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import SwiftUI

struct MovieRow: View {
    
    //TODO: - change to loading
    let image: UIImage?
    let title: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(color: Color(.sRGB, white: 0, opacity: 0.65), radius: 10, x: 0, y: 10)
                
            } else {
                ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.gray)
                    .frame(height: 200)
                    .shadow(radius: 10, x: 0, y: 10)
                 ProgressView()
                }
            }
            Text(title)
                .modifier(MovieCellStyle())
                .multilineTextAlignment(.leading)
                .lineLimit(3)
            
        } .padding(15)
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieRow(image: UIImage(named: "venom_thumbnail"), title: "Venom")
                
            MovieRow(image: UIImage(named: "affen_thumbnail"), title: "Planet der Affen: Prevolution")
                .preferredColorScheme(.dark)
        }
        .previewLayout(.fixed(width: 400, height: 300))
          
    }
}
