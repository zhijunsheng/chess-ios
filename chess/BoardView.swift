//
//  BoardView.swift
//  chess
//
//  Created by Elaine on 2019/3/13.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let cellSide: CGFloat = 30
    

    override func draw(_ rect: CGRect) {
        
        let pencil = UIBezierPath()
        
        pencil.move(to: CGPoint(x: 110, y: 150))
        pencil.addLine(to: CGPoint(x: 110 + cellSide, y: 150))
        pencil.addLine(to: CGPoint(x: 110 + cellSide, y: 150 + cellSide))
        pencil.addLine(to: CGPoint(x: 110, y: 150 + cellSide))
        pencil.close()
        
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        pencil.fill()
        
       
    }
  

}
