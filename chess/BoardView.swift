//
//  BoardView.swift
//  chess
//
//  Created by Andy Yan on 2019-10-13.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let pencil = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        pencil.fill()
        
        let pencil01 = UIBezierPath(rect: CGRect(x: 80, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil01.fill()
        
        let pencil02 = UIBezierPath(rect: CGRect(x: 160, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        pencil02.fill()
        
        
        
    }
    

}
