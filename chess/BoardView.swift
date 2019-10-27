//
//  BoardView.swift
//  chess
//
//  Created by Andy Yan on 2019-10-13.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    func drawPiece(col:Int, row:Int, imageName:String)  {
       let pieceImage = UIImage(named: imageName)
        pieceImage?.draw(in: CGRect(x: col * 80, y: row * 80, width: 80, height: 80))
    }

    override func draw(_ rect: CGRect) {
        
        
        
        
        let pencil = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil.fill()
        
        let pencil01 = UIBezierPath(rect: CGRect(x: 80, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil01.fill()
        
        let pencil02 = UIBezierPath(rect: CGRect(x: 160, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).setFill()
        pencil02.fill()
        
        let pencil03 = UIBezierPath(rect: CGRect(x: 240, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil03.fill()
        
        let pencil04 = UIBezierPath(rect: CGRect(x: 320, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).setFill()
        pencil04.fill()
        
        let pencil05 = UIBezierPath(rect: CGRect(x: 400, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil05.fill()
        
        let pencil06 = UIBezierPath(rect: CGRect(x: 480, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).setFill()
        pencil06.fill()
        
        let pencil07 = UIBezierPath(rect: CGRect(x: 560, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil07.fill()
        
        let pencil08 = UIBezierPath(rect: CGRect(x: 640, y: 0, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil08.fill()
        
        let pencil09 = UIBezierPath(rect: CGRect(x: 0, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil09.fill()
        
        let pencil10 = UIBezierPath(rect: CGRect(x: 80, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil10.fill()
        
        let pencil11 = UIBezierPath(rect: CGRect(x: 160, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil11.fill()
        
        let pencil12 = UIBezierPath(rect: CGRect(x: 240, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil12.fill()
        
        let pencil13 = UIBezierPath(rect: CGRect(x: 320, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil13.fill()
        
        let pencil14 = UIBezierPath(rect: CGRect(x: 400, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil14.fill()
        
        let pencil15 = UIBezierPath(rect: CGRect(x: 480, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil15.fill()
        
        let pencil16 = UIBezierPath(rect: CGRect(x: 560, y: 80, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil16.fill()
        
        let pencil17 = UIBezierPath(rect: CGRect(x: 0, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil17.fill()
        
        let pencil18 = UIBezierPath(rect: CGRect(x: 80, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil18.fill()
        
        let pencil19 = UIBezierPath(rect: CGRect(x: 160, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil19.fill()
        
        let pencil20 = UIBezierPath(rect: CGRect(x: 240, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil20.fill()
        
        let pencil21 = UIBezierPath(rect: CGRect(x: 320, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil21.fill()
        
        let pencil22 = UIBezierPath(rect: CGRect(x: 400, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil22.fill()
        
        let pencil23 = UIBezierPath(rect: CGRect(x: 480, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil23.fill()
        
        let pencil24 = UIBezierPath(rect: CGRect(x: 560, y: 160, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil24.fill()
        
        let pencil25 = UIBezierPath(rect: CGRect(x: 0, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil25.fill()
        
        let pencil26 = UIBezierPath(rect: CGRect(x: 80, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil26.fill()
        
        let pencil27 = UIBezierPath(rect: CGRect(x: 160, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil27.fill()
        
        let pencil28 = UIBezierPath(rect: CGRect(x: 240, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil28.fill()
        
        let pencil29 = UIBezierPath(rect: CGRect(x: 320, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil29.fill()
        
        let pencil30 = UIBezierPath(rect: CGRect(x: 400, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil30.fill()
        
        let pencil31 = UIBezierPath(rect: CGRect(x: 480, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil31.fill()
        
        let pencil32 = UIBezierPath(rect: CGRect(x: 560, y: 240, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil32.fill()
        
        let pencil33 = UIBezierPath(rect: CGRect(x: 0, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil33.fill()
        
        let pencil34 = UIBezierPath(rect: CGRect(x: 80, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil34.fill()
        
        let pencil35 = UIBezierPath(rect: CGRect(x: 160, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil35.fill()
        
        let pencil36 = UIBezierPath(rect: CGRect(x: 240, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil36.fill()
        
        let pencil37 = UIBezierPath(rect: CGRect(x: 320, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil37.fill()
        
        let pencil38 = UIBezierPath(rect: CGRect(x: 400, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil38.fill()
        
        let pencil39 = UIBezierPath(rect: CGRect(x: 480, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil39.fill()
        
        let pencil40 = UIBezierPath(rect: CGRect(x: 560, y: 320, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil40.fill()
        
        let pencil41 = UIBezierPath(rect: CGRect(x: 0, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil41.fill()
        
        let pencil42 = UIBezierPath(rect: CGRect(x: 80, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil42.fill()
        
        let pencil43 = UIBezierPath(rect: CGRect(x: 160, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil43.fill()
        
        let pencil44 = UIBezierPath(rect: CGRect(x: 240, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil44.fill()
        
        let pencil45 = UIBezierPath(rect: CGRect(x: 320, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil45.fill()
        
        let pencil46 = UIBezierPath(rect: CGRect(x: 400, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil46.fill()
        
        let pencil47 = UIBezierPath(rect: CGRect(x: 480, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil47.fill()
        
        let pencil48 = UIBezierPath(rect: CGRect(x: 560, y: 400, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil48.fill()
        
        let pencil49 = UIBezierPath(rect: CGRect(x: 0, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil49.fill()
        
        let pencil50 = UIBezierPath(rect: CGRect(x: 80, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil50.fill()
        
        let pencil51 = UIBezierPath(rect: CGRect(x: 160, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil51.fill()
        
        let pencil52 = UIBezierPath(rect: CGRect(x: 240, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil52.fill()
        
        let pencil53 = UIBezierPath(rect: CGRect(x: 320, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil53.fill()
        
        let pencil54 = UIBezierPath(rect: CGRect(x: 400, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil54.fill()
        
        let pencil55 = UIBezierPath(rect: CGRect(x: 480, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil55.fill()
        
        let pencil56 = UIBezierPath(rect: CGRect(x: 560, y: 480, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil56.fill()
        
        let pencil57 = UIBezierPath(rect: CGRect(x: 0, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil57.fill()
        
        let pencil58 = UIBezierPath(rect: CGRect(x: 80, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil58.fill()
        
        let pencil59 = UIBezierPath(rect: CGRect(x: 160, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil59.fill()
        
        let pencil60 = UIBezierPath(rect: CGRect(x: 240, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil60.fill()
        
        let pencil61 = UIBezierPath(rect: CGRect(x: 320, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil61.fill()
        
        let pencil62 = UIBezierPath(rect: CGRect(x: 400, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil62.fill()
        
        let pencil63 = UIBezierPath(rect: CGRect(x: 480, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pencil63.fill()
        
        let pencil64 = UIBezierPath(rect: CGRect(x: 560, y: 560, width: 80, height: 80))
        #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
        pencil64.fill()
        
        drawPiece(col: 3, row: 7, imageName: "king_chess_w")
        drawPiece(col: 4, row: 7, imageName: "queen_chess_w")
        drawPiece(col: 3, row: 0, imageName: "king_chess_b")
        drawPiece(col: 4, row: 0, imageName: "queen_chess_b")
        
        for i in 0..<2 {
            drawPiece(col: i * 7 + 0, row: 0, imageName: "rook_chess_b")
            drawPiece(col: i * 5 + 1, row: 0, imageName: "knight_chess_b")
            drawPiece(col: i * 3 + 2, row: 0, imageName: "bishop_chess_b")
            drawPiece(col: i * 7 + 0, row: 7, imageName: "rook_chess_w")
            drawPiece(col: i * 5 + 1, row: 7, imageName: "knight_chess_w")
            drawPiece(col: i * 3 + 2, row: 7, imageName: "bishop_chess_w")

        }

        for i in 0..<8 {
            drawPiece(col: i, row: 6, imageName: "pawn_chess_w")
            drawPiece(col: i, row: 1, imageName: "pawn_chess_b")
        }
       
        
    }
}

