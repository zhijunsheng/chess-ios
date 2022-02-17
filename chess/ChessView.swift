//
//  ChessView.swift
//  chess
//
//  Created by Kenneth Wu on 2022-02-14.
//  Copyright © 2022 GoldThumb Inc. All rights reserved.
//

import UIKit

class ChessView: UIView {
    
    let gx: CGFloat = 0
    let gy: CGFloat = 0
    var cell: CGFloat = -100
    var colBegan: Int = -1
    var rowBegan: Int = -1
    var delegate: ChessDelegate? = nil
    
    
    override func draw(_ rect: CGRect) {
        cell = bounds.width / 8
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let finger = touch.location(in: self)
        colBegan = Int(finger.x / cell)
        rowBegan = Int(finger.y / cell)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let finger = touch.location(in: self)
        let colEnd: Int = Int(finger.x / cell)
        let rowEnd: Int = Int(finger.y / cell)
        
        print("From: \(colBegan),\(rowBegan) To: \(colEnd),\(rowEnd)")
    }
    
    func drawPieces() {
        
        for c in 0 ..< 8 {
            for r in 0 ..< 8 {
                
                if let piece = delegate?.pieceAt(col: c, row: r) {
                        drawPiece(col: piece.col, row: piece.row, image: piece.imageName)
                }
            }
        }
    }
    
    func drawPiece(col: Int, row: Int, image: String) {
        let chessPiece = UIImage(named: image)
        chessPiece?.draw(in: CGRect(x: gx + cell * CGFloat(col), y: gy + cell * CGFloat(row), width: cell, height: cell))
    }
    
    func drawBoard() {
        UIColor.blue.setFill()
        for k in 0 ..< 4 {
            for i in 0 ..< 4 {
                let pencil = UIBezierPath(rect: CGRect(x: gx + cell + cell * CGFloat(i * 2), y: gy + CGFloat(k) * (cell * 2), width: cell, height: cell))
                pencil.fill()
            }
            for i in 0 ..< 4 {
                let pencil = UIBezierPath(rect: CGRect(x: gx + cell * CGFloat(i * 2), y: gy + CGFloat(k) * (cell * 2) + cell, width: cell, height: cell))
                pencil.fill()
            }
        }
    }
    
    
    
}
