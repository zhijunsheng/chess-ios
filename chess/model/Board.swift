//
//  Board.swift
//  chess
//
//  Created by Bowen Lin on 2018-01-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import Foundation

struct Board: CustomStringConvertible {
    
    var numRows: Int
    var numCols: Int
    
    var description: String {
        var dots = ""
        let a = 0
        var b = numRows
        
        while b > a {
            dots = dots + "\n"
            dots = dots + "\(b) "
            for _ in 1...numCols {
                dots = dots + ". "
            }
            b = b - 1
        }
        
        return dots
    }
}
