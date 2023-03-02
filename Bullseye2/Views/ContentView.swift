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
            Color("BackgroundColor")
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Text("🎯🎯🎯 \n Put the Bullseye as close as you can to".uppercased())
                    .foregroundColor(Color("TextColor"))
                    .bold()
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .font(.title3)
                    .kerning(/*@START_MENU_TOKEN@*/2.0/*@END_MENU_TOKEN@*/)
                
                Text(String(game.target))
                    .foregroundColor(Color("TextColor"))
                    .font(.largeTitle)
                    .kerning(-1.0)
                    .fontWeight(.black)
                    .bold()
                
                HStack {
                    Text("1")
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.bold)
                        .font(.body)
                    Slider(value: $sliderValue, in: 1.0...100.0)
                    Text("100")
                        .foregroundColor(Color("TextColor"))
                        .fontWeight(.bold)
                        .font(.body)
                }.padding(.all, 20.0)
                
                Button("Hit me".uppercased()) {
                    // Action on click
                    alertIsVisible = true
                }
                .foregroundColor(Color("TextColor"))
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
                .foregroundColor(Color.white)
                .cornerRadius(16.0)
                .bold()
                
                .alert("Hello there!",
                       isPresented: $alertIsVisible, actions: {
                            Button("Awesome") {
                                alertIsVisible = false
                                print("Alert closed")
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
            .padding(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // optional additional previews to compare layouts, themes, etc
        ContentView()
            .preferredColorScheme(.dark)
    }
}
