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
    
//    var keyPieceValueImageView: [Piece: UIImageView] = [:]
    private var fromCol: Int? = nil
    private var fromRow: Int? = nil
    @IBOutlet weak var boardView: BoardView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // you'll populate this guy: boardView.pieces
        
        
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
        
        
         //var piece: UIImageView = UIImageView(image: UIImage(named: "rook_chess_b"))
//        for i in 0...7 {
//            addPiece(image:#imageLiteral(resourceName: "pawn_chess_b"), row: 1, col: i)
//        }
//        for i in 0...7 {
//            addPiece(image: #imageLiteral(resourceName: "pawn_chess_w"), row: 6, col: i)
//        }
//        addPiece(image: #imageLiteral(resourceName: "rook_chess_b"), row: 0, col: 0)
//        addPiece(image: #imageLiteral(resourceName: "knight_chess_b"), row: 0, col: 1)
//        addPiece(image: #imageLiteral(resourceName: "bishop_chess_b"), row: 0, col: 2)
//        addPiece(image: #imageLiteral(resourceName: "queen_chess_b"), row: 0, col: 3)
//        addPiece(image: #imageLiteral(resourceName: "king_chess_b"), row: 0, col: 4)
//        addPiece(image: #imageLiteral(resourceName: "bishop_chess_b"), row: 0, col: 5)
//        addPiece(image: #imageLiteral(resourceName: "knight_chess_b"), row: 0, col: 6)
//        addPiece(image: #imageLiteral(resourceName: "rook_chess_b"), row: 0, col: 7)
//        addPiece(image: #imageLiteral(resourceName: "rook_chess_w"), row: 7, col: 0)
//        addPiece(image: #imageLiteral(resourceName: "knight_chess_w"), row: 7, col: 1)
//        addPiece(image: #imageLiteral(resourceName: "bishop_chess_w"), row: 7, col: 2)
//        addPiece(image: #imageLiteral(resourceName: "queen_chess_w"), row: 7, col: 3)
//        addPiece(image: #imageLiteral(resourceName: "king_chess_w"), row: 7, col: 4)
//        addPiece(image: #imageLiteral(resourceName: "bishop_chess_w"), row: 7, col: 5)
//        addPiece(image: #imageLiteral(resourceName: "knight_chess_w"), row: 7, col: 6)
//        addPiece(image: #imageLiteral(resourceName: "rook_chess_w"), row: 7, col: 7)
    }
    
    // =(^-.-^)= ~meow
//    func addPiece(image: UIImage, row: Int, col: Int) {
//        let piece: UIImageView = UIImageView(frame: CGRect(x: 60 + boardView.originX + boardView.side * CGFloat(col), y: 100 + boardView.originY + boardView.side * CGFloat(row), width: boardView.side, height: boardView.side))
//        piece.image = image
//        view.addSubview(piece)
//
//        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
//        piece.addGestureRecognizer(gestureRecognizer)
//        piece.isUserInteractionEnabled = true
//    }
    
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
        // types: Int, String, Double, Hashable, Class, Struct, Enum, etc.
        // defining methods: let, var, func, switch, timer, guard, etc.
    }
    
    
    
    @objc func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began {
            //
           
//            if let pieceView = gestureRecognizer.view {
//                changeScreentoLogic(x: pieceView.frame.origin.x, y: pieceView.frame.origin.y)
//            }
//            print(gestureRecognizer.view?.frame)
            
//            let translation = gestureRecognizer.translation(in: boardView)
//            changeScreentoLogic(x: translation.x, y: translation.y)
        }
        
//        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
//            let translation = gestureRecognizer.translation(in: boardView)
//            gestureRecognizer.view!.center = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
//            gestureRecognizer.setTranslation(CGPoint.zero, in: boardView)
//        }
        
        if gestureRecognizer.state == .ended {
//            let translation = gestureRecognizer.translation(in: boardView)
//            var piecePoint = CGPoint(x: gestureRecognizer.view!.center.x + translation.x, y: gestureRecognizer.view!.center.y + translation.y)
//            print(piecePoint)
//            print(boardView.frame.origin)
//            let destX = boardView.frame.origin.x + boardView.originX + boardView.side / 2
//            let destY = boardView.frame.origin.y + boardView.originY + boardView.side / 2
//
//            // x : 60 + 25 + 12.5
//            // y : 100 + 25 + 12.5
//            if abs(piecePoint.x - destX) < boardView.side / 2 && abs(piecePoint.y - destY) < boardView.side / 2 {
//                piecePoint.x = destX
//                piecePoint.y = destY
//                boardView.setNeedsDisplay()
//                print("✅accepted✅")
//            } else {
//                print("🚫rejected🚫")
//            }
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
        if var piece = pieceAt(row: Int(wxyz), col: Int(abcd), destX: Int(wxyz), destY: Int(abcd)) {
           // print("☡ !! FOUND PIECE !! ☡ \(piece.rank) \(piece.rank)")
            let successful = board.move(piece: piece, destinationRow: piece.row, destinationCol: piece.row)
            if board.move(piece: piece, destinationRow: piece.row, destinationCol: piece.row) == true {
                piece.col = Int(abcd)
                piece.row = Int(wxyz)
                print(successful)
                boardView.setNeedsDisplay()
            }
            print(successful)
            print(board)
            boardView.setNeedsDisplay()
        }
        
        // then we know which piece it is based on data pieces
    }
    
    func pieceAt(row: Int, col: Int, destX: Int, destY: Int) -> Piece? {
        for piece in board.pieces {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
    
//    if gestureRecognizer.state == .began {
//    if let pieceView = gestureRecognizer.view {
//    changeScreentoLogic(x: pieceView.frame.origin.x, y: pieceView.frame.origin.y)
//    }
    
    func addPiece(image: String, row: Int, col: Int, rank: Rank, isWhite: Bool) {
        let piece = Piece(row: row, col: col, imageName: image, isWhite: isWhite, rank: rank)
        board.pieces.insert(piece)
        
        let pieceImage = UIImage(named: image)
        let pieceImageView: UIImageView = UIImageView(frame: CGRect(x: boardView.originX + boardView.side * (CGFloat(col) - 0.5), y: boardView.originY + boardView.side * (CGFloat(row) - 0.5), width: boardView.side, height: boardView.side))
        pieceImageView.image = pieceImage
        view.addSubview(pieceImageView)
        
//        keyPieceValueImageView[piece] = pieceImageView
    }

}

