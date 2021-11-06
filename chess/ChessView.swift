//
//  ChessView.swift
//  chess
//
//  Created by Harry Shen on 10/30/21.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import UIKit

class ChessView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        drawBoard()
        
    }
    func drawBoard() {
        let margin: CGFloat = 20
        let width: CGFloat = (bounds.width - 2 * margin) / 8
        for i in 0..<8 {
            for j in 0..<8{
                let path = UIBezierPath(rect: CGRect(x: margin + width * CGFloat(i), y: margin + width * CGFloat(j), width: width, height: width))
                if((i + j) % 2 == 0){
                    UIColor.white.setFill()
                    path.fill()
                }
                else{
                    UIColor.systemGreen.setFill()
                    path.fill()
                    
                }
                
            }
        }
        
    }

}
