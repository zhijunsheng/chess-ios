//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, ChessDelegate {
    
    var cEngine = ChessEngine()
    
    @IBOutlet weak var boardView: BoardView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.chessDelegate = self
        
        cEngine.initGame()
        boardView.shadowPieces = cEngine.pieces
        boardView.setNeedsDisplay()
        
        

        let piece = cEngine.pieceAt(col: 2, row: 0)
        print(piece?.rank)
        
        
        let n = 15
        let divisor = 7
        
        for i in 0 ..< divisor - 1 {
            if n % divisor == i + 1 {
                print("n is not a multiple of \(divisor)")
            } else {
               print("n is a multiple of \(divisor)")
            }
        }
        
        let a = 17
        
        print(a % 3) // 2
        print(a / 3) // 5
        print(a % 3 == 0)
        print((a + 1) % 3 == 0)
    }
    
    func pieceAt(col: Int, row: Int) -> Piece? {
        return cEngine.pieceAt(col: col, row: row)
    }
}
