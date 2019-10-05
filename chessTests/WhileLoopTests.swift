//
//  WhileLoopTests.swift
//  chessTests
//
//  Created by Elaine on 2019/4/23.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest

class WhileLoopTests: XCTestCase {
    
    func testAddFunc() {
        let theSum = add(num1: 123, b: 100)
        print("theSum = \(theSum)")
    }
    
    func add(num1: Int, b: Int) -> Int {
//        let a = 123
//        let b = 100
        let sum = num1 + b
        return sum
    }
    
    //    func testWeirdSymbols() {
    //        let quotient = 556545465 / 67
    //        let remainder = 556545465 % 67
    //
    //        print("the magic is like 1234567 - 3846 * 321 = \(1234567 - 3846 * 321)")
    //
    //        print("quotient is \(quotient), remainder is \(remainder)")
    //    }
    ////    548238817
    //    /*
    // 19,58,29,88,44,22,11,34,17,52,26,13,40,20,10,5,16,8,4,2,1
    //
    //    */
    //    func testCollatzConjecturep() {
    //        for k in 1 ... 20 {
    //            var counter = 0
    //
    //            var i = k
    //            print("starting from \(i), ")
    //            while i != 1 {
    //                print(i, terminator: ", ")
    //
    //                counter += 1
    //
    //                if i % 2 == 0 { // i is even
    //                    i = i / 2
    //                } else { // i is even
    //                    i = i * 3 + 1
    //                }
    //            }
    //            print(1)
    //            print("total in the sequence is now \(counter + 1)")
    //            print()
    
    
    // testing 17
    // 17 % 2:
    // 17 % 3
    // 17 % 4
    // ...
    // 17 % 16
    
    // 17 / 2 = 8.5
    // 17 / 3 = 5.
    // 17 / 4 = 4. 4 <= √17 sqrt
    // 17 / 5 = 3.
    // 17 / 6 = 2.
    // 17 / 7 = 2.
    // 17 / 8 = 2.
    // 17 / 9 = 1.
    // 17 / 10 = 1.
    // 17 / 11 = 1.
    // 17 / 12 = 1.
    //  17 / 13 = 1.x
    // 17 / 14 = 1.x
    // 17 / 15 = 1.x
    // 17 / 16 = 1.x
    
//    5 * 5 = 25
//    √25 = 5
//
//     4*4 = 16
//    √16 = 4
//    4*3 = 12
    
    // 31
    // 31 / 2 = 15.5
    // 31 / 3 =  10.x
    // 31 / 4 = 7.x
    // 31/5 = 6. 5 <= √31 sqrt
    // 31/6 = 5.
    // 31/7 = 4.
    // 31/8 = 3.
    // 31/9 = 3.
    func testprogramtocheckifprime() {
        // 31, 331, 3331, 33331, 333331, ..., 333333331 = 17 * ....
        let a =  30303030303031
        for ii in 2..<Int(sqrt(Double(a))) { //  = 3 * 5
            var remainder1 = a % ii
            
            if remainder1 == 0 { // not prime like 323 = 17 * 19
                print(ii)
                print("not prime")// Is divisable by more than 2 times which are 1 and the number itself
                return
            }
        }
        
        print("Yes! Prime!") //
    }
}
