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
    
    func isPrime(number: Int) -> Bool {
        if number == 1 || number == 4 {
            return false
        }
        if number == 2 || number == 3 {
            return true
        }
        
        for i in 2..<number / 2 {
            if number % i == 0 {
                return false
            }
        }
        return true
    }
    
    
    
    func testIsPrime() {
        
        XCTAssertTrue(isPrime(number: 31))
        XCTAssertTrue(isPrime(number: 331))
        XCTAssertTrue(isPrime(number: 3331))
        XCTAssertTrue(isPrime(number: 33331))
        XCTAssertTrue(isPrime(number: 333331))
        XCTAssertTrue(isPrime(number: 3333331))
        XCTAssertTrue(isPrime(number: 33_333_331))
        XCTAssertFalse(isPrime(number: 333333331))
        XCTAssertFalse(isPrime(number: 3333333331))
        XCTAssertFalse(isPrime(number: 33333333331))
    }
    
    func testPrintingPrimeNumbersUnder100() {
        for i in 1...100 {
            if isPrime(number: i){
                print(i)
            }
        }
    }
    
    func testHugePrimeNumber() {
        XCTAssertTrue(isPrime(number: 30303030303031))
 
    }
}
