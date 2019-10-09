//
//  StuffTests.swift
//  chessTests
//
//  Created by Peter Shi on 2019-10-06.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest

class StuffTests: XCTestCase {
    
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
    
}
