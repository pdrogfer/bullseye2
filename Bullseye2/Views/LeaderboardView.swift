//
//  LeaderboardView.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 07.03.23.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var game: Game
    @Binding var leaderboardIsVisible: Bool

    var body: some View {
        ZStack {
            Color("BackgroundColor").ignoresSafeArea()
            VStack(spacing: 10) {
                HeaderView(leaderboardIsVisible: $leaderboardIsVisible)
                LabelView()
                ScrollView {
                    VStack(spacing: 10) {
                        
                        ForEach(game.leaderboardEntries.indices, id: \.self) { i in
                            let entry = game.leaderboardEntries[i]
                            RowView(index: i + 1, score: entry.score, date: entry.date)
                        }
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Binding var leaderboardIsVisible: Bool
    
    var body: some View {
        ZStack {
            HStack {
                BigBoldText(text: "Leaderboard")
                if (verticalSizeClass == .regular && horizontalSizeClass == .compact) {
                    Spacer()
                }
            }
            HStack {
                Spacer()
                Button {
                    leaderboardIsVisible = false
                } label: {
                    RoundedImageViewStroked(systemName: "xmark")
                }
                
            }
        }.padding([.horizontal, .top])
    }
}

struct LabelView: View {
    var body: some View {
        HStack {
            Spacer().frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "Score").frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            LabelText(text: "Date").frame(width: Constants.Leaderboard.dateColumnWidth)
        }.padding(.horizontal)
            .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct RowView: View {
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            RoundedText(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.scoreColumnWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.dateColumnWidth)
        }.background(RoundedRectangle(cornerRadius: .infinity)
            .strokeBorder(Color("LeaderboardRowColor"),
                          lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var game = Binding.constant(Game(loadTestData: true))
    static private var leaderboardIsVisible = Binding.constant(false)
    
    static var previews: some View {
        LeaderboardView(game: game, leaderboardIsVisible: leaderboardIsVisible).previewInterfaceOrientation(.landscapeRight)
        LeaderboardView(game: game, leaderboardIsVisible: leaderboardIsVisible).preferredColorScheme(.dark)
    }
}
