//
//  TextStyleGuide.swift
//  MoviePlayer
//
//  Created by Karin Prater on 05.08.21.
//

import SwiftUI

struct StartTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
         
            .font(.headline)
           // .foregroundColor(Color("Primary"))
    }
}

//MARK: - movies
struct MovieSectionStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundColor(Color.gray)
            
          
    }
}


struct MovieCellStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
          
    }
}
//MARK: - movie detail
struct MovieDetailTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
          
    }
}
struct MovieDetailSubTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
          
    }
}
struct MovieDetailDescriptionStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
          
    }
}



struct TextStyleGuide: View {
    var body: some View {
        VStack(spacing: 10) {
        
            Text("Start, loading view")
                .modifier(StartTextStyle())
            
            Text("Movie Section Category")
                .modifier(MovieSectionStyle())
            
            Text("Movie Cell")
                .modifier(MovieCellStyle())
            
            
            Text("Movie Detail title")
                .modifier(MovieDetailTitleStyle())
            Text("Movie Detail subtitle")
                .modifier(MovieDetailSubTitleStyle())
            Text("Movie Detail description")
                .modifier(MovieDetailDescriptionStyle())
            
        }
    }
}

struct TextStyleGuide_Previews: PreviewProvider {
    static var previews: some View {
        TextStyleGuide()
    }
}
