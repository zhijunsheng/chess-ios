//
//  BoardView.swift
//  chess
//
//  Created by Felix Lo on 2020/7/24.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let cell: CGFloat = 50
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
        
        path.stroke()
        
        let colourPath = UIBezierPath()
        
        colourPath.move(to: CGPoint(x: 300, y: 650))
        colourPath.addLine(to: CGPoint(x: 450, y: 750))
        colourPath.addLine(to: CGPoint(x: 150, y: 750))
        colourPath.close()
        
        colourPath.move(to: CGPoint(x: 50, y: 50))
        colourPath.addLine(to: CGPoint(x: 100, y: 750))
        
        colourPath.fill()
    }
}
