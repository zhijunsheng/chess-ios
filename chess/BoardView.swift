//
//  BoardView.swift
//  chess
//
//  Created by Peter Shi on 2018-10-26.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    // define a constant of percentage, e.g 0.8
    
    var originX: CGFloat = 0
    var originY: CGFloat = 0
    let side: CGFloat = 40
    let margin: CGFloat = 7.5
    let blackSquare = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
    let whiteSquare = #colorLiteral(red: 0.951580584, green: 1, blue: 0.9881752133, alpha: 1)
    var pieces: Set<Piece> = Set<Piece>()
    
    override func draw(_ rect: CGRect) {
        
        // calculate how big side should be
        
        originX = (bounds.width - side * 8) / 2
        originY = (bounds.height - side * 8) / 2

        
        
        drawBoard()
        drawPieces()
    }
    
    private func drawSquare(x: CGFloat, y: CGFloat, color: UIColor) {
        let pen = UIBezierPath()
        pen.move(to: CGPoint(x: x, y: y))
        pen.addLine(to: CGPoint(x: x + side, y: y))
        pen.addLine(to: CGPoint(x: x + side, y: y + side))
        pen.addLine(to: CGPoint(x: x, y: y + side))
        pen.close()
        
        color.setFill()
        
        pen.fill()
    }
 
    private func drawBoard() {
        
        for i in 0..<8 {
            for j in 0..<8 {
                drawSquare(x: originX + side * CGFloat(j), y: originY + side * CGFloat(i), color: ((j + i) % 2 == 1) ? blackSquare : whiteSquare)
            }
        }
    }
    
    private func drawPiece(piece: Piece) {
        let pieceImage: UIImage = UIImage(named: piece.imageName)!
        let x = originX + side * CGFloat(piece.col)
        let y = originY + side * CGFloat(piece.row)
        
        pieceImage.draw(in: CGRect(x: x, y: y, width: side, height: side))
    }
    
    private func drawPieces() {
        for piece in pieces {
            drawPiece(piece: Piece(row: piece.row, col: piece.col, imageName: piece.imageName, isWhite: piece.isWhite, rank: piece.rank))
        }
        
//        drawPiece(piece: Piece(row: 0, col: 0, imageName: "rook_chess_b", isWhite: false, rank: .rook))
//        drawPiece(piece: Piece(row: 0, col: 1, imageName: "knight_chess_b", isWhite: false, rank: .knight))
//        drawPiece(piece: Piece(row: 0, col: 2, imageName: "bishop_chess_b", isWhite: false, rank: .bishop))
//        drawPiece(piece: Piece(row: 0, col: 3, imageName: "queen_chess_b", isWhite: false, rank: .queen))
//        drawPiece(piece: Piece(row: 0, col: 4, imageName: "king_chess_b", isWhite: false, rank: .king))
//        drawPiece(piece: Piece(row: 0, col: 5, imageName: "bishop_chess_b", isWhite: false, rank: .bishop))
//        drawPiece(piece: Piece(row: 0, col: 6, imageName: "knight_chess_b", isWhite: false, rank: .knight))
//        drawPiece(piece: Piece(row: 0, col: 7, imageName: "rook_chess_b", isWhite: false, rank: .rook))
//        drawPiece(piece: Piece(row: 7, col: 0, imageName: "rook_chess_w", isWhite: true, rank: .rook))
//        drawPiece(piece: Piece(row: 7, col: 1, imageName: "knight_chess_w", isWhite: true, rank: .knight))
//        drawPiece(piece: Piece(row: 7, col: 2, imageName: "bishop_chess_w", isWhite: true, rank: .bishop))
//        drawPiece(piece: Piece(row: 7, col: 3, imageName: "queen_chess_w", isWhite: true, rank: .queen))
//        drawPiece(piece: Piece(row: 7, col: 4, imageName: "king_chess_w", isWhite: true, rank: .king))
//        drawPiece(piece: Piece(row: 7, col: 5, imageName: "bishop_chess_w", isWhite: true, rank: .bishop))
//        drawPiece(piece: Piece(row: 7, col: 6, imageName: "knight_chess_w", isWhite: true, rank: .knight))
//        drawPiece(piece: Piece(row: 7, col: 7, imageName: "rook_chess_w", isWhite: true, rank: .rook))
//        for bpawnNo in 0...7 {
//            drawPiece(piece: Piece(row: 1, col: bpawnNo, imageName: "pawn_chess_b", isWhite: false, rank: .pawn))
//        }
//        for wpawnNo in 0...7 {
//            drawPiece(piece: Piece(row: 6, col: wpawnNo, imageName: "pawn_chess_w", isWhite: true, rank: .pawn))
//        }
    }
}
