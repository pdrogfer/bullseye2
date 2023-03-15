import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game, alertIsVisible: $alertIsVisible)
            VStack {
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game).transition(.scale)
                } else {
                    HitMeButtonView(
                        sliderValue: $sliderValue,
                        alertIsVisible: $alertIsVisible,
                        game: $game
                    ).transition(.scale)
                }
                
            }
            .padding(.horizontal)
            if (!alertIsVisible) {
                SliderView(value: $sliderValue).transition(.scale)
            }
            
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯 \n Put the Bullseye as close as you can to")
            BigNumberText(value: game.target)
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
            withAnimation {
                alertIsVisible = true
            }
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
        .overlay(RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
            .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .bold()
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
