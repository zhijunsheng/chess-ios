//
//  BoardView.swift
//  chess
//
//  Created by Peter Shi on 2018-10-26.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

//r n b q k b n r
//p . p p p p p p
//. P . . . . . .
//. . . . . . . .
//. . . . . . . .
//. . . . . . . .
//. P P P P P P P
//R N B Q K B N R

class BoardView: UIView {
    let boardSize: CGFloat = 0.9
    var originX: CGFloat = 0
    var originY: CGFloat = 0
    var side: CGFloat = 0
    var margin: CGFloat = 0 // for panning adjustments
    let blackSquare = #colorLiteral(red: 0.3897942041, green: 0.4246642509, blue: 0.4452926713, alpha: 1)
    let whiteSquare = #colorLiteral(red: 0.951580584, green: 1, blue: 0.9881752133, alpha: 1)
    var pieces: Set<Piece> = Set<Piece>()
    var thingy1: Int = Int.min
    var thingy2: Int = Int.min
    public var movingPiece: Piece? = nil
    var chessDelagate: ChessDelegate? = nil
    var movingPic: UIImage? = nil
    var movingLoc: CGPoint? = nil
    var pieceImageThing: String? = nil
    
    override func draw(_ rect: CGRect) {
        side = bounds.width * boardSize / 8
        margin = side / 5
        originX = (bounds.width - side * 8) / 2
        originY = (bounds.height - side * 8) / 2
    
        drawBoard()
        drawPieces()
        if let movingLoc = movingLoc {
            movingPic?.draw(in: CGRect(x: movingLoc.x - side / 2, y: movingLoc.y - side / 2, width: side, height: side))

        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let loc = touch.location(in: self)
        thingy1 = Int((loc.x - originX) / side)
        thingy2 = Int((loc.y - originY) / side)
        if let pieceThing = chessDelagate?.pieceOn(x: thingy1, y: thingy2) {
            movingPic = UIImage(named: pieceThing.imageName)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        movingLoc = touch.location(in: self)
        self.setNeedsDisplay()
        print(movingLoc!)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let loc = touch.location(in: self)
        let thing1: Int = Int((loc.x - originX) / side)
        let thing2: Int = Int((loc.y - originY) / side)
        print("from(\(thingy1), \(thingy2)) to (\(thing1), \(thing2)).")
        
        chessDelagate?.move(startX: thingy1, startY: thingy2, endX: thing1, endY: thing2)
        movingPic = nil
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
            if piece != movingPiece {
                drawPiece(piece: Piece(col: piece.col, row: piece.row, imageName: piece.imageName, isWhite: piece.isWhite, cm: piece.cm))
            }
        }
    }
}
