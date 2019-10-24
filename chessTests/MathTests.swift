//
//  MathTests.swift
//  chessTests
//
//  Created by Andy Yan on 2019-10-16.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest

class MathTests: XCTestCase {
    
    func testAdd() {
        let a = add(num1: 1, num2: 100)
        print(a)
    }

    func add(num1: Int, num2: Int) -> Int {
        let sum = num1 + num2
        return sum
    }
    
    /*
     
     Collatz Conjecture
 
     let's start from an integer 5
     
     5, ?, ?, ?, ?,
     
     if the previous one is
     
     even, then the new number = previous one divided by 2
     
     odd, then the new number = 3 * "previous one" + 1
     
      16, 8, 4, 2
     
     9, 28, 14, 7, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 8, 4, 2, 1
     
     3, 10, 5, 16, 8, 4, 2, 1, 4, 2, 1, 4, 2, 1, 4, 2, 1, 4, 2, 1, 4, 2, 1
     
     100, 50, 25, 76, 38, 19, 58, 29, 88, 44, 22, 11, 34, 17, 52, 26, 13, 40, 20, 10, 5, 16, 4,2, 1
 
    */
    func testCollatz() { // 13 % 5 = 3, 13 % 2 = 1, 42 % 2 = 0, 99 % 2 = 1
        var c = 15
        while c != 1 {
            print("\(c), ", terminator: "")
            if c % 2 == 1 {// checking for odd numbers
               c = 3 * c + 1
            } else { // must be even numbers
                c = c / 2
            }
        }
        print("\(c)")
    }
}

