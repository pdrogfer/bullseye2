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
            Text("🎯🎯🎯 \n PUT THE BULL'S EYE AS CLOSE AS YOU CAN")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.title3)
                .kerning(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
                
            Text("89")
            HStack {
                Text("89")
                Slider(value: .constant(50.0), in: 1.0...100.0)
                Text("89")
            }
            Button("Hit me") {
                // Action on click
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
