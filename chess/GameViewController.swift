//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, ChessDelegate {
    
    
    private var board = Board()
    private var fromCol: Int? = nil
    private var fromRow: Int? = nil
    @IBOutlet weak var boardView: BoardView!
    private var thingImageView: UIImageView? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.chessDelagate = self
        
        board.pieces.insert(Piece(col: 0, row: 0, imageName: "rook_chess_b", isWhite: false, rank: .rook))
        board.pieces.insert(Piece(col: 1, row: 0, imageName: "knight_chess_b", isWhite: false, rank: .knight))
        board.pieces.insert(Piece(col: 2, row: 0, imageName: "bishop_chess_b", isWhite: false, rank: .bishop))
        board.pieces.insert(Piece(col: 3, row: 0, imageName: "queen_chess_b", isWhite: false, rank: .queen))
        board.pieces.insert(Piece(col: 4, row: 0, imageName: "king_chess_b", isWhite: false, rank: .king))
        board.pieces.insert(Piece(col: 5, row: 0, imageName: "bishop_chess_b", isWhite: false, rank: .bishop))
        board.pieces.insert(Piece(col: 6, row: 0, imageName: "knight_chess_b", isWhite: false, rank: .knight))
        board.pieces.insert(Piece(col: 7, row: 0, imageName: "rook_chess_b", isWhite: false, rank: .rook))
        board.pieces.insert(Piece(col: 0, row: 7, imageName: "rook_chess_w", isWhite: true, rank: .rook))
        board.pieces.insert(Piece(col: 1, row: 7, imageName: "knight_chess_w", isWhite: true, rank: .knight))
        board.pieces.insert(Piece(col: 2, row: 7, imageName: "bishop_chess_w", isWhite: true, rank: .bishop))
        board.pieces.insert(Piece(col: 3, row: 7, imageName: "queen_chess_w", isWhite: true, rank: .queen))
        board.pieces.insert(Piece(col: 4, row: 7, imageName: "king_chess_w", isWhite: true, rank: .king))
        board.pieces.insert(Piece(col: 5, row: 7, imageName: "bishop_chess_w", isWhite: true, rank: .bishop))
        board.pieces.insert(Piece(col: 6, row: 7, imageName: "knight_chess_w", isWhite: true, rank: .knight))
        board.pieces.insert(Piece(col: 7, row: 7, imageName: "rook_chess_w", isWhite: true, rank: .rook))
        
        for bpawnNo in 0...7 {
            board.pieces.insert(Piece(col: bpawnNo, row: 1, imageName: "pawn_chess_b", isWhite: false, rank: .pawn))
        }
        for wpawnNo in 0...7 {
            board.pieces.insert(Piece(col: wpawnNo, row: 6, imageName: "pawn_chess_w", isWhite: true, rank: .pawn))
        }

        boardView.pieces = board.pieces
    }
    
    func move(startX: Int, startY: Int, endX: Int, endY: Int) {
        board.movePiece(fromCol: startX, fromRow: startY, toCol: endX, toRow: endY)
        boardView.pieces = board.pieces
        boardView.setNeedsDisplay()
    }
    
    func nearestSquare(clicked: CGFloat) -> Int {
        return Int(floor(clicked))
    }
    
    func pieceAt(row: Int, col: Int, destX: Int, destY: Int) -> Piece? {
        for piece in board.pieces {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
    
    func addPiece(image: String, row: Int, col: Int, rank: Rank, isWhite: Bool) {
        let piece = Piece(col: col, row: row, imageName: image, isWhite: isWhite, rank: rank)
        board.pieces.insert(piece)
        
        let pieceImage = UIImage(named: image)
        let pieceImageView: UIImageView = UIImageView(frame: CGRect(x: boardView.originX + boardView.side * (CGFloat(col) - 0.5), y: boardView.originY + boardView.side * (CGFloat(row) - 0.5), width: boardView.side, height: boardView.side))
        pieceImageView.image = pieceImage
        view.addSubview(pieceImageView)
    }
}
