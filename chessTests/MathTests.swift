//
//  MathTests.swift
//  chessTests
//
//  Created by Halwong on 2019/10/7.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest

class MathTests: XCTestCase {
    func testMath() {
        /*
 
ABCDE * 4 = EDCBA
         
        */
        for i in 0 ..< 100000 {
            let x = 10000 + i
            let onesPlace = x % 10
            let tensPlace = (x % 100) / 10
            let hundredsPlace = (x % 1000) / 100
            let thousandsPlace = (x % 10000) / 1000
            let tenThousandsPlace = (x % 100000) / 10000
            
            let y = tenThousandsPlace * 10000 + thousandsPlace * 1000 + hundredsPlace * 100 + tensPlace * 10 + onesPlace * 1
            
            let z = onesPlace * 10000 + tensPlace * 1000 + hundredsPlace * 100 + thousandsPlace * 10 + tenThousandsPlace * 1
            
            if y * 4 == z {
                print("\(y), \(z)")
            }
        }
//        let x = 10000
//        let onesPlace = x % 10
//        let tensPlace = (x % 100) / 10
//        let hundredsPlace = (x % 1000) / 100
//        let thousandsPlace = (x % 10000) / 1000
//        let tenThousandsPlace = (x % 100000) / 10000
//
//        print("\(onesPlace), \(tensPlace), \(hundredsPlace), \(thousandsPlace), \(tenThousandsPlace)")
//
//        let y = tenThousandsPlace * 10000 + thousandsPlace * 1000 + hundredsPlace * 100 + tensPlace * 10 + onesPlace * 1
//        print(y)
//
//        let z = onesPlace * 10000 + tensPlace * 1000 + hundredsPlace * 100 + thousandsPlace * 10 + tenThousandsPlace * 1
//        print(z)
    }
}
