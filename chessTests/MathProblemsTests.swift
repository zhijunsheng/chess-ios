//
//  MathProblemsTests.swift
//  chessTests
//
//  Created by Elaine on 2019/10/8.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest

class MathProblemsTests: XCTestCase {
    func testMathProblem() {

        for lx in 10000..<25000 {
            let onesPlace = lx % 10
            let tensPlace = lx / 10 % 10
            let hundredsPlace = lx / 100 % 10
            let tensThousandsPlace = lx / 10000
            let thousandsPlace = lx / 1000 % 10
            let mj = onesPlace * 10000 + tensPlace * 1000 + hundredsPlace * 100 + thousandsPlace * 10 + tensThousandsPlace
            if lx * 4 == mj {
                print("\(lx) * 4 = \(mj)")
            }
        }
    }
}
