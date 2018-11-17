//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var board = Board()
    
    
    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.pieces = [
            Piece(row: 0, col: 0, isWhite: false, rank: .rook),
            Piece(row: 0, col: 1, isWhite: false, rank: .knight),
            Piece(row: 0, col: 2, isWhite: false, rank: .bishop),
            Piece(row: 0, col: 3, isWhite: false, rank: .queen),
            Piece(row: 0, col: 4, isWhite: false, rank: .king),
            Piece(row: 0, col: 5, isWhite: false, rank: .bishop),
            Piece(row: 0, col: 6, isWhite: false, rank: .knight),
            Piece(row: 0, col: 7, isWhite: false, rank: .rook),
            Piece(row: 7, col: 0, isWhite: true, rank: .rook),
            Piece(row: 7, col: 1, isWhite: true, rank: .knight),
            Piece(row: 7, col: 2, isWhite: true, rank: .bishop),
            Piece(row: 7, col: 3, isWhite: true, rank: .queen),
            Piece(row: 7, col: 4, isWhite: true, rank: .king),
            Piece(row: 7, col: 5, isWhite: true, rank: .bishop),
            Piece(row: 7, col: 6, isWhite: true, rank: .knight),
            Piece(row: 7, col: 7, isWhite: true, rank: .rook),
        ]
        
        for bpawnNo in 0...7 {
            board.pieces += [Piece(row: 1, col: bpawnNo, isWhite: false, rank: .pawn)
            ]
        }
        for wpawnNo in 0...7 {
            board.pieces += [Piece(row: 6, col: wpawnNo, isWhite: true, rank: .pawn)
            ]
        }
        
        print(board)
        
        print(boardView)
        
         //var piece: UIImageView = UIImageView(image: UIImage(named: "rook_chess_b"))
        for i in 0...7 {
            addPiece(image:#imageLiteral(resourceName: "pawn_chess_b"), row: 1, col: i)
        }
        for i in 0...7 {
            addPiece(image: #imageLiteral(resourceName: "pawn_chess_w"), row: 6, col: i)
        }
        addPiece(image: #imageLiteral(resourceName: "rook_chess_b"), row: 0, col: 0)
        addPiece(image: #imageLiteral(resourceName: "knight_chess_b"), row: 0, col: 1)
        addPiece(image: #imageLiteral(resourceName: "bishop_chess_b"), row: 0, col: 2)
        addPiece(image: #imageLiteral(resourceName: "queen_chess_b"), row: 0, col: 3)
        addPiece(image: #imageLiteral(resourceName: "king_chess_b"), row: 0, col: 4)
        addPiece(image: #imageLiteral(resourceName: "bishop_chess_b"), row: 0, col: 5)
        addPiece(image: #imageLiteral(resourceName: "knight_chess_b"), row: 0, col: 6)
        addPiece(image: #imageLiteral(resourceName: "rook_chess_b"), row: 0, col: 7)
        addPiece(image: #imageLiteral(resourceName: "rook_chess_w"), row: 7, col: 0)
        addPiece(image: #imageLiteral(resourceName: "knight_chess_w"), row: 7, col: 1)
        addPiece(image: #imageLiteral(resourceName: "bishop_chess_w"), row: 7, col: 2)
        addPiece(image: #imageLiteral(resourceName: "queen_chess_w"), row: 7, col: 3)
        addPiece(image: #imageLiteral(resourceName: "king_chess_w"), row: 7, col: 4)
        addPiece(image: #imageLiteral(resourceName: "bishop_chess_w"), row: 7, col: 5)
        addPiece(image: #imageLiteral(resourceName: "knight_chess_w"), row: 7, col: 6)
        addPiece(image: #imageLiteral(resourceName: "rook_chess_w"), row: 7, col: 7)
    }
    // =(^-.-^)= ~meow
    func addPiece(image: UIImage, row: Int, col: Int) {
        let piece: UIImageView = UIImageView(frame: CGRect(x: 60 + boardView.originX + boardView.side * CGFloat(col), y: 100 + boardView.originY + boardView.side * CGFloat(row), width: boardView.side, height: boardView.side))
        piece.image = image
        view.addSubview(piece)
    }
}

