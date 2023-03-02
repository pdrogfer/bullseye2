//
//  Bullseye2Tests.swift
//  Bullseye2Tests
//
//  Created by Pedro Gonzalez Ferrandez on 02.03.23.
//

import XCTest

@testable import Bullseye2

final class Bullseye2Tests: XCTestCase {
    var game: Game!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

    func testScorePositive() throws {
        let guess = game.target + 5
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative() throws {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 95)
    }
}
