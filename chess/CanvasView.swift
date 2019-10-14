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
        
        
        for k in 0...8 {
            print("begin print 8 square row times = \(k)")
        //draw 8 squares which odd number squares are white and even number squares are black
       for i in 0...7 {
       // let i = 0
        if i % 2 != 0 {
            
        let blackSquare = UIBezierPath(rect: CGRect(x: 80 * CGFloat(i), y: CGFloat(k) * 80, width: 80, height: 80))
        // alternate the black and white squares
        if k % 2 == 0 {
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        blackSquare.fill()
        
        } else {
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        blackSquare.fill()
        blackSquare.stroke()
            }
        
        print("the  odd current iteration= \(i)")
        } else {
        let whiteSquare = UIBezierPath(rect: CGRect(x: 80 * CGFloat(i), y: CGFloat(k) * 80, width: 80, height: 80))
        // alternating white and black squares
        if k % 2 == 0 {
        
        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare.fill()
        whiteSquare.stroke()
            
        } else {
        
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        whiteSquare.fill()
        
        
        
                
            }
        print("the even current iteration= \(i)")
        }
        }
    
        }

        
        // Game Pieces
        
        let bishopImage = UIImage(named: "bishop_chess_w")
        bishopImage?.draw(in: CGRect(x: 160, y: 0, width: 80, height: 80))
        
        let rookImage = UIImage(named: "rook_chess_w")
        rookImage?.draw(in: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        let knightImage = UIImage(named: "knight_chess_w")
        knightImage?.draw(in: CGRect(x: 80, y: 0, width: 80, height: 80))
        
        let kingImage = UIImage(named: "king_chess_w")
        kingImage?.draw(in: CGRect(x: 240, y: 0, width: 80, height: 80))
        
        let queenImage = UIImage(named: "queen_chess_w")
        queenImage?.draw(in: CGRect(x: 320, y: 0, width: 80, height: 80))
        
        bishopImage?.draw(in: CGRect(x: 400, y: 0, width: 80, height: 80))
        knightImage?.draw(in: CGRect(x: 480, y: 0, width: 80, height: 80))
        rookImage?.draw(in: CGRect(x: 560, y: 0, width: 80, height: 80))
        
        for l in 0...7 {
            let pawnImage = UIImage(named: "pawn_chess_w")
            pawnImage?.draw(in: CGRect(x: 80 * CGFloat(l), y: 80, width: 80, height: 80))
        }
        let rookImage1 = UIImage(named: "rook_chess_b")
        rookImage1?.draw(in: CGRect(x: 0, y: 560, width: 80, height: 80))
        
        let knightImage1 = UIImage(named: "knight_chess_b")
        knightImage1?.draw(in: CGRect(x: 80, y: 560, width: 80, height: 80))
        
        let bishopImage1 = UIImage(named: "bishop_chess_b")
        bishopImage1?.draw(in: CGRect(x: 160, y: 560, width: 80, height: 80))
        
        let kingImage1 = UIImage(named: "king_chess_b")
        kingImage1?.draw(in: CGRect(x: 240, y: 560, width: 80, height: 80))
        
        let queenImage1 = UIImage(named: "queen_chess_b")
        queenImage1?.draw(in: CGRect(x: 320, y: 560, width: 80, height: 80))
        
        bishopImage1?.draw(in: CGRect(x: 400, y: 560, width: 80, height: 80))
        knightImage1?.draw(in: CGRect(x: 480, y: 560, width: 80, height: 80))
        rookImage1?.draw(in: CGRect(x: 560, y: 560, width: 80, height: 80))
        
        for m in 0...7 {
            let pawnImage1 = UIImage(named: "pawn_chess_b")
            pawnImage1?.draw(in: CGRect(x: 80 * CGFloat(m), y: 480, width: 80, height: 80))
        }

}
}
