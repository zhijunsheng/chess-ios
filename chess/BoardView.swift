//
//  BoardView.swift
//  chess
//
//  Created by Elaine on 2019/3/13.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    let cellside101: CGFloat = 0
    
    let originXForBoard: CGFloat = 0.0000000000
    let originYForFirstSquare: CGFloat = 0.0000000000000
    let cellSide: CGFloat = 36
    override func draw(_ rect: CGRect) {
        
        
        drawSquare(locationX: originXForBoard, locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide, locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide * 2, locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide * 3, locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide * 4, locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide * 5, locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide * 6, locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide * 7, locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
//
        
        drawSquare(locationX: originXForBoard , locationY: originYForFirstSquare + cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide, locationY: originYForFirstSquare + cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 2 * cellSide, locationY: originYForFirstSquare + cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 3 * cellSide, locationY: originYForFirstSquare + cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 4 * cellSide, locationY: originYForFirstSquare + cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 5 * cellSide, locationY: originYForFirstSquare + cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 7 * cellSide, locationY: originYForFirstSquare + cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
//
        drawSquare(locationX: originXForBoard , locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide, locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 2 * cellSide, locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 3 * cellSide, locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 4 * cellSide, locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 5 * cellSide, locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 7 * cellSide, locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
//
         drawSquare(locationX: originXForBoard , locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide, locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 2 * cellSide, locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 3 * cellSide, locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 4 * cellSide, locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 5 * cellSide, locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 7 * cellSide, locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
//
         drawSquare(locationX: originXForBoard , locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide, locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 2 * cellSide, locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 3 * cellSide, locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 4 * cellSide, locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 5 * cellSide, locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 7 * cellSide, locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
//
    
        drawSquare(locationX: originXForBoard , locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide, locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 2 * cellSide, locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 3 * cellSide, locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 4 * cellSide, locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 5 * cellSide, locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 7 * cellSide, locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
//
        drawSquare(locationX: originXForBoard , locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide, locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 2 * cellSide, locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 3 * cellSide, locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 4 * cellSide, locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 5 * cellSide, locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 7 * cellSide, locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
//
        drawSquare(locationX: originXForBoard , locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + cellSide, locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 2 * cellSide, locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 3 * cellSide, locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 4 * cellSide, locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 5 * cellSide, locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 6 * cellSide, locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
        drawSquare(locationX: originXForBoard + 7 * cellSide, locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
        
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
