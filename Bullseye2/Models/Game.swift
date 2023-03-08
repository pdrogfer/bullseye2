//
//  Game.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 02.03.23.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    let bonusClose = 50
    let bonusExact = 100
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            saveRoundToLeaderboard(score: 12)
            saveRoundToLeaderboard(score: 234)
            saveRoundToLeaderboard(score: 5)
            saveRoundToLeaderboard(score: 55)
            saveRoundToLeaderboard(score: 56)
            saveRoundToLeaderboard(score: 34)
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let difference = abs(target - sliderValue)
        
        let bonus: Int
        if (difference == 0) {
            bonus = bonusExact
        } else if (difference <= 2) {
            bonus = bonusClose
        } else {
            bonus = 0
        }

        let awardedPoints = 100 - difference + bonus
        return awardedPoints
    }
    
    mutating func startNewRound(points: Int) {
        saveRoundToLeaderboard(score: points)
        
        round += 1
        score += points
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        round = 1
        score = 0
        target = Int.random(in: 1...100)
    }
    
    mutating func saveRoundToLeaderboard(score: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
        leaderboardEntries.sort { entry1, entry2 in
            entry1.score > entry2.score
        }
    }
}

struct LeaderboardEntry {
    let score: Int
    let date: Date
}
