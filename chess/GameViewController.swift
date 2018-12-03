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
            addPiece(piece: UIImage(named: "rook_chess_b")!, col: 0 + i * 7, row: 7)
             addPiece(piece: UIImage(named: "rook_chess_w")!, col: 0 + i * 7, row: 0)
            addPiece(piece: UIImage(named: "knight_chess_b")!, col: 1 + i * 5, row: 7)
            addPiece(piece: UIImage(named: "knight_chess_w")!, col: 1 + i * 5, row: 0)
        }
        
        for i in 0 ..< 8 {
            addPiece(piece: UIImage(named: "pawn_chess_b")!, col: i, row: 6)
            addPiece(piece: UIImage(named: "pawn_chess_w")!, col: i, row: 1)
        }
        
        addPiece(piece: UIImage(named: "queen_chess_b")!, col: 3, row: 7)
        addPiece(piece: UIImage(named: "queen_chess_w")!, col: 3, row: 0)
        
        addPiece(piece: UIImage(named: "king_chess_b")!, col: 4, row: 7)
        addPiece(piece: UIImage(named: "king_chess_w")!, col: 4, row: 0)
    }
    
    func addPiece(piece: UIImage, col: Int, row: Int) {
        let pieceImageView = UIImageView(frame: CGRect(x: boardView.originX + boardView.cellSide * CGFloat(col), y: boardView.originY + boardView.cellSide * CGFloat(row), width: boardView.cellSide, height: boardView.cellSide))
        pieceImageView.image = piece
        boardView.addSubview(pieceImageView)
        
    }

}

