//
//  BoardView.swift
//  chess
//
//  Created by Peter Shi on 2018-10-26.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    let originX: CGFloat = 25
    let originY: CGFloat = 25
    let side: CGFloat = 25
    let blackSquare = #colorLiteral(red: 0.2549019608, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
    let whiteSquare = #colorLiteral(red: 0.8274509804, green: 0.8392156863, blue: 0.831372549, alpha: 1)
    
    override func draw(_ rect: CGRect) {
        for i in 0..<8 {
            if i % 2 == 0 {
                for j in 0..<8 {
                    drawSquare(x: originX + side * CGFloat(j), y: originY + side * CGFloat(i), color: (j % 2 == 1) ? whiteSquare : blackSquare)
                }
            } else {
                for j in 0..<8 {
                    drawSquare(x: originX + side * CGFloat(j), y: originY + side * CGFloat(i), color: (j % 2 == 0) ? whiteSquare : blackSquare)
                }
            }
        }
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
 
}
