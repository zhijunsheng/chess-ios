//
//  StuffTests.swift
//  chessTests
//
//  Created by Peter Shi on 2019-10-06.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest

class StuffTests: XCTestCase {
    
    /*
 
     ABCDE * 4 = EDCBA
     
     ABCDE
     *   4
    --------
     EDCBA
 
    */
    
    
    
    func testThing() {
        var count = 0
        for a in 1...9 {
            for b in 0...9 {
                for c in 0...9 {
                    for d in 0...9 {
                        for e in 0...9 {
                            if (a * 10000 + b * 1000 + c * 100 + d * 10 + e) * 4 == (e * 10000 + d * 1000 + c * 100 + b * 10 + a) {
                                count += 1
                                print("\(a)\(b)\(c)\(d)\(e)")
                            }
                        }
                    }
                }
            }
        }
        print(count)
    }
    
    func testThingy() {
        
        for i in 10000...24999 {
            let onesDigit = i - i / 10 * 10
            
            let tensDigit = (i - i / 100 * 100) / 10
            
            let hundredsDigit = (i - i / 1000 * 1000) / 100
            
            let thousandsDigit = (i - i / 10000 * 10000) / 1000
            
            let tenThousandsDigit = (i - i / 100000 * 100000) / 10000
            
            let thing = onesDigit + tensDigit * 10 + hundredsDigit * 100 + thousandsDigit * 1000 + tenThousandsDigit * 10000
            
            let thingy = tenThousandsDigit + thousandsDigit * 10 + hundredsDigit * 100 + tensDigit * 1000 + onesDigit * 10000
            
            if thing * 4 == thingy {
                print(thing)
            }
        }
    }
}
