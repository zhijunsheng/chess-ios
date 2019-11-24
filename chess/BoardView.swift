//
//  BoardView.swift
//  chess
//
//  Created by Lambert Lin on 2019/10/16.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    var cellSide: CGFloat = -34567788
    var fingerX: CGFloat = -78790909
    var fingerY: CGFloat = -7878781314
    var shadowPieceBox: Set<ChessPiece> = Set<ChessPiece>()
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        print("(\(fingerLocation.x), \(fingerLocation.y))") // (234.2, 103.7)
        fingerX = fingerLocation.x
        fingerY = fingerLocation.y
        setNeedsDisplay()
    }
    override func draw(_ rect: CGRect) {
        for i in 0..<8 {
            shadowPieceBox.insert(ChessPiece(col: 1 * i, row: 1, rank: "pawn", isBlack: true, imageName: "pawn_chess_b"))
            shadowPieceBox.insert(ChessPiece(col: 1 * i, row: 6, rank: "pawn", isBlack: false, imageName: "pawn_chess_w"))
        }
        for i in 0..<2 {
             shadowPieceBox.insert(ChessPiece(col: 0 + i * 7, row: 0, rank: "rook", isBlack: true, imageName: "rook_chess_b"))
             shadowPieceBox.insert(ChessPiece(col: 1 + i * 5, row: 0, rank: "knghit", isBlack: true, imageName: "knight_chess_b"))
             shadowPieceBox.insert(ChessPiece(col: 2 + i * 3, row: 0, rank: "bishop", isBlack: true, imageName: "bishop_chess_b"))
            shadowPieceBox.insert(ChessPiece(col: 0 + i * 7, row: 7, rank: "rook", isBlack: false, imageName: "rook_chess_w"))
            shadowPieceBox.insert(ChessPiece(col: 1 + i * 5, row: 7, rank: "knghit", isBlack: false, imageName: "knight_chess_w"))
            shadowPieceBox.insert(ChessPiece(col: 2 + i * 3, row: 7, rank: "bishop", isBlack: false, imageName: "bishop_chess_w"))
        }
        
        let  bK = ChessPiece(col: 3, row: 0, rank: "king", isBlack: true, imageName: "king_chess_b")
        shadowPieceBox.insert(bK)
        
        shadowPieceBox.insert(ChessPiece(col: 4, row: 0, rank: "queen", isBlack: true, imageName: "queen_chess_b"))
        shadowPieceBox.insert(ChessPiece(col: 3, row: 7, rank: "king", isBlack: false, imageName: "king_chess_w"))
        shadowPieceBox.insert(ChessPiece(col: 4, row: 7, rank: "queen", isBlack: false, imageName: "queen_chess_w"))
        
        print(bounds.width)
        cellSide = bounds.width / 8
        drawBoard()
        drawPieces()
        
        let blackRookImage = UIImage(named: "king_chess_b")
        blackRookImage?.draw(in: CGRect(x: fingerX -  cellSide/2 ,y: fingerY -  cellSide / 2 , width: cellSide, height:  cellSide))
    }
    func drawBoard() {
        for i in 0..<4 {
            for j in 0..<4 {
                drawSquare(col: j * 2, row: i * 2, color:     #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                drawSquare(col: j * 2 + 1, row: i * 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                drawSquare(col: j * 2, row: i * 2 + 1, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                drawSquare(col: j * 2 + 1, row: i * 2 + 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            }
        }
    }
    
    func drawPieces() {
        for chessPiece in shadowPieceBox {
            print("\(chessPiece.col), \(chessPiece.row), \(chessPiece.rank), \(chessPiece.isBlack)")
            drawPiece(col: chessPiece.col, row: chessPiece.row, piece: chessPiece.imageName)
        }
    }
    
    func drawPiece(col: Int, row:Int, piece: String) {
        let blackRookImage = UIImage(named: piece)
        blackRookImage?.draw(in: CGRect(x: cellSide * CGFloat(col), y: cellSide * CGFloat(row), width: cellSide, height: cellSide))
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor) {
        let square = UIBezierPath(rect: CGRect(x: cellSide * CGFloat(col), y: cellSide * CGFloat(row), width: cellSide, height: cellSide))
        color.setFill()
        square.fill()
    }
}
