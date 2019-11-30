//
//  RecursionTests.swift
//  chessTests
//
//  Created by Peter Shi on 2019-11-29.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest

class RecursionTests: XCTestCase {
    
    // 5!
    
    // to calculate 5!, 4! * 5
    // to calculate 4!, 3! * 4
    // to calculate 3!, 2! * 3
    // to calculate 2!, 1! * 2
    // 1! = 1
    
    func factorial(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        // a lot of code here
        // ...
        return factorial(n: n - 1) * n
    }
    
    // gcd ? the gcd of 12 and 18 is 6
    // gcd algorithm
    //
    // to find gcd(18, 12), 18 / 12 = 1 r 6
    // to find gcd(12, 6), 12 / 6 = 2 r 0
    //
    // 120, 95
    //
    // to find gcd(95, 120), 95 / 120 = 0 r 95
    // to find gcd(120, 95), 120 / 95 = 1 r 25
    // to find gcd(95, 25), 95 / 25 = 3 r 20
    // to find gcd(25, 20), 25 / 20 = 1 r 5
    // to find gcd(20, 5), 20 / 5 = 4 r 0
    
    func gcd(n: Int, m: Int) -> Int {
        if n % m == 0 {
            return m
        }
        
        return gcd(n: m, m: n % m)
    }
    
    func testThing() {
        print(factorial(n: 5))
        print(gcd(n: 95, m: 120))
        print(gcd(n: 79, m: 97))
    }
    
    
}
