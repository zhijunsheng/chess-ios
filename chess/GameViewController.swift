//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, ChessDelegate {
    
    @IBOutlet weak var boardView: BoardView!
    
    var chessBoard = ChessBoard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chessBoard.initializeBoard()
        boardView.chessPieces = chessBoard.pieces
        boardView.chessDelegate = self
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        chessBoard.initializeBoard()
        boardView.chessPieces = chessBoard.pieces
        boardView.setNeedsDisplay()
    }
    
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        chessBoard.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.chessPieces = chessBoard.pieces
        boardView.setNeedsDisplay()
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        return chessBoard.pieceAt(col: col, row: row)
    }
}
