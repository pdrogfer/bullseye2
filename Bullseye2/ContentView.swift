//
//  ContentView.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 01.03.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("🎯🎯🎯 \n PUT THE BULL'S EYE AS CLOSE AS YOU CAN TO")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.title3)
                .kerning(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
            
            Text("89")
                .font(.largeTitle)
                .kerning(-1.0)
                .fontWeight(.black)
                .bold()
            HStack {
                Text("1")
                    .fontWeight(.bold)
                    .font(.body)
                Slider(value: .constant(55.0), in: 1.0...100.0)
                Text("100")
                    .fontWeight(.bold)
                    .font(.body)
            }
            Button("Hit me") {
                // Action on click
            }
            
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
