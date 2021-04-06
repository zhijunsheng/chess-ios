//
//  BoardView.swift
//  chess
//
//  Created by 吴淑雅 on 2021-04-03.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // first square
        
        let pen = UIBezierPath()
        
        pen.move(to: CGPoint(x: 0, y: 50))
        pen.addLine(to: CGPoint(x: 50, y: 50))
        pen.addLine(to: CGPoint(x: 50, y: 0))
        pen.addLine(to: CGPoint(x: 0, y: 0))
        pen.close()
        
        pen.stroke()
        #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1).setFill()
        pen.fill()
        
        // second square
        
        let the = UIBezierPath()
        
        the.move(to: CGPoint(x: 150, y: 0))
        the.addLine(to: CGPoint(x: 150, y: 50))
        the.addLine(to: CGPoint(x: 100, y: 50))
        the.addLine(to: CGPoint(x: 100, y: 0))
        the.close()
        the.stroke()
        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setFill()
        the.fill()
        
        // third square
        
        let ing = UIBezierPath()
        ing.move(to: CGPoint(x: 250, y: 0))
        ing.addLine(to: CGPoint(x: 250, y: 50))
        ing.addLine(to: CGPoint(x: 200, y: 50))
        ing.addLine(to: CGPoint(x: 200, y: 0))
        ing.close()
        ing.stroke()
        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setFill()
        ing.fill()
        
        // fourth square
        
        let poi = UIBezierPath()
        poi.move(to: CGPoint(x: 350, y: 0))
        poi.addLine(to: CGPoint(x: 350, y: 50))
        poi.addLine(to: CGPoint(x: 300, y: 50))
        poi.addLine(to: CGPoint(x: 300, y: 0))
        poi.close()
        poi.stroke()
        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setFill()
        poi.fill()
        
        
       
        let image = UIImage(named: "rook_chess_b")
        image?.draw(at: CGPoint(x:-15, y:-25))
    }
    

}
