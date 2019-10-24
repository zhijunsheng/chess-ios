//
//  ChessBoard.swift
//  chess
//
//  Created by Grace Huang on 10/20/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

struct ChessBoard: CustomStringConvertible{
    
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
        var desc: String = ""
        desc += "  "

        for i in 0..<8 {
            desc += "\(i) "
        }
        
        desc += "\n"

        for j in 0..<8 {
            desc += "\(j) "

            for i in 0..<8 {
                desc += ". "
            }
            desc += "\n"
        }
        
        
        
        return desc
    }
    
    
}

