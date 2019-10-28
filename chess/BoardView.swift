//
//  BoardView.swift
//  chess
//
//  Created by Andy Yan on 2019-10-13.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    func drawPiece(col: Int, row: Int, imageName: String)  {
        let pieceImage = UIImage(named: imageName)
        pieceImage?.draw(in: CGRect(x: col * 80, y: row * 80, width: 80, height: 80))
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor) {
        let square = UIBezierPath(rect: CGRect(x: 80 * col, y: 80 * row, width: 80, height: 80))
        color.setFill()
        square.fill()
    }
    
    override func draw(_ rect: CGRect) {
        
        drawBoard()
        drawPieces()

    }
    
    func drawBoard()  {
        for i in 0..<4 {
            drawSquare(col: i * 2, row: 0, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            drawSquare(col: i * 2 + 1, row: 0, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            
            drawSquare(col: i * 2, row: 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: i * 2 + 1, row: 1, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            
            drawSquare(col: i * 2, row: 2, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            drawSquare(col: i * 2 + 1, row: 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            
            drawSquare(col: i * 2, row: 3, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: i * 2 + 1, row: 3, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            
            drawSquare(col: i * 2, row: 4, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            drawSquare(col: i * 2 + 1, row: 4, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            
            drawSquare(col: i * 2, row: 5, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: i * 2 + 1, row: 5, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            
            drawSquare(col: i * 2, row: 6, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
            drawSquare(col: i * 2 + 1, row: 6, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            
            drawSquare(col: i * 2, row: 7, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            drawSquare(col: i * 2 + 1, row: 7, color: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        }
    }
    
    func drawPieces()  {
        drawPiece(col: 3, row: 7, imageName: "king_chess_w")
        drawPiece(col: 4, row: 7, imageName: "queen_chess_w")
        drawPiece(col: 3, row: 0, imageName: "king_chess_b")
        drawPiece(col: 4, row: 0, imageName: "queen_chess_b")
        
        for i in 0..<2 {
            drawPiece(col: i * 7 + 0, row: 0, imageName: "rook_chess_b")
            drawPiece(col: i * 5 + 1, row: 0, imageName: "knight_chess_b")
            drawPiece(col: i * 3 + 2, row: 0, imageName: "bishop_chess_b")
            drawPiece(col: i * 7 + 0, row: 7, imageName: "rook_chess_w")
            drawPiece(col: i * 5 + 1, row: 7, imageName: "knight_chess_w")
            drawPiece(col: i * 3 + 2, row: 7, imageName: "bishop_chess_w")
            
        }
        
        for i in 0..<8 {
            drawPiece(col: i, row: 6, imageName: "pawn_chess_w")
            drawPiece(col: i, row: 1, imageName: "pawn_chess_b")
        }
    }
}
