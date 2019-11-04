//
//  ChessBoard.swift
//  chess
//
//  Created by Grace Huang on 10/20/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessBoard: CustomStringConvertible{
    var pieceBox: Set<ChessPiece> = Set<ChessPiece>()
    
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
    var description: String {
        let singlePiece = pieceBox.first!
        
        
        
        var desc: String = ""
        desc += "  "

        for i in 0..<8 {
            desc += "\(i) "
        }
        
        desc += "\n"

        for row in 0..<8 {
            desc += "\(row) "

            for col in 0..<8 {
                if col == singlePiece.col && row == singlePiece.row{
                    desc += "Q "
                } else {
                    desc += ". "
                }
            }
            desc += "\n"
        }
        
        
        
        return desc
    }
    
    
}

