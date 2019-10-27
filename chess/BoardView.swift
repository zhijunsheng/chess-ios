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

        drawSquare(col: 0, row: 0, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 1, row: 0, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        drawSquare(col: 2, row: 0, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 3, row: 0, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        drawSquare(col: 4, row: 0, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 5, row: 0, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 6, row: 0, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 7, row: 0, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                             
      
        drawSquare(col: 0, row: 1, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 1, row: 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 2, row: 1, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 3, row: 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 4, row: 1, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 5, row: 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 6, row: 1, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 7, row: 1, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        
        drawSquare(col: 0, row: 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 1, row: 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 2, row: 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 3, row: 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 4, row: 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 5, row: 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 6, row: 2, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 7, row: 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                             
        
        drawSquare(col: 0, row: 3, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 1, row: 3, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 2, row: 3, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 3, row: 3, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 4, row: 3, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 5, row: 3, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 6, row: 3, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 7, row: 3, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
    
        drawSquare(col: 0, row: 4, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 1, row: 4, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 2, row: 4, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 3, row: 4, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 4, row: 4, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 5, row: 4, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 6, row: 4, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 7, row: 4, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                       
        drawSquare(col:0 , row: 5, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 1, row: 5, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col:2 , row: 5, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 3, row: 5, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 4, row: 5, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 5, row: 5, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 6, row: 5, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 7, row: 5, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))

        drawSquare(col: 0, row: 6, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col:1 , row: 6, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 2, row: 6, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 3, row: 6, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 4, row: 6, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 5, row: 6, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 6, row: 6, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col:7 , row: 6, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        drawSquare(col:0 , row: 7, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 1, row: 7, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col:2 , row: 7, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 3, row: 7, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 4, row: 7, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 5, row: 7, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        drawSquare(col: 6, row: 7, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        drawSquare(col: 7, row: 7, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))

        drawPiece(col: 0, row: 0, piece: "rook_chess_b")
        drawPiece(col: 1, row: 0, piece: "knight_chess_b")
        drawPiece(col: 2, row: 0, piece: "bishop_chess_b")
        drawPiece(col: 3, row: 0, piece: "king_chess_b")
        drawPiece(col: 4, row: 0, piece: "queen_chess_b")
        drawPiece(col: 5, row: 0, piece: "bishop_chess_b")
        drawPiece(col: 6, row: 0, piece: "knight_chess_b")
        drawPiece(col: 7, row: 0, piece: "rook_chess_b")
        
        
        for i in 0..<8 { // column
            drawPiece(col: i, row: 1, piece: "pawn_chess_b")
            drawPiece(col: i, row: 6, piece: "pawn_chess_w")
            
        }
        
        drawPiece(col: 0, row: 7, piece: "rook_chess_w")
        drawPiece(col: 1, row: 7, piece: "knight_chess_w")
        drawPiece(col: 2, row: 7, piece: "bishop_chess_w")
        drawPiece(col: 3, row: 7, piece: "king_chess_w")
        drawPiece(col: 4, row: 7, piece: "queen_chess_w")
        drawPiece(col: 5, row: 7, piece: "bishop_chess_w")
        drawPiece(col: 6, row: 7, piece: "knight_chess_w")
        drawPiece(col: 7, row: 7, piece: "rook_chess_w")

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
