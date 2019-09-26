//
//  BoardView.swift
//  chess
//
//  Created by Grace Huang on 9/26/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    let originX: CGFloat = 15
    let originY: CGFloat = 15
    let cellSide: CGFloat = 20
    
    override func draw(_ rect: CGRect) {

        
        let penS1 = UIBezierPath(rect: CGRect(x: originX, y: originY, width: 160, height: 160))
        penS1.stroke()
        
        drawSquareAt(col: 1, row: 0)
        drawSquareAt(col: 3, row: 0)
        
    }
    

    func drawSquareAt(col:Int, row:Int) {
        let penS3 = UIBezierPath(rect: CGRect(x: originX + cellSide * CGFloat(col), y: originY, width: cellSide, height: cellSide))
        penS3.fill()
    }
}
