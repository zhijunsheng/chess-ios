//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, ChessDelegate {
    
    var gameManager: GameLogic = GameLogic()
    @IBOutlet weak var chessView: ChessView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessView.delegate = self
        gameManager.restart()
    }

    func pieceAt(column: Int, row: Int) -> ChessPiece? {
        return gameManager.pieceAt(column: column, row: row)
    }
    
    func move(fromX: Int, fromY: Int, toX: Int, toY: Int) {
        gameManager.move(fromX: fromX, fromY: fromY, toX: toX, toY: toY)
        chessView.setNeedsDisplay()
    }
}

