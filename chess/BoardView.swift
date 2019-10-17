//
//  BoardView.swift
//  chess
//
//  Created by Grace Huang on 9/26/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    let originX: CGFloat = 0
    let originY: CGFloat = 0
    let cellSide: CGFloat = 80
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        //print("(\(fingerLocation.x), \(fingerLocation.y))")
        let col: Int = Int(fingerLocation.x/80)
        let row: Int = Int(fingerLocation.y/80)
        print((col, row))
        
    }
    
    override func draw(_ rect: CGRect) {
        drawBoard()
        drawPieces()
    }
    
    func drawBoard() {
        drawSquareAt(col: 1, row: 0)
        drawSquareAt(col: 3, row: 0)
        drawSquareAt(col: 5, row: 0)
        drawSquareAt(col: 7, row: 0)
        drawSquareAt(col: 0, row: 1)
        drawSquareAt(col: 2, row: 1)
        drawSquareAt(col: 4, row: 1)
        drawSquareAt(col: 6, row: 1)
    }
    func drawPieces() {
        let kingB = UIImage(named:"king_chess_b")
        kingB?.draw(in: CGRect(x: cellSide * 4, y: 0, width: 80, height: 80))
        
    }
    
    
    func drawSquareAt(col:Int, row:Int) {
        let penS3 = UIBezierPath(rect: CGRect(x:(originX + cellSide * CGFloat(col)), y: (originY + cellSide * CGFloat(row)), width: cellSide, height: cellSide))
         #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).setFill()
        penS3.fill()
    }
}
