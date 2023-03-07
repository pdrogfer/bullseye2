//
//  PointsView.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 06.03.23.
//

import SwiftUI

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        
        VStack(spacing: 10) {
            InstructionText(text: "The slider's value is")
            BigNumberText(value: roundedValue)
            BodyText(text: "You scored \(points) Points\n🎉🎉🎉")
            Button {
                withAnimation {
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            } label: {
                ButtonText(text: "Start New Round")
            }

            
        }
            .padding()
            .frame(maxWidth: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(21)
            .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(alertIsVisible: .constant(false), sliderValue: .constant(12), game: .constant(Game()))
        PointsView(alertIsVisible: .constant(false), sliderValue: .constant(12), game: .constant(Game()))
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.dark)
    }
}
