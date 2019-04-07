//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var boardView: BoardView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ringook_chess_b
        // queen_chess_b
        
        let wreck = CGRect(x:  boardView.originXForBoard + boardView.cellSide * 3, y: boardView.originYForFirstSquare, width: boardView.cellSide, height: boardView.cellSide)
        let fightingImage = UIImage(named: "queen_chess_b")
        let pieceImageView = UIImageView(frame: wreck)
        pieceImageView.image = fightingImage
        boardView.addSubview(pieceImageView)
        
        let wreck1 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * 4, y: boardView.originYForFirstSquare, width: boardView.cellSide, height: boardView.cellSide)
        let fightingImage1 = UIImage(named: "king_chess_b")
        let pieceImageView1 = UIImageView(frame: wreck1)
        pieceImageView1.image = fightingImage1
        boardView.addSubview(pieceImageView1)
        
        let wreck2 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * 4, y: boardView.originYForFirstSquare + boardView.cellSide * 7, width: boardView.cellSide, height: boardView.cellSide)
        let fightingImage2 = UIImage(named: "king_chess_w")
        let pieceImageView2 = UIImageView(frame: wreck2)
        pieceImageView2.image = fightingImage2
        boardView.addSubview(pieceImageView2)
        
        let wreck3 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * 6, y: boardView.originYForFirstSquare, width: boardView.cellSide, height: boardView.cellSide)
        let fightingImage3 = UIImage(named: "knight_chess_b")
        let pieceImageView3 = UIImageView(frame: wreck3)
        pieceImageView3.image = fightingImage3
        boardView.addSubview(pieceImageView3)
    }

}

