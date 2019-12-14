//
//  BoardView.swift
//  chess
//
//  Created by youjian zhou on 2019-12-14.
//  Copyright © 2019 youjian zhou. All rights reserved.
//

import UIKit

class BoardView: UIView {

  
    override func drawRect(rect: CGRect) {
        // Drawing code 
        
        let line = UIBezierPath()
        line.moveToPoint(CGPoint(x: 10, y: 10))
        line.addLineToPoint(CGPoint(x: 20, y: 20))
        
        line.stroke()
        
        let square00 = UIBezierPath(rect: CGRect(x: 30, y: 30, width: 60, height: 50))
        
        square00.fill()
    }


}
