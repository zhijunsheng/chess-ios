//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var chessBoard = ChessBoard()
    

    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chessBoard.reset()
        boardView.pieceBoxShadow = chessBoard.pieceBox
        
        
    }

}

