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
         So, manually we cannot try all the numbers because there
         are too many of them.
 
         ABCDE * 4 = EDCBA
         
         A = 2
         E = 8
         B = 1
         D = 7
         c = 9
         
          333
         21978
         *   4
         -------
         87912
         
        */
        
        for x in 10000 ..< 25000 {
            let onesPlace = x % 10
            let tensPlace = (x % 100) / 10
            let hundredsPlace = (x % 1000) / 100
            let thousandsPlace = (x % 10000) / 1000
            let tenThousandsPlace = (x % 100000) / 10000
            
            let y = tenThousandsPlace * 10000 + thousandsPlace * 1000 + hundredsPlace * 100 + tensPlace * 10 + onesPlace * 1
            
            let z = onesPlace * 10000 + tensPlace * 1000 + hundredsPlace * 100 + thousandsPlace * 10 + tenThousandsPlace * 1
            
            if y * 4 == z {
                print("\(y) * 4 = \(z)")
            }
        }
    }
}
