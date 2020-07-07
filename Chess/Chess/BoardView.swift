//
//  BoardView.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-06-03.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let ratio: CGFloat = 1.0
    var originX: CGFloat = -10
    var originY: CGFloat = -10
    var cellSide: CGFloat = -10
    
    var shadowPieces: Set<ChessPiece> = Set<ChessPiece>()
    var chessDelegate: ChessDelegate? = nil
    
    var fromCol: Int? = nil
    var fromRow: Int? = nil
    
    var movingImage: UIImage? = nil
    var movingPieceX: CGFloat = -1
    var movingPieceY: CGFloat = -1
    
    var blackAtTop = true
    
    var imageByName: [String: UIImage] = [:]
    var deviceShared = false

    override func draw(_ rect: CGRect) {
        cellSide = bounds.width * ratio / 8
        originX = bounds.width * (1 - ratio) / 2
        originY = bounds.height * (1 - ratio) / 2
        
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        fromCol = p2p(Int((fingerLocation.x - originX) / cellSide))
        fromRow = p2p(Int((fingerLocation.y - originY) / cellSide))
        
        if let fromCol = fromCol, let fromRow = fromRow, let movingPiece = chessDelegate?.pieceAt(col: fromCol, row: fromRow) {
            movingImage = image(named: movingPiece.imageName)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        movingPieceX = fingerLocation.x
        movingPieceY = fingerLocation.y
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        
        let toCol: Int = p2p(Int((fingerLocation.x - originX) / cellSide))
        let toRow: Int = p2p(Int((fingerLocation.y - originY) / cellSide))
        
        if let fromCol = fromCol, let fromRow = fromRow, fromCol != toCol || fromRow != toRow {
            chessDelegate?.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        movingImage = nil
        fromCol = nil
        fromRow = nil
        setNeedsDisplay()
    }
    
    func drawPieces() {
        for piece in shadowPieces where fromCol != piece.col || fromRow != piece.row {
            guard let img = image(named: piece.imageName) else {
                return
            }
            
            guard var pieceImage = image(named: piece.imageName) else {
                return
            }
            
            if deviceShared, let cgImg = img.cgImage {
                pieceImage = UIImage(cgImage: cgImg, scale: 1.0, orientation: .downMirrored)
            }
            
            pieceImage.draw(in: CGRect(x: originX + CGFloat(p2p(piece.col)) * cellSide, y: originY + CGFloat(p2p(piece.row)) * cellSide, width: cellSide, height: cellSide))
        }
        
        if let movingImage = movingImage {
            let side = 1.2 * cellSide
            movingImage.draw(in: CGRect(x: movingPieceX - side/2, y: movingPieceY - side/2, width: side, height: side))
            #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).setStroke()
            let circle = UIBezierPath(arcCenter: CGPoint(x: movingPieceX, y: movingPieceY), radius: 1.5 * cellSide, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
            circle.lineWidth = 3
            circle.stroke()
        }
    }
    
    func drawBoard() {
        for row in 0..<4 {
            for col in 0..<4 {
                drawSquare(col: col * 2, row: row * 2, color: UIColor.white)
                drawSquare(col: 1 + col * 2, row: row * 2, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
                drawSquare(col: col * 2, row: 1 + row * 2, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
                drawSquare(col: 1 + col * 2, row: 1 + row * 2, color: UIColor.white)
            }
        }
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor) {
        let path = UIBezierPath(rect: CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        color.setFill()
        path.fill()
    }
    
    func p2p(_ coordinate: Int) -> Int { // p2p: peer 2 peer
        return blackAtTop ? coordinate : 7 - coordinate
    }
    
    func image(named name: String) -> UIImage? {
        if let stored = imageByName[name] {
            return stored
        }
        
        let tupleByName: [String: (Int, Int)] = [
            "King-white" : (0, 0),
            "Queen-white" : (1, 0),
            "Bishop-white" : (2, 0),
            "Knight-white" : (3, 0),
            "Rook-white" : (4, 0),
            "Pawn-white" : (5, 0),
            "King-black" : (0, 1),
            "Queen-black" : (1, 1),
            "Bishop-black" : (2, 1),
            "Knight-black" : (3, 1),
            "Rook-black" : (4, 1),
            "Pawn-black" : (5, 1),
        ]
        
        guard let piecesImg = UIImage(named: "pieces_333"), let tuple = tupleByName[name] else {
            return nil
        }
        let col = tuple.0
        let row = tuple.1
        UIGraphicsBeginImageContext(CGSize(width: cellSide, height: cellSide))
        piecesImg.draw(in: CGRect(x: CGFloat(-col) * cellSide, y: CGFloat(-row) * cellSide, width: 6 * cellSide, height: 2 * cellSide))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        imageByName[name] = img
        return img
    }
}
