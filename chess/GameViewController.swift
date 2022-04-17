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
    @IBOutlet weak var turnLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardView.chessDelegate = self
        
        cEngine.initGame()
        turnLabel.text = "White's turn"
        turnLabel.backgroundColor = .white
        turnLabel.textColor = .black
        boardView.setNeedsDisplay()
    }
    
    func pieceAt(col: Int, row: Int) -> Piece? {
        return cEngine.pieceAt(col: col, row: row)
    }
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard cEngine.canPieceMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) else {
            return
        }
        
        cEngine.moveP(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        if cEngine.whitesTurn {
            turnLabel.text = "White's turn"
            turnLabel.backgroundColor = .white
            turnLabel.textColor = .black
        } else {
            turnLabel.text = "Black's turn"
            turnLabel.backgroundColor = .black
            turnLabel.textColor = .white
        }
        print(cEngine)
        boardView.setNeedsDisplay()
    }
}
