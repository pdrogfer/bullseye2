//
//  BackgroundView.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 03.03.23.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(alertIsVisible: $alertIsVisible, game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(RingsView())
    }
}

struct TopView: View {
    @Binding var alertIsVisible: Bool
    @Binding var game: Game
    
    var body: some View {
        HStack {
            Button(action: {
                alertIsVisible = false
                game.restart()
            }, label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            })
            Spacer()
            RoundedImageViewStroked(systemName: "list.dash")
        }
        
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title)
            RoundRectText(text: text)
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let colorSchemeMultiplier = colorScheme == .light ? 0.3 : 0.1
        let startColor = Color("RingColor").opacity(colorSchemeMultiplier * 0.8)
        let endColor = Color("RingColor").opacity(0)
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            ForEach(1..<6) {ring in
                let size = CGFloat(ring * 100)
                Circle().stroke(lineWidth: 20).fill(
                    RadialGradient(
                        colors: [startColor, endColor],
                        center: .center,
                        startRadius: 100,
                        endRadius: 300))
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(alertIsVisible: .constant(false), game: .constant(Game()))
    }
}
