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
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, 100)
                HitMeButtonView(
                    sliderValue: $sliderValue,
                    alertIsVisible: $alertIsVisible,
                    game: $game
                )
            }
            .padding(.horizontal)
            SliderView(value: $sliderValue)
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯 \n Put the Bullseye as close as you can to")
            TargetValueText(value: game.target)
        }
    }
}

struct SliderView: View {
    @Binding var value: Double
    var body: some View {
        HStack {
            SliderText(text: "1").frame(width: 35)
            Slider(value: $value, in: 1.0...100.0)
            SliderText(text: "100").frame(width: 35)
        }.padding()
    }
}

struct HitMeButtonView: View {
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        Button("Hit me".uppercased()) {
            // Action on click
            alertIsVisible = true
        }
        .padding(20)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(
                    colors: [Color.white.opacity(0.3), Color.clear],
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
        )
        .overlay(RoundedRectangle(cornerRadius: 21.0)
            .strokeBorder(Color.white, lineWidth: 2)
        )
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .bold()
        .alert("Hello there!",
               isPresented: $alertIsVisible, actions: {
                    Button("Awesome") {
                        alertIsVisible = false
                        game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
                    }
                },
               message: {
                    let roundedValue = Int(sliderValue.rounded())
                    Text("""
                    Value is \(roundedValue)
                    You scored \(game.points(sliderValue: roundedValue)) points this round.
                    """)
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // optional additional previews to compare layouts, themes, etc
//        ContentView()
//            .preferredColorScheme(.dark)
    }
}
