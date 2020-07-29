//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var cEngine = ChessEngine()
    
    @IBOutlet weak var boardView: BoardView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cEngine.initGame()
        boardView.shadowPieces = cEngine.pieces
        boardView.setNeedsDisplay()
    }
}
