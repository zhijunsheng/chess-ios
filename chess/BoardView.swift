//
//  BoardView.swift
//  chess
//
//  Created by Felix Lo on 2020/7/24.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        for i in 0 ..< 9 {
            path.move(to: CGPoint(x: i * 50 + 50, y: 50))
            path.addLine(to: CGPoint(x: i * 50 + 50, y: 450))
            
            path.move(to: CGPoint(x: 50, y: i * 50 + 50))
            path.addLine(to: CGPoint(x: 450, y: i * 50 + 50))
        }
        
        path.stroke()
    }
}
