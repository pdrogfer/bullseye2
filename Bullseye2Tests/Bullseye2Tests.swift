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
    
    func testScoreExact() throws {
        let guess = game.target
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 100 + game.bonusExact)
    }
    
    func testScoreClose() throws {
        let guess = game.target + 2
        let score = game.points(sliderValue: guess)
        
        XCTAssertEqual(score, 98 + game.bonusClose)
    }
    
    func testRoundIncrementOnNewRound() throws {
        game.startNewRound(points: 100)
        
        XCTAssertEqual(game.round, 2)
    }
    
    func testNewRoundUsesExistingScore() throws {
        game.startNewRound(points: 96)
        
        XCTAssertEqual(game.score, 96)
    }
    
    func testNewRoundUsesNewTarget() throws {
        let oldTarget = game.target
        game.startNewRound(points: 23)
        
        XCTAssertNotEqual(game.target, oldTarget)
    }
    
    func testRestart() throws {
        game.startNewRound(points: 100)
        
        XCTAssertNotEqual(game.round, 1)
        XCTAssertNotEqual(game.score, 0)
        
        game.restart()
        
        XCTAssertEqual(game.round, 1)
        XCTAssertEqual(game.score, 0)
    }
    
    func testLeaderboard() throws {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntries.count, 1)
        XCTAssertEqual(game.leaderboardEntries[0].score, 100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEntries.count, 2)
        XCTAssertEqual(game.leaderboardEntries[0].score, 200)
        XCTAssertEqual(game.leaderboardEntries[1].score, 100)
    }
}
