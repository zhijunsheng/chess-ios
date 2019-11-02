//
//  BoardView.swift
//  chess
//
//  Created by Lambert Lin on 2019/10/16.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    override func draw(_ rect: CGRect) {
        print(bounds.width)


        
        
        for i in 0..<4 {
            
            drawSquare(col: 0, row: i * 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: 1, row: i * 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            drawSquare(col: 2, row: i * 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: 3, row: i * 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            drawSquare(col: 4, row: i * 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: 5, row: i * 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            drawSquare(col: 6, row: i * 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: 7, row: i * 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            
            
            drawSquare(col: 0, row: i * 2 + 1, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            drawSquare(col: 1, row: i * 2 + 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: 2, row: i * 2 + 1, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            drawSquare(col: 3, row: i * 2 + 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: 4, row: i * 2 + 1, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            drawSquare(col: 5, row: i * 2 + 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: 6, row: i * 2 + 1, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            drawSquare(col: 7, row: i * 2 + 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        }

        drawPiece(col: 3, row: 0, piece: "king_chess_b")
        drawPiece(col: 4, row: 0, piece: "queen_chess_b")
        drawPiece(col: 3, row: 7, piece: "king_chess_w")
        drawPiece(col: 4, row: 7, piece: "queen_chess_w")
        
        for i in 0..<8 { // column
            drawPiece(col: i, row: 1, piece: "pawn_chess_b")
            drawPiece(col: i, row: 6, piece: "pawn_chess_w")
        }
     
        for i in 0..<2 {
            drawPiece(col: i * 7, row: 0, piece: "rook_chess_b")
            drawPiece(col: i * 5 + 1, row: 0, piece: "knight_chess_b")
            drawPiece(col: i * 3 + 2, row: 0, piece: "bishop_chess_b")
            drawPiece(col: i * 7, row: 7, piece: "rook_chess_w")
            drawPiece(col: i * 5 + 1, row: 7, piece: "knight_chess_w")
            drawPiece(col: i * 3 + 2, row: 7, piece: "bishop_chess_w")
        }
    }
    
    func drawPiece(col: Int, row:Int, piece: String) {
        let blackRookImage = UIImage(named: piece)
        blackRookImage?.draw(in: CGRect(x: 91 * col, y: 91 * row, width: 91, height: 91))
        
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor)  {
        let square = UIBezierPath(rect: CGRect(x: 91 * col, y: 91 * row, width: 91, height:91 ))
        color.setFill()
        square.fill()
    }
    
    
    
    
}
