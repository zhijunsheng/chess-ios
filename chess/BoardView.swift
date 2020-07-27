//
//  BoardView.swift
//  chess
//
//  Created by Felix Lo on 2020/7/24.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let cell: CGFloat = 75
    let originX: CGFloat = 50
    let originY: CGFloat = 50
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        for i in 0 ..< 9 {
            path.move(to: CGPoint(x: CGFloat(i) * cell + originX, y: originY))
            path.addLine(to: CGPoint(x: CGFloat(i) * cell + originX, y: cell * 8 + originY))
            
            path.move(to: CGPoint(x: originX, y: CGFloat(i) * cell + originY))
            path.addLine(to: CGPoint(x: cell * 8 + originX, y: CGFloat(i) * cell + originY))
        }
        
        for j in 0 ... 3 {
            for i in 0 ... 3 {
                drawSquare(col: i * 2 + 1, row: j * 2, color: #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1))
                drawSquare(col: i * 2, row: j * 2 + 1, color: #colorLiteral(red: 0, green: 0.5598887801, blue: 0.3187503517, alpha: 1))
                drawSquare(col: i * 2, row: j * 2, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                drawSquare(col: i * 2 + 1, row: j * 2 + 1, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            }
        }
        
        path.stroke()
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
}
