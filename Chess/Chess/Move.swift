//
//  ChessMove.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-07-02.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

struct Move {
    let fC: Int
    let fR: Int
    let tC: Int
    let tR: Int
    
    init(fC: Int, fR: Int, tC: Int, tR: Int) {
        self.fC = fC
        self.fR = fR
        self.tC = tC
        self.tR = tR
    }
    
    init(_ fC: Int, _ fR: Int, _ tC: Int, _ tR: Int) {
        self.init(fC: fC, fR: fR, tC: tC, tR: tR)
    }
}
