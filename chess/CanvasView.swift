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
        
        let bPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 80, height: 80))
        bPath.fill()
        let bPath1 = UIBezierPath(rect: CGRect(x: 80, y: 80, width: 80, height: 80))
        bPath1.fill()
        let bPath2 = UIBezierPath(rect: CGRect(x: 160, y: 0, width: 80, height: 80))
        bPath2.fill()
        let bPath3 = UIBezierPath(rect: CGRect(x: 240, y: 80, width: 80, height: 80))
        bPath3.fill()
        let bPath4 = UIBezierPath(rect: CGRect(x: 320, y: 0, width: 80, height: 80))
        bPath4.fill()
        let bPath5 = UIBezierPath(rect: CGRect(x: 400, y: 80, width: 80, height: 80))
        bPath5.fill()
        let bPath6 = UIBezierPath(rect: CGRect(x: 480, y: 0, width: 80, height: 80))
        bPath6.fill()
        let bPath7 = UIBezierPath(rect: CGRect(x: 560, y: 80, width: 80, height: 80))
        bPath7.fill()
        
        let bishopImage = UIImage(named: "bishop_chess_w")
        bishopImage?.draw(in: CGRect(x: 160, y: 0, width: 80, height: 80))
        
        let rookImage = UIImage(named: "rook_chess_w")
        rookImage?.draw(in: CGRect(x: 0, y: 0, width: 80, height: 80))
        
    }
 

}
