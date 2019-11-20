//
//  ChessGameEngine.swift
//  chess
//
//  Created by Elaine on 2019/10/27.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessGameEngine: CustomStringConvertible {
    
    var box: Set<ChessPiece> = Set<ChessPiece>()
    
    // Set<Int>
    // [4, 5, 77]
    
    /*
     
       0 1 2 3 4 5 6 7
     0 . . . . . . . .
     1 . . . . . . . .
     2 . . . . . . . .
     3 . . . . . . . .
     4 . . . . . . . .
     5 . . . . . . . .
     6 . . . . . . . .
     7 . . . . . . . .
     
     */
    var description: String { // "a", "b", " ", "7", "\n"
        var desc = " "
        for f in 0..<8 {
            desc += " \(f)"
        }
        for t in 0..<8 {
            desc += "\n"
            desc += "\(t)"
            for b in 0..<8 {
                desc += " ."
            }
        }
        return desc
    }
}



