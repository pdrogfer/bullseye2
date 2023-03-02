//
//  ContentView.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 01.03.23.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        VStack {
            Text("🎯🎯🎯 \n PUT THE BULL'S EYE AS CLOSE AS YOU CAN TO")
                .bold()
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.title3)
                .kerning(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
            
            Text(String(game.target))
                .font(.largeTitle)
                .kerning(-1.0)
                .fontWeight(.black)
                .bold()
            HStack {
                Text("1")
                    .fontWeight(.bold)
                    .font(.body)
                Slider(value: $sliderValue, in: 1.0...100.0)
                Text("100")
                    .fontWeight(.bold)
                    .font(.body)
            }
            Button("Hit me") {
                // Action on click
                alertIsVisible = true
            }
            .alert("Hello there!", isPresented: $alertIsVisible, actions: {
                Button("Awesome") {
                    alertIsVisible = false
                    print("Alert closed")
                }
            }, message: {
                let roundedValue = Int(sliderValue.rounded())
                Text("""
                Value is \(roundedValue)
                You scored \(game.points(sliderValue: roundedValue)) points this round.
                """)
            }
            )
            
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
