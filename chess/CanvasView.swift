//
//  CanvasView.swift
//  chess
//
//  Created by Angie Yan on 2019-10-09.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let bPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 100, height: 120))
        bPath.fill()
        
        let bPath2 = UIBezierPath(rect: CGRect(x: 90 + 200, y: 100 + 50, width: 100, height: 100))
        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setFill()
        bPath2.fill()
   
    }
 

}
