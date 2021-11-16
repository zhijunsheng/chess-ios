//
//  BoardView.swift
//  chess
//
//  Created by Felix Lo on 2020/7/24.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    var cell: CGFloat = 75
    var originX: CGFloat = CGFloat.zero
    var originY: CGFloat = 50
    var shadowPieces: Set<Piece> = []
    var movingPieceImage: UIImage?
    var movingPieceX: CGFloat = CGFloat.zero
    var movingPieceY: CGFloat = CGFloat.zero
    
    var chessDelegate: ChessDelegate?
    var fromCol: Int = -1
    var fromRow: Int = -2
    
    override func draw(_ rect: CGRect) {
        cell = bounds.width/9
        originX = (bounds.width - cell * 8)/2
        originY = (bounds.height - cell * 8)/2
        
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let firstFinger = touches.first!
        let firstFingerLocation = firstFinger.location(in: self)
        
        let rawCol: CGFloat = (firstFingerLocation.x - originX)/cell
        let rawRow: CGFloat = (firstFingerLocation.y - originY)/cell
        fromCol = Int(rawCol)
        fromRow = Int(rawRow)
        
        if let piece = chessDelegate?.pieceAt(col: fromCol, row: fromRow) {
            movingPieceImage = UIImage(named: piece.imageName)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let firstFinger = touches.first!
        let firstFingerLocation = firstFinger.location(in: self)
        movingPieceX = firstFingerLocation.x
        movingPieceY = firstFingerLocation.y
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let firstFinger = touches.first!
        let firstFingerLocation = firstFinger.location(in: self)
        
        let rawCol: CGFloat = (firstFingerLocation.x - originX)/cell
        let rawRow: CGFloat = (firstFingerLocation.y - originY)/cell
        let col: Int = Int(rawCol)
        let row: Int = Int(rawRow)
        
        movingPieceImage = nil
        chessDelegate?.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: col, toRow: row)
        setNeedsDisplay()
    }
    
    
    
    func drawSquare(col: Int, row: Int, color: UIColor) {
        let colourPath = UIBezierPath()
        color.setFill()
        colourPath.move(to: CGPoint(x: CGFloat(col) * cell + originX, y: CGFloat(row) * cell + originY))
        colourPath.addLine(to: CGPoint(x: CGFloat(col) * cell + cell + originX, y: CGFloat(row) * cell + originY))
        colourPath.addLine(to: CGPoint(x: CGFloat(col) * cell + cell + originX, y: CGFloat(row) * cell + cell + originY))
        colourPath.addLine(to: CGPoint(x: CGFloat(col) * cell + originX, y: CGFloat(row) * cell + cell + originY))
        colourPath.fill()
    }
    
    func drawBoard() {
        let path = UIBezierPath()
        
        for i in 0 ..< 9 {
            path.move(to: CGPoint(x: CGFloat(i) * cell + originX, y: originY))
            path.addLine(to: CGPoint(x: CGFloat(i) * cell + originX, y: cell * 8 + originY))
            
            path.move(to: CGPoint(x: originX, y: CGFloat(i) * cell + originY))
            path.addLine(to: CGPoint(x: cell * 8 + originX, y: CGFloat(i) * cell + originY))
        }
        
        for j in 0 ... 3 {
            for i in 0 ... 3 {
                drawSquare(col: i * 2 + 1, row: j * 2, color: #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1))
                drawSquare(col: i * 2, row: j * 2 + 1, color: #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1))
                drawSquare(col: i * 2, row: j * 2, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                drawSquare(col: i * 2 + 1, row: j * 2 + 1, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            }
        }
        
        path.stroke()
    }
    
    func drawPieces() {
        for piece in shadowPieces {
            if movingPieceImage == nil {
                drawPiece(col: piece.col, row: piece.row)
            } else {
                if !(piece.col == fromCol && piece.row == fromRow) {
                    drawPiece(col: piece.col, row: piece.row)
                }
            }
        }
        
        movingPieceImage?.draw(in: CGRect(x: movingPieceX - cell/2, y: movingPieceY - cell/2, width: cell, height: cell))
    }
    
    func drawPiece(col: Int, row: Int) {
        guard let imageName = chessDelegate?.pieceAt(col: col, row: row)?.imageName else { return }
        let pieceImage = UIImage(named: imageName)
        pieceImage?.draw(in: CGRect(x: CGFloat(col) * cell + originX, y: CGFloat(row) * cell + originY, width: cell, height: cell))
    }
    
}

