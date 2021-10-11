//
//  ButtonStyleGuide.swift
//  MoviePlayer
//
//  Created by Karin Prater on 06.08.21.
//

import SwiftUI

struct ButtonStyleGuide: View {
    var body: some View {
        VStack(spacing: 10) {
        Text("Button Styles")
            
            Button(action: {}, label: {
                Text("Simple Button")
            }).buttonStyle(SimpleButtonStyle(isDisabled: false))
        }
    }
}

struct ButtonStyleGuide_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleGuide()
    }
}


struct SimpleButtonStyle: ButtonStyle {
    
    let backgroundColor: Color = .accentColor
    let isDisabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(backgroundColor.cornerRadius(10).shadow(radius: 10))
            .saturation(isDisabled ? 0 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
