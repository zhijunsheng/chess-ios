//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var boardView: BoardView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0 ..< 2 {
            addPiece(piece: UIImage(named: "bishop_chess_b")!, col: 2 + i * 3, row: 7)
            addPiece(piece: UIImage(named: "bishop_chess_w")!, col: 2 + i * 3, row: 0)
        }
        
        for i in 0 ..< 8 {
            addPiece(piece: UIImage(named: "pawn_chess_b")!, col: i, row: 6)
            addPiece(piece: UIImage(named: "pawn_chess_w")!, col: i, row: 1)
        }
    }
    
    func addPiece(piece: UIImage, col: Int, row: Int) {
        let pieceImageView = UIImageView(frame: CGRect(x: boardView.originX + boardView.cellSide * CGFloat(col), y: boardView.originY + boardView.cellSide * CGFloat(row), width: boardView.cellSide, height: boardView.cellSide))
        pieceImageView.image = piece
        boardView.addSubview(pieceImageView)
        
    }

}

