//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    private var board = Board()
    private var fromCol: Int? = nil
    private var fromRow: Int? = nil
    @IBOutlet weak var boardView: BoardView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        board.pieces.insert(Piece(row: 0, col: 0, imageName: "rook_chess_b", isWhite: false, rank: .rook))
        board.pieces.insert(Piece(row: 0, col: 1, imageName: "knight_chess_b", isWhite: false, rank: .knight))
        board.pieces.insert(Piece(row: 0, col: 2, imageName: "bishop_chess_b", isWhite: false, rank: .bishop))
        board.pieces.insert(Piece(row: 0, col: 3, imageName: "queen_chess_b", isWhite: false, rank: .queen))
        board.pieces.insert(Piece(row: 0, col: 4, imageName: "king_chess_b", isWhite: false, rank: .king))
        board.pieces.insert(Piece(row: 0, col: 5, imageName: "bishop_chess_b", isWhite: false, rank: .bishop))
        board.pieces.insert(Piece(row: 0, col: 6, imageName: "knight_chess_b", isWhite: false, rank: .knight))
        board.pieces.insert(Piece(row: 0, col: 7, imageName: "rook_chess_b", isWhite: false, rank: .rook))
        board.pieces.insert(Piece(row: 7, col: 0, imageName: "rook_chess_w", isWhite: true, rank: .rook))
        board.pieces.insert(Piece(row: 7, col: 1, imageName: "knight_chess_w", isWhite: true, rank: .knight))
        board.pieces.insert(Piece(row: 7, col: 2, imageName: "bishop_chess_w", isWhite: true, rank: .bishop))
        board.pieces.insert(Piece(row: 7, col: 3, imageName: "queen_chess_w", isWhite: true, rank: .queen))
        board.pieces.insert(Piece(row: 7, col: 4, imageName: "king_chess_w", isWhite: true, rank: .king))
        board.pieces.insert(Piece(row: 7, col: 5, imageName: "bishop_chess_w", isWhite: true, rank: .bishop))
        board.pieces.insert(Piece(row: 7, col: 6, imageName: "knight_chess_w", isWhite: true, rank: .knight))
        board.pieces.insert(Piece(row: 7, col: 7, imageName: "rook_chess_w", isWhite: true, rank: .rook))
        
        for bpawnNo in 0...7 {
            board.pieces.insert(Piece(row: 1, col: bpawnNo, imageName: "pawn_chess_b", isWhite: false, rank: .pawn))
        }
        for wpawnNo in 0...7 {
            board.pieces.insert(Piece(row: 6, col: wpawnNo, imageName: "pawn_chess_w", isWhite: true, rank: .pawn))
        }

        
        boardView.pieces = board.pieces
        print(board)
    }
    
    func nearestSquare(clicked: CGFloat) -> Int {
        return Int(floor(clicked))
    }
    
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began {
            let fingerX = sender.location(in: boardView).x
            let fingerY = sender.location(in: boardView).y

            fromCol = Utils.xyToColRow(xy: fingerX, orgXY: boardView.originX, side: boardView.side, margin: boardView.margin)
            fromRow = Utils.xyToColRow(xy: fingerY, orgXY: boardView.originY, side: boardView.side, margin: boardView.margin)
            
        } else if sender.state == .ended {
            
            let fingerX = sender.location(in: boardView).x
            let fingerY = sender.location(in: boardView).y
            
            guard let fromCol = fromCol, let fromRow = fromRow, let toCol = Utils.xyToColRow(xy: fingerX, orgXY: boardView.originX, side: boardView.side, margin: boardView.margin), let toRow = Utils.xyToColRow(xy: fingerY, orgXY: boardView.originY, side: boardView.side, margin: boardView.margin) else {
                return
            }
            
            board.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
            boardView.pieces = board.pieces
            print(fromCol, fromRow, toCol, toRow)
            print(board)
            boardView.setNeedsDisplay()
        }
        
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
        let piece = Piece(row: row, col: col, imageName: image, isWhite: isWhite, rank: rank)
        board.pieces.insert(piece)
        
        let pieceImage = UIImage(named: image)
        let pieceImageView: UIImageView = UIImageView(frame: CGRect(x: boardView.originX + boardView.side * (CGFloat(col) - 0.5), y: boardView.originY + boardView.side * (CGFloat(row) - 0.5), width: boardView.side, height: boardView.side))
        pieceImageView.image = pieceImage
        view.addSubview(pieceImageView)
    }
}
