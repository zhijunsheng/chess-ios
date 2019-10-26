//
//  CanvasView.swift
//  chess
//
//  Created by Angie Yan on 2019-10-09.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//


import UIKit 

class CanvasView: UIView {

    override func draw(_ rect: CGRect) {
        
        // Black Squares
        
        let blackSquare = UIBezierPath(rect: CGRect(x: 0, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare.fill()
        
        let blackSquare1 = UIBezierPath(rect: CGRect(x: 80, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare1.fill()
        
        let blackSquare2 = UIBezierPath(rect: CGRect(x: 160, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare2.fill()
        
        let blackSquare3 = UIBezierPath(rect: CGRect(x: 240, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare3.fill()
        
        let blackSquare4 = UIBezierPath(rect: CGRect(x: 320, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare4.fill()
        
        let blackSquare5 = UIBezierPath(rect: CGRect(x: 400, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare5.fill()
        
        let blackSquare6 = UIBezierPath(rect: CGRect(x: 480, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare6.fill()
        
        let blackSquare7 = UIBezierPath(rect: CGRect(x: 560, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare7.fill()
        
        let blackSquare8 = UIBezierPath(rect: CGRect(x: 480, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare8.fill()
        
        let blackSquare9 = UIBezierPath(rect: CGRect(x: 320, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare9.fill()
        
        let blackSquare10 = UIBezierPath(rect: CGRect(x: 160, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare10.fill()
        
        let blackSquare11 = UIBezierPath(rect: CGRect(x: 0, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare11.fill()
        
        let blackSquare12 = UIBezierPath(rect: CGRect(x: 80, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare12.fill()
        
        let blackSquare13 = UIBezierPath(rect: CGRect(x: 240, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare13.fill()
        
        let blackSquare14 = UIBezierPath(rect: CGRect(x: 400, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare14.fill()
        
        let blackSquare15 = UIBezierPath(rect: CGRect(x: 560, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare15.fill()
        
        let blackSquare16 = UIBezierPath(rect: CGRect(x: 0, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare16.fill()
        
        let blackSquare17 = UIBezierPath(rect: CGRect(x: 160, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare17.fill()
        
        let blackSquare18 = UIBezierPath(rect: CGRect(x: 320, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare18.fill()
        
        let blackSquare19 = UIBezierPath(rect: CGRect(x: 480, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare19.fill()
        
        let blackSquare20 = UIBezierPath(rect: CGRect(x: 80, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare20.fill()
        
        let blackSquare21 = UIBezierPath(rect: CGRect(x: 240, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare21.fill()
        
        let blackSquare22 = UIBezierPath(rect: CGRect(x: 400, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare22.fill()
        
        let blackSquare23 = UIBezierPath(rect: CGRect(x: 560, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare23.fill()
        
        let blackSquare24 = UIBezierPath(rect: CGRect(x: 0, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare24.fill()
        
        let blackSquare25 = UIBezierPath(rect: CGRect(x: 160, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare25.fill()
        
        let blackSquare26 = UIBezierPath(rect: CGRect(x: 320, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare26.fill()
        
        let blackSquare27 = UIBezierPath(rect: CGRect(x: 480, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare27.fill()
        
        let blackSquare28 = UIBezierPath(rect: CGRect(x: 80, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare28.fill()
        
        let blackSquare29 = UIBezierPath(rect: CGRect(x: 240, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare29.fill()
        
        let blackSquare30 = UIBezierPath(rect: CGRect(x: 400, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare30.fill()
        
        let blackSquare31 = UIBezierPath(rect: CGRect(x: 560, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.4143660946, green: 0.4143660946, blue: 0.4143660946, alpha: 1).setFill()
        blackSquare31.fill()
 
        // White Squares
        
        let whiteSquare = UIBezierPath(rect: CGRect(x: 80, y: 560, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare.fill()
        whiteSquare.stroke()
        
        let whiteSquare1 = UIBezierPath(rect: CGRect(x: 240, y: 560, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare1.fill()
        whiteSquare1.stroke()
        
        let whiteSquare2 = UIBezierPath(rect: CGRect(x: 400, y: 560, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare2.fill()
        whiteSquare2.stroke()
        
        let whiteSquare3 = UIBezierPath(rect: CGRect(x: 560, y: 560, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare3.fill()
        whiteSquare3.stroke()
        
        let whiteSquare4 = UIBezierPath(rect: CGRect(x: 0, y: 480, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare4.fill()
        whiteSquare4.stroke()
        
        let whiteSquare5 = UIBezierPath(rect: CGRect(x: 160, y: 480, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare5.fill()
        whiteSquare5.stroke()
        
        let whiteSquare6 = UIBezierPath(rect: CGRect(x: 320, y: 480, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare6.fill()
        whiteSquare6.stroke()
        
        let whiteSquare7 = UIBezierPath(rect: CGRect(x: 480, y: 480, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare7.fill()
        whiteSquare7.stroke()
        
        let whiteSquare8 = UIBezierPath(rect: CGRect(x: 80, y: 400, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare8.fill()
        whiteSquare8.stroke()
        
        let whiteSquare9 = UIBezierPath(rect: CGRect(x: 240, y: 400, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare9.fill()
        whiteSquare9.stroke()
        
        let whiteSquare10 = UIBezierPath(rect: CGRect(x: 400, y: 400, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare10.fill()
        whiteSquare10.stroke()
        
        let whiteSquare11 = UIBezierPath(rect: CGRect(x: 560, y: 400, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare11.fill()
        whiteSquare11.stroke()
        
        let whiteSquare12 = UIBezierPath(rect: CGRect(x: 0, y: 320, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare12.fill()
        whiteSquare12.stroke()
        
        let whiteSquare13 = UIBezierPath(rect: CGRect(x: 160, y: 320, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare13.fill()
        whiteSquare13.stroke()
        
        let whiteSquare14 = UIBezierPath(rect: CGRect(x: 320, y: 320, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare14.fill()
        whiteSquare14.stroke()
        
        let whiteSquare15 = UIBezierPath(rect: CGRect(x: 480, y: 320, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare15.fill()
        whiteSquare15.stroke()
        
        let whiteSquare16 = UIBezierPath(rect: CGRect(x: 80, y: 240, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare16.fill()
        whiteSquare16.stroke()
        
        let whiteSquare17 = UIBezierPath(rect: CGRect(x: 240, y: 240, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare17.fill()
        whiteSquare17.stroke()
        
        let whiteSquare18 = UIBezierPath(rect: CGRect(x: 400, y: 240, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare18.fill()
        whiteSquare18.stroke()
        
        let whiteSquare19 = UIBezierPath(rect: CGRect(x: 560, y: 240, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare19.fill()
        whiteSquare19.stroke()
        
        let whiteSquare20 = UIBezierPath(rect: CGRect(x: 0, y: 160, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare20.fill()
        whiteSquare20.stroke()
        
        let whiteSquare21 = UIBezierPath(rect: CGRect(x: 160, y: 160, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare21.fill()
        whiteSquare21.stroke()
        
        let whiteSquare22 = UIBezierPath(rect: CGRect(x: 320, y: 160, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare22.fill()
        whiteSquare22.stroke()
        
        let whiteSquare23 = UIBezierPath(rect: CGRect(x: 480, y: 160, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare23.fill()
        whiteSquare23.stroke()
        
        let whiteSquare24 = UIBezierPath(rect: CGRect(x: 80, y: 80, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare24.fill()
        whiteSquare24.stroke()
        
        let whiteSquare25 = UIBezierPath(rect: CGRect(x: 240, y: 80, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare25.fill()
        whiteSquare25.stroke()
        
        let whiteSquare26 = UIBezierPath(rect: CGRect(x: 400, y: 80, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare26.fill()
        whiteSquare26.stroke()
        
        let whiteSquare27 = UIBezierPath(rect: CGRect(x: 560, y: 80, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare27.fill()
        whiteSquare27.stroke()
        
        
        let whiteSquare28 = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare28.fill()
        whiteSquare28.stroke()
        
        let whiteSquare29 = UIBezierPath(rect: CGRect(x: 160, y: 0, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare29.fill()
        whiteSquare29.stroke()
        
        let whiteSquare30 = UIBezierPath(rect: CGRect(x: 320, y: 0, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare30.fill()
        whiteSquare30.stroke()
        
        let whiteSquare31 = UIBezierPath(rect: CGRect(x: 480, y: 0, width: 80, height: 80))
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setFill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        whiteSquare31.fill()
        whiteSquare31.stroke()       
        
        
        drawPiece(imageName: "king_chess_b", col: 3, row: 7)
        drawPiece(imageName: "queen_chess_b", col: 4, row: 7)
        drawPiece(imageName: "king_chess_w", col: 3, row: 0)
        drawPiece(imageName: "queen_chess_w", col: 4, row: 0)
        
        for i in 0..<2 {
            drawPiece(imageName: "rook_chess_w", col: i * 7, row: 0)
            drawPiece(imageName: "knight_chess_w", col: i * 5 + 1, row: 0)
            drawPiece(imageName: "bishop_chess_w", col: i * 3 + 2, row: 0)
            drawPiece(imageName: "rook_chess_b", col: i * 7, row: 7)
            drawPiece(imageName: "bishop_chess_b", col: i * 3 + 2, row: 7)
            drawPiece(imageName: "knight_chess_b", col: i * 5 + 1, row: 7)
        }
        
        for i in 0..<8 {
            drawPiece(imageName: "pawn_chess_w", col: i, row: 1)
            drawPiece(imageName: "pawn_chess_b", col: i, row: 6)
        }
    }
    
    func drawPiece(imageName: String, col: Int, row: Int) {
        let pieceImage = UIImage(named: imageName)
        pieceImage?.draw(in: CGRect(x: 80 * col, y: 80 * row, width: 80, height: 80))
    }
    
}


