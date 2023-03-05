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
    
    let bonusClose = 50
    let bonusExact = 100
    
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
        round += 1
        score += points
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        round = 1
        score = 0
        target = Int.random(in: 1...100)
    }
}
