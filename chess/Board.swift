//
//  Board.swift
//  chess
//
//  Created by Peter Shi on 2018-10-30.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import Foundation
/*
8 r n b k q b n r
7 p p p p p p p p
6 . . . . . . . .
5 . . . . . . . .
4 . . . . . . . .
3 . . . . . . . .
2 p p p p p p p p
1 r n b q k b n r
  a b c d e f g h
 */
struct Board: CustomStringConvertible {
    var description: String {
        var board: String = ""
        for i in 0...7 {
            for j in 0...7 {
                board.append(". ")
            }
            board.append("\n")
        }
        return board
    }
    
    
}
