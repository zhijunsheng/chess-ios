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

/*Pawn : Can move [pawn + (x : 1 , y :  0)] unless there is a piece at [pawn + (x : 1 , y :  1)] or [pawn + (x : 1 , y :  -1)]. If so, the pawn can eat the piece there, taking its place.

Rook: Can move forwards, backwards, left and right. If there is a piece in the path of its movement the rook can eat it. Rooks can move an infinite amount of blocks in the directions they can move until it eats something in its way, there is a piece of its own colour in the way or it reaches the end of the board.

Knight: Can move [knight + (x : 1 , y :  2)], [knight + (x : -1 , y :  2)], [knight + (x : -2 , y :  1)], [knight + (x : 2 , y :  1)], [knight + (x : -1 , y :  -2)], [knight + (x : 1 , y :  -2)], [knight + (x : -2 , y :  -1)] and [knight + (x : 2 , y :  -1)].

Bishop: Can move in a diagonal pattern, forwards and backwards. If there is a piece in the path of its movement the bishop can eat it. Bishops can move an infinite amount of blocks in the directions they can move until it eats something in its way, there is a piece of its own colour in the way or it reaches the end of the board.

Queen: Can move like a bishop and a rook: forwards, backwards, left, right and diagonal. Queens can move an infinite amount of blocks in the directions they can move until it eats something in its way, there is a piece of its own colour in the way or it reaches the end of the board.

King: Can move one block per move: [king + (x : 1 , y :  1)], [king + (x : -1 , y :  -1)], [king + (x : -1 , y :  1)], [king + (x : 1 , y :  -1)], [king + (x : 0 , y :  1)], [king + (x : 0 , y :  -1)], [king + (x : 1 , y :  0)] and [king + (x : -1 , y :  0)].
 */
