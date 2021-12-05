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
    
    override func draw(_ rect: CGRect) {
        drawBoard()
        drawPieces()
    }
    
    func drawBoard() {
        let margin: CGFloat = 20
        let width: CGFloat = (bounds.width - 2 * margin) / 8
        for i in 0..<8 {
            for j in 0..<8{
                let path = UIBezierPath(rect: CGRect(x: margin + width * CGFloat(i), y: margin + width * CGFloat(j), width: width, height: width))
                if((i + j) % 2 == 0){
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
