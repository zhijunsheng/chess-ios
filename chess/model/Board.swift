//
//  Board.swift
//  chess
//
//  Created by Bowen Lin on 2018-01-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import Foundation

struct Board: CustomStringConvertible {
    
    let numRows: Int
    let numCols: Int
    
    var description: String {
        var dots = ""
        let a = 0
        let markRow = "+ A B C D E F G H J K L M N O P Q R S T"
        let c = numCols * 2 + 1 
        let strArray = Array(markRow)
        let subStr = strArray[0...c]
        
        var b = numRows
        
        while b > a {
            dots = dots + "\n"
            dots = dots + "\(b) "
            for _ in 1...numCols {
                dots = dots + ". "
            
            }
            b = b - 1
        }
        dots += "\n"
        dots += subStr
        return dots
    }
}
