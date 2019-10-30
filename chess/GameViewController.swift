//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, ChessDelegate { // C of MVC
    
    private var board = Board() // M of MVC design pattern
    private var fromCol: Int? = nil
    private var fromRow: Int? = nil
    @IBOutlet weak var boardView: BoardView! // V of MVC
    private var thingImageView: UIImageView? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.chessDelagate = self
        
        board.initPieces()
        boardView.pieces = board.pieces
    }
    
    @IBAction func withdraw(_ sender: UIButton) {
        board.withdraw()
        boardView.pieces = board.pieces
        boardView.setNeedsDisplay()
    }
    
    
    func move(startX: Int, startY: Int, endX: Int, endY: Int) {
        board.movePiece(fromCol: startX, fromRow: startY, toCol: endX, toRow: endY)
        for piece in board.pieces {
            if board.canPromote(col: piece.col, row: piece.row, isWhite: piece.isWhite) {
                let alert = UIAlertController(title: "PROMOTION!!!", message: "What do you want to promote into?", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Knight", style: .default, handler: { (UIAlertAction) in
                    self.board.pieces.remove(piece)
                    self.board.pieces.insert(Piece(col: piece.col, row: piece.row, imageName: piece.isWhite ? "knight_chess_w" : "knight_chess_b", isWhite: piece.isWhite, rank: .knight))
                    self.boardView.pieces = self.board.pieces
                    self.boardView.setNeedsDisplay()
                }))
                alert.addAction(UIAlertAction(title: "Bishop", style: .default, handler: { (UIAlertAction) in
                    self.board.pieces.remove(piece)
                    self.board.pieces.insert(Piece(col: piece.col, row: piece.row, imageName: piece.isWhite ? "bishop_chess_w" : "bishop_chess_b", isWhite: piece.isWhite, rank: .bishop))
                    self.boardView.pieces = self.board.pieces
                    self.boardView.setNeedsDisplay()
                }))
                alert.addAction(UIAlertAction(title: "Rook", style: .default, handler: { (UIAlertAction) in
                    self.board.pieces.remove(piece)
                    self.board.pieces.insert(Piece(col: piece.col, row: piece.row, imageName: piece.isWhite ? "rook_chess_w" : "rook_chess_b", isWhite: piece.isWhite, rank: .rook))
                    self.boardView.pieces = self.board.pieces
                    self.boardView.setNeedsDisplay()
                    
                }))
                alert.addAction(UIAlertAction(title: "Queen", style: .default, handler: { (UIAlertAction) in
                    self.board.pieces.remove(piece)
                    self.board.pieces.insert(Piece(col: piece.col, row: piece.row, imageName: piece.isWhite ? "queen_chess_w" : "queen_chess_b", isWhite: piece.isWhite, rank: .queen))
                    self.boardView.pieces = self.board.pieces
                    self.boardView.setNeedsDisplay()
                }))
                
                if let popoverController = alert.popoverPresentationController {
                    popoverController.sourceView = self.view
                    popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                    popoverController.permittedArrowDirections = []
                    
                    
                }
                
                self.present(alert, animated: true, completion: nil)
            }
        }
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
