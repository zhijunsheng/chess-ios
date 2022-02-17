//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, ChessDelegate {
    var game = ChessGame()
    
    @IBOutlet weak var chessView: ChessView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessView.delegate = self
        game.reset()
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        return game.pieceAt(col: col, row: row)
    }
}


