//
//  CanvasView.swift
//  chess
//
//  Created by Angie Yan on 2019-10-09.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//


import UIKit 

class CanvasView: UIView {

    override func draw(_ rect: CGRect) {
     
        for i in 0..<4 {
            drawBlackSquare(col: i * 2 + 1, row: 0)
            drawBlackSquare(col: i * 2, row: 1)
            drawBlackSquare(col: i * 2 + 1, row: 2)
            drawBlackSquare(col: i * 2, row: 3)
            drawBlackSquare(col: i * 2 + 1, row: 4)
            drawBlackSquare(col: i * 2, row: 5)
            drawBlackSquare(col: i * 2 + 1, row: 6)
            drawBlackSquare(col: i * 2, row: 7)
        }

        for i in 0..<4 {
            drawSquare(col: i * 2, row: 0)
            drawSquare(col: i * 2 + 1, row: 1)
            drawSquare(col: i * 2, row: 2)
            drawSquare(col: i * 2 + 1, row: 3)
            drawSquare(col: i * 2, row: 4)
            drawSquare(col: i * 2 + 1, row: 5)
            drawSquare(col: i * 2, row: 6)
            drawSquare(col: i * 2 + 1, row: 7)
        }

        

        drawPiece(imageName: "king_chess_b", col: 3, row: 7)
        drawPiece(imageName: "queen_chess_b", col: 4, row: 7)
        drawPiece(imageName: "king_chess_w", col: 3, row: 0)
        drawPiece(imageName: "queen_chess_w", col: 4, row: 0)
        
        for i in 0..<2 {
            drawPiece(imageName: "rook_chess_w", col: i * 7, row: 0)
            drawPiece(imageName: "knight_chess_w", col: i * 5 + 1, row: 0)
            drawPiece(imageName: "bishop_chess_w", col: i * 3 + 2, row: 0)
            drawPiece(imageName: "rook_chess_b", col: i * 7, row: 7)
            drawPiece(imageName: "bishop_chess_b", col: i * 3 + 2, row: 7)
            drawPiece(imageName: "knight_chess_b", col: i * 5 + 1, row: 7)
        }
        
        for i in 0..<8 {
            drawPiece(imageName: "pawn_chess_w", col: i, row: 1)
            drawPiece(imageName: "pawn_chess_b", col: i, row: 6)
        }
    }
    
    func drawPiece(imageName: String, col: Int, row: Int) {
        let pieceImage = UIImage(named: imageName)
        pieceImage?.draw(in: CGRect(x: 80 * col, y: 80 * row, width: 80, height: 80))
    }
    
    func drawSquare(col: Int, row: Int) {
        let whiteSquare = UIBezierPath(rect: CGRect(x: 80 * col, y: 80 * row, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare.fill()
        whiteSquare.stroke()
    }
    
    func drawBlackSquare(col: Int, row: Int) {
        let blackSquare = UIBezierPath(rect: CGRect(x: 80 * col, y: 80 * row, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        blackSquare.fill()
    }

    
    
}


