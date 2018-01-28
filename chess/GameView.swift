//
//  GameView.swift
//  chess
//
//  Created by Bowen Lin on 2018-01-27.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameView: UIView {

    let numCells = 8
    let gap: CGFloat = 25.0
    let topLeftX: CGFloat = 320.0 / 5.5
    var topLeftY: CGFloat = 320.0 / 5.5
    override func draw(_ rect: CGRect) {
        
        drawBoard(color: .darkGray)
        
    }
    func drawLine(withColor color: UIColor, fromX:CGFloat, fromY: CGFloat, toX: CGFloat, toY: CGFloat){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: fromX, y: fromY ))
        path.addLine(to: CGPoint(x: toX, y: toY))
        path.lineWidth = 1
        color.setStroke()
        path.stroke()
    }
    func convert(gameX: Int, gameY: Int) -> CGPoint {
        let floatX1: CGFloat = CGFloat(topLeftX) + CGFloat(gameX) * gap
        let floatY1: CGFloat = CGFloat(topLeftY) + CGFloat(gameY) * gap
        let floatX2: CGFloat = CGFloat(topLeftY) + CGFloat(gameY) * gap
        let floatY2: CGFloat = CGFloat(topLeftY) + CGFloat(gameY) * gap
        
        let resultPoint2 = CGPoint(x: floatX2, y: floatY2)
        print("1.\(resultPoint2)")
        let resultPoint1 = CGPoint(x: floatX1, y: floatY1)
        print("1.\(resultPoint1)")
        return resultPoint1
//        return resultPoint2
    }
    
    func drawCell(withColor color: UIColor, x: CGFloat, y: CGFloat, width: CGFloat, height:CGFloat) {
        let cellRect = CGRect(x: x, y: y, width: width, height: height)
        let path = UIBezierPath(rect: cellRect)
        color.setFill()
        path.fill()
        
    }
    func drawBoard(color: UIColor) {
        for i in 0...numCells {
            drawLine(withColor: color, fromX: topLeftX, fromY: topLeftY +  CGFloat(i) * gap, toX:topLeftX + CGFloat(numCells) * gap, toY: topLeftY + CGFloat(i) * gap)
        }
        let r = convert(gameX: 1, gameY: 0)
        let w = convert(gameX: 0, gameY: 0)
        for i in 0...numCells {
            drawLine(withColor: color,fromX: topLeftX + CGFloat(i) * gap, fromY: topLeftY , toX: topLeftX + CGFloat(i) * gap, toY: topLeftY + CGFloat(numCells) * gap)
            drawLine(withColor: .blue, fromX: 0.0, fromY: 0.0, toX: 320.0, toY: 0.0)
            
        }
        for i in 0...3{
            var a = 0
            var b = 0.5
            while a < 4 {
                
                drawCell(withColor: .white, x: w.x + gap * 2 * CGFloat(i), y: w.y + gap * CGFloat(a) * 2, width: gap, height: gap)
                
                drawCell(withColor: .black, x: w.x + gap * 2 * CGFloat(i), y: w.y + gap * CGFloat(b) * 2, width: gap, height: gap)
                
                drawCell(withColor: .black, x: r.x + gap * 2 * CGFloat(i), y: r.y + gap * CGFloat(a) * 2, width: gap, height: gap)
                
                drawCell(withColor: .white, x: r.x + gap * 2 * CGFloat(i), y: r.y + gap * CGFloat(b) * 2, width: gap, height: gap)
                
                a = a + 1
                b = b + 1
            }
        }
    }
}
