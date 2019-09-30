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
    let cellSide: CGFloat = 33
    
    override func draw(_ rect: CGRect) {

        
        let penS1 = UIBezierPath(rect: CGRect(x: originX, y: originY, width: 264, height: 264))
        penS1.stroke()
        
        drawSquareAt(col: 1, row: 0)
        drawSquareAt(col: 3, row: 0)
        drawSquareAt(col: 5, row: 0)
        drawSquareAt(col: 7, row: 0)
        drawSquareAt(col: 0, row: 1)
        drawSquareAt(col: 2, row: 1)
        drawSquareAt(col: 4, row: 1)
        drawSquareAt(col: 6, row: 1)
        drawSquareAt(col: 1, row: 2)
        drawSquareAt(col: 3, row: 2)
        drawSquareAt(col: 5, row: 2)
        drawSquareAt(col: 7, row: 2)
        drawSquareAt(col: 0, row: 3)
        drawSquareAt(col: 2, row: 3)
        drawSquareAt(col: 4, row: 3)
        drawSquareAt(col: 6, row: 3)
        drawSquareAt(col: 1, row: 4)
        drawSquareAt(col: 3, row: 4)
        drawSquareAt(col: 5, row: 4)
        drawSquareAt(col: 7, row: 4)
        drawSquareAt(col: 0, row: 5)
        drawSquareAt(col: 2, row: 5)
        drawSquareAt(col: 4, row: 5)
        drawSquareAt(col: 6, row: 5)
        drawSquareAt(col: 1, row: 6)
        drawSquareAt(col: 3, row: 6)
        drawSquareAt(col: 5, row: 6)
        drawSquareAt(col: 7, row: 6)
        drawSquareAt(col: 0, row: 7)
        drawSquareAt(col: 2, row: 7)
        drawSquareAt(col: 4, row: 7)
        drawSquareAt(col: 6, row: 7)
       
        
        }
    

    func drawSquareAt(col:Int, row:Int) {
        let penS3 = UIBezierPath(rect: CGRect(x:(originX + cellSide * CGFloat(col)), y: (originY + cellSide * CGFloat(row)), width: cellSide, height: cellSide))
            
        penS3.fill()
    }
}
