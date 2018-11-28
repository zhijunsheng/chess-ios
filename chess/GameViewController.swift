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
        
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        piece.addGestureRecognizer(gestureRecognizer)
        piece.isUserInteractionEnabled = true
    }
    
    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began {
            if let pieceView = gestureRecognizer.view {
                changeScreentoLogic(x: pieceView.frame.origin.x, y: pieceView.frame.origin.y)
            }
//            print(gestureRecognizer.view?.frame)
            
//            let translation = gestureRecognizer.translation(in: boardView)
//            changeScreentoLogic(x: translation.x, y: translation.y)
        }
        
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let translation = gestureRecognizer.translation(in: boardView)
            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            gestureRecognizer.setTranslation(CGPoint.zero, in: boardView)
        }
        
        if gestureRecognizer.state == .ended {
            let translation = gestureRecognizer.translation(in: boardView)
            var piecePoint = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
            print(piecePoint)
            print(boardView.frame.origin)
            let destX = boardView.frame.origin.x + boardView.originX + boardView.side / 2
            let destY = boardView.frame.origin.y + boardView.originY + boardView.side / 2
            
            // x : 60 + 25 + 12.5
            // y : 100 + 25 + 12.5
            if abs(piecePoint.x - destX) < boardView.side / 2 && abs(piecePoint.y - destY) < boardView.side / 2 {
//                piecePoint.x = destX
//                piecePoint.y = destY
                boardView.setNeedsDisplay()
                print("✅accepted✅")
            } else {
                print("🚫rejected🚫")
            }
        }
    }
    
    func changeScreentoLogic(x: CGFloat, y: CGFloat) {
        print(boardView.frame)
        print("x = \(x), y = \(y)")
        // row = ?
        // col = ?
        // 85 => col 0, 110 => col 1
        // 85 = boardView.frame.origin.x + boardView.originX
        // 125 = boardView.frame.origin.y + boardView.originY
        //
        // 125 => row 0
        let abcd = (x - boardView.frame.origin.x - boardView.originX) / boardView.side
        print(abcd)
        
        let wxyz = (y - boardView.frame.origin.y - boardView.originY) / boardView.side
        print(wxyz)
        if let piece = pieceAt(row: Int(wxyz), col: Int(abcd)) {
            print("☡ !! FOUND PIECE !! ☡ \(piece.rank) \(piece.rank)")
            let successful = board.move(piece: piece, destinationRow: Int(wxyz), destinationCol: Int(abcd))
            print(successful)
            print(board)
            boardView.setNeedsDisplay()
        }
        
        // then we know which piece it is based on data pieces
    }
    
    func pieceAt(row: Int, col: Int) -> Piece? {
        for piece in board.pieces {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
}

