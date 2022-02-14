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
    
    override func draw(_ rect: CGRect) {
        cell = bounds.width / 8
        drawBoard()
        
        for i in 0 ..< 8 {
            let pawn = UIImage(named: "pawn_chess_w")
            pawn?.draw(at: CGPoint(x: gx + cell * CGFloat(i), y: gy + cell * 6))
        }
        
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
