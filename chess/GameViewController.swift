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
    }
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        
    }
}
