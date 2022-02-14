//
//  ChessView.swift
//  chess
//
//  Created by Kenneth Wu on 2022-02-14.
//  Copyright © 2022 GoldThumb Inc. All rights reserved.
//

import UIKit

class ChessView: UIView {
    
    let gx: CGFloat = 10
    let gy: CGFloat = 10
    let cell: CGFloat = 50
    
    override func draw(_ rect: CGRect) {
        
        let pencil = UIBezierPath()
        
        pencil.move(to: CGPoint(x: gx, y: gy))
        pencil.addLine(to: CGPoint(x: gx, y: gy + cell))
        
        
        pencil.stroke()
        
    }

}
