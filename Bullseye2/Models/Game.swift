//
//  Game.swift
//  Bullseye2
//
//  Created by Pedro Gonzalez Ferrandez on 02.03.23.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        var difference: Int
        
        // Tutorial approach
//        if sliderValue > target {
//            difference = sliderValue - target
//        } else if target > sliderValue {
//            difference = target - sliderValue
//        } else {
//            difference = 0
//        }
//

        // simple version
        difference = abs(target - sliderValue)

        let awardedPoints: Int = 100 - difference
        return awardedPoints
    }
}
