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
    
    func points(sliderValue: Int) -> Int {
        var difference = abs(target - sliderValue)

        let awardedPoints = 100 - difference
        return awardedPoints
    }
}
