//
//  BoardView.swift
//  chess
//
//  Created by Elaine on 2019/3/13.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    let originXForBoard: CGFloat = 110.0000000000
    let originYForFirstSquare: CGFloat = 150.0000000000000
    let cellSide: CGFloat = 30
    
    override func draw(_ rect: CGRect) {
        
        drawSquare(locationX: originXForBoard, locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        drawSquare(locationX: 0, locationY: 0, colourLiteral: #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1))
        
        drawSquare(locationX: 30, locationY: 30, colourLiteral: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
    
    
    
    
    }
    
    func drawSquare(locationX: CGFloat, locationY : CGFloat, colourLiteral: UIColor) {
        let pencil = UIBezierPath()
        
        pencil.move(to: CGPoint(x: locationX, y: locationY))
        pencil.addLine(to: CGPoint(x: locationX + cellSide, y: locationY))
        pencil.addLine(to: CGPoint(x: locationX + cellSide , y: locationY + cellSide))
        pencil.addLine(to: CGPoint(x: locationX , y: locationY + cellSide))
        pencil.close()
        
        colourLiteral.setFill()
        pencil.fill()
        pencil.stroke()
    }
}
