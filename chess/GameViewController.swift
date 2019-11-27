//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.

import UIKit

class GameViewController: UIViewController, ChessDelegate {
    
    
    
    @IBOutlet weak var boardView: BoardView!
    var gameEngine = ChessGameEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameEngine.initialize()
        boardView.copyCatBox = gameEngine.box
        
        boardView.chessDelegate = self
    }
    
    func movePiece(startingCol: Int, startingRow: Int, endingCol: Int, endingRow: Int) {
        gameEngine.movePiece(startingCol: startingCol, startingRow: startingRow, endingCol: endingCol, endingRow: endingRow)
        boardView.copyCatBox = gameEngine.box
        boardView.setNeedsDisplay()
    }
}

