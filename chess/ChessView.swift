//
//  ChessView.swift
//  chess
//
//  Created by Harry Shen on 10/30/21.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import UIKit

class ChessView: UIView {

    var delegate: ChessDelegate? = nil
    let margin: CGFloat = 20
    var width: CGFloat = -1
    var startColumn: Int = -1
    var startRow: Int = -1
    
    
    override func draw(_ rect: CGRect) {
        width = (bounds.width - 2 * margin) / 8
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let finger = touches.first!
        let fingerLocation = finger.location(in: self)
        startColumn = Int((fingerLocation.x-margin)/width)
        startRow = Int((fingerLocation.y-margin)/width)
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let finger = touches.first!
        let fingerLocation = finger.location(in: self)
        let column: Int = Int((fingerLocation.x-margin)/width)
        let row: Int = Int((fingerLocation.y-margin)/width)
        delegate?.move(fromX: startColumn, fromY: startRow, toX: column, toY: row)
        print("Start: \(startColumn), \(startRow) and end: \(column), \(row)")
    }
    
    func drawBoard() {
        for i in 0..<8 {
            for j in 0..<8{
                let path = UIBezierPath(rect: CGRect(x: margin + width * CGFloat(i), y: margin + width * CGFloat(j), width: width, height: width))
                if((i + j) % 2 == 1){
                    UIColor.white.setFill()
                    path.fill()
                }
                else{
                    UIColor.systemGreen.setFill()
                    path.fill()
                    
                }
                
            }
        }
    }
    func drawPieces() {
        for i in 0..<8{
            for j in 0..<8{
                if let piece = delegate?.pieceAt(column: i, row: j){
                    drawPieceAt(piece: piece)
                }
            }
        }
    }
    
    /*
     to draw an image
     
     create an obj of UIImage
     img.draw(..)
     
     */
    func drawPieceAt(piece : ChessPiece){
        let margin: CGFloat = 20
        let width: CGFloat = (bounds.width - 2 * margin) / 8
        let pic = UIImage(named: piece.picName)
        pic?.draw(in: CGRect(x: margin + width * CGFloat(piece.col), y: margin + width * CGFloat(piece.row), width: width, height: width))
    }
}
