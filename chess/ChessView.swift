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
        
        let pencil = UIBezierPath(rect: CGRect(x: gx, y: gy, width: cell, height: cell))
        let pencil2 = UIBezierPath(rect: CGRect(x: gx + cell, y: gy + cell, width: cell, height: cell))
        
        
        
        pencil.fill()
        pencil2.fill()
        
    }

}
