//
//  BoardView.swift
//  chess
//
//  Created by Grace Huang on 9/26/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    let originX: CGFloat = 0
    let originY: CGFloat = 0
    let cellSide: CGFloat = 80
    var fromCol: Int = -45
    var fromRow: Int = -45
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        fromCol = Int(fingerLocation.x/80)
        fromRow = Int(fingerLocation.y/80)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        let col: Int = Int(fingerLocation.x/80)
        let row: Int = Int(fingerLocation.y/80)
        
        print("from: (\(fromCol), \(fromRow)), to: (\(col), \(row))")
    }
    
    override func draw(_ rect: CGRect) {
        drawBoard()
        drawPieces()
    }
    
    func drawBoard() {
        for i in 0..<4 {
            drawSquareAt(col: 1, row: i + i)
            drawSquareAt(col: 3, row: i + i)
            drawSquareAt(col: 5, row: i + i)
            drawSquareAt(col: 7, row: i + i)
            drawSquareAt(col: 0, row: i * 2 + 1)
            drawSquareAt(col: 2, row: i * 2 + 1)
            drawSquareAt(col: 4, row: i * 2 + 1)
            drawSquareAt(col: 6, row: i * 2 + 1)
        }
    }
    
    func drawPieces() {
        drawPiecesAt(col: 4, row: 0, pieceName: "king_chess_b")
        drawPiecesAt(col: 3, row: 0, pieceName: "queen_chess_b")
        drawPiecesAt(col: 4, row: 7, pieceName: "king_chess_w")
        drawPiecesAt(col: 3, row: 7, pieceName: "queen_chess_w")
        
        for i in 0..<2 {
            drawPiecesAt(col: i * 3 + 2, row: 0, pieceName: "bishop_chess_b")
            drawPiecesAt(col: i * 3 + 2, row: 7, pieceName: "bishop_chess_w")
            
            drawPiecesAt(col: i * 5 + 1, row: 0, pieceName: "knight_chess_b")
            drawPiecesAt(col: i * 5 + 1, row: 7, pieceName: "knight_chess_w")
            
            drawPiecesAt(col: i * 7, row: 0, pieceName: "rook_chess_b")
            drawPiecesAt(col: i * 7, row: 7, pieceName: "rook_chess_w")
        }
        
        for i in 0..<8 {
            drawPiecesAt(col: i, row: 1, pieceName: "pawn_chess_b")
            drawPiecesAt(col: i, row: 6, pieceName: "pawn_chess_w")
        }
    }
    
    func drawPiecesAt(col: Int, row: Int, pieceName: String) {
        let drawPiece = UIImage(named: pieceName)
        drawPiece?.draw(in: CGRect(x: cellSide * CGFloat(col), y: cellSide * CGFloat(row), width: 80, height: 80))
    }
    
    func drawSquareAt(col:Int, row:Int) {
        let penS3 = UIBezierPath(rect: CGRect(x:(originX + cellSide * CGFloat(col)), y: (originY + cellSide * CGFloat(row)), width: cellSide, height: cellSide))
         #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).setFill()
        penS3.fill()
    }
}
