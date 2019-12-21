//
//  BoardView.swift
//  chess
//
//  Created by youjian zhou on 2019-12-14.
//  Copyright © 2019 youjian zhou. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    let boardX: CGFloat = 10
    let boardY: CGFloat = 30
    let width: CGFloat = 30
    let height: CGFloat = 30

  
    override func drawRect(rect: CGRect) {
        // Drawing code 
        
        let line = UIBezierPath()
        line.moveToPoint(CGPoint(x: 10, y: 10))
        line.addLineToPoint(CGPoint(x: 20, y: 20))
        line.stroke()
        
        let square00 = UIBezierPath(rect: CGRect(x: boardX, y: boardY, width: width, height: height))
        UIColor.grayColor().setFill()
        square00.fill()
        
        
        let squareAt01 = UIBezierPath(rect: CGRect(x: boardX + width, y: boardY, width: width, height: height))
        UIColor.whiteColor().setFill()
        squareAt01.fill()
        
        let square01 = UIBezierPath(rect: CGRect(x: boardX + width, y: boardY + height, width: width, height: height))
        UIColor.grayColor().setFill()
        square01.fill()
        
        let squareAt02 = UIBezierPath(rect: CGRect(x: boardX, y: boardY + height, width: 30, height: 30))
        UIColor.whiteColor().setFill()
        squareAt02.fill()
        
        

        let blackBishopImage = UIImage(named: "Bishop-black")
        blackBishopImage?.drawInRect(CGRect(x: 10, y: 10, width: 25, height: 25))
        
        
    }


}
