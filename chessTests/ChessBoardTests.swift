//
//  ChessBoardTests.swift
//  chessTests
//
//  Created by Grace Huang on 10/20/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class ChessBoardTests: XCTestCase {

    func testPrintingChessBoard() {
        let chessBoard = ChessBoard()
        print(chessBoard)
    }
    
    func testIntArray() {
        let numbers:[Int] = [3, 8, 11, 32] // numbers[0], numbers[1]
        print(numbers.count)
        var result = 0
        for i in 0..<numbers.count {
            result += numbers[i]
        }
        print(result)
    }
    
    func isPrime(number: Int) -> Bool { // 371, 2,3,4,...,371/2
        for i in 2..<number / 2 {
            print("anything")
            if number % i == 0 {
                return false
            }
            
        }
        return true
    }
    
    func testIsPrime() {
        XCTAssertTrue(isPrime(number: 7))
        XCTAssertFalse(isPrime(number: 14))
        XCTAssertFalse(isPrime(number: 15))
        XCTAssertTrue(isPrime(number: 17))
    }
}
