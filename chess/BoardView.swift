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
    var fingerX: CGFloat = 67
    var fingerY: CGFloat = 70
    var movingPiece: ChessPiece? = nil
    var pieceBoxShadow: Set<ChessPiece> = Set<ChessPiece>()
    var chessDelegate: ChessDelegate? = nil
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        fromCol = Int(fingerLocation.x/80)
        fromRow = Int(fingerLocation.y/80)
        movingPiece = chessDelegate?.pieceAt(locationX: fromCol, locationY: fromRow)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        let col: Int = Int(fingerLocation.x/80)
        let row: Int = Int(fingerLocation.y/80)
        movingPiece = nil
        chessDelegate?.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: col, toRow: row)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        fingerX = fingerLocation.x
        fingerY = fingerLocation.y
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        drawBoard()
        drawPieces()
        if let movingPiece = movingPiece {
            let movingPieceImage = UIImage(named: movingPiece.imageName)
            movingPieceImage?.draw(in: CGRect(x: fingerX - 40, y: fingerY - 40, width: 80, height: 80))
            
        }
    }
    
    func drawBoard() {
        for i in 0..<4 {
            for j in 0..<4 {
                drawSquareAt(col: j * 2 + 1, row: i * 2)
                drawSquareAt(col: j * 2, row: i * 2 + 1)
            }
        }
    }
    
    func drawPieces() {
        for piece in pieceBoxShadow {
            if movingPiece != piece {
                drawPieceAt(col: piece.col, row: piece.row, pieceName: piece.imageName)
            }
        }
    }
    
    func drawPieceAt(col: Int, row: Int, pieceName: String) {
        let drawPiece = UIImage(named: pieceName)
        drawPiece?.draw(in: CGRect(x: cellSide * CGFloat(col), y: cellSide * CGFloat(row), width: 80, height: 80))
    }
    
    func drawSquareAt(col:Int, row:Int) {
        let penS3 = UIBezierPath(rect: CGRect(x:(originX + cellSide * CGFloat(col)), y: (originY + cellSide * CGFloat(row)), width: cellSide, height: cellSide))
         #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).setFill()
        penS3.fill()
    }
}
