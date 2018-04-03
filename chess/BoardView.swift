//
//  GameView.swift
//  chess
//
//  Created by Bowen Lin on 2018-01-27.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    let numCells = 8
    let gap: CGFloat = 39.0
    let topLeftX: CGFloat = 16.5
    let topLeftY: CGFloat = 35.0
    
    let board = Board()
    
    override func draw(_ rect: CGRect) {
        print(board)
        drawBoard(color: .darkGray)
        drawPieces()
    }
    
    func drawPieces(){
        print("inside drawPieces()")
        
        for piece in board.pieces {
            drawPiece(piece: piece)
        }
    }
    
    func drawPiece(piece: Piece) {
        print("______________________________\(piece.pieceType)")
        let x = topLeftX - gap + CGFloat(piece.location.col) * gap
        let y = topLeftY - gap + CGFloat(9 - piece.location.row) * gap
        
        var pieceImage: UIImage = UIImage()
        if piece.color == .black {
            if piece.pieceType == .knight {
                pieceImage = UIImage(named: "knight_chess_b")!
                //            pieceImage.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
            } else if piece.pieceType == .rook {
                pieceImage = UIImage(named: "rook_chess_b")!
                //            pieceImage.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
            } else if piece.pieceType == .bishop {
                pieceImage = UIImage(named: "bishop_chess_b")!
            } else if piece.pieceType == .queen {
                pieceImage = UIImage(named: "queen_chess_b")!
            } else if piece.pieceType == .king {
                pieceImage = UIImage(named: "king_chess_b")!
            } else if piece.pieceType == .pawn {
                pieceImage = UIImage(named: "pawn_chess_b")!
            }
        } else {
            if piece.pieceType == .knight {
                pieceImage = UIImage(named: "knight_chess_w")!
               
            } else if piece.pieceType == .rook {
                pieceImage = UIImage(named: "rook_chess_w")!
            } else if piece.pieceType == .bishop {
                pieceImage = UIImage(named: "bishop_chess_w")!
            } else if piece.pieceType == .queen {
                pieceImage = UIImage(named: "queen_chess_w")!
            } else if piece.pieceType == .king {
                pieceImage = UIImage(named: "king_chess_w")!
            } else if piece.pieceType == .pawn {
                pieceImage = UIImage(named: "pawn_chess_w")!
            }
        }
        pieceImage.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
    }
    
    func drawKnightB(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "knight_chess_b")
        piece?.draw(in: CGRect(x: x + 3, y: y, width: gap - 3, height: gap - 1))
    }
    
    func rowToY(){
        let i = 6
        let convertRow = topLeftX - gap + CGFloat(board.pieces[i].location.row) * gap
    }
    
    func colToX(){
        let i = 6
        let convertCol = topLeftX - gap + CGFloat(board.pieces[i].location.row) * gap
    }
    
    func drawCell(withColor color: UIColor, x: CGFloat, y: CGFloat, width: CGFloat, height:CGFloat) {
        let cellRect = CGRect(x: x, y: y, width: width, height: height)
        let path = UIBezierPath(rect: cellRect)
        color.setFill()
        path.fill()
    }
    
    func drawLine(withColor color: UIColor, fromX:CGFloat, fromY: CGFloat, toX: CGFloat, toY: CGFloat){
        let path = UIBezierPath()
        path.move(to: CGPoint(x: fromX, y: fromY ))
        path.addLine(to: CGPoint(x: toX, y: toY))
        path.lineWidth = 1
        color.setStroke()
        path.stroke()
    }
    
    func convert(gameX: Int, gameY: Int) -> CGPoint {
        let floatX1: CGFloat = CGFloat(topLeftX) + CGFloat(gameX) * gap
        let floatY1: CGFloat = CGFloat(topLeftY) + CGFloat(gameY) * gap
        let floatX2: CGFloat = CGFloat(topLeftY) + CGFloat(gameY) * gap
        let floatY2: CGFloat = CGFloat(topLeftY) + CGFloat(gameY) * gap
        
        let resultPoint2 = CGPoint(x: floatX2, y: floatY2)
        print("1.\(resultPoint2)")
        let resultPoint1 = CGPoint(x: floatX1, y: floatY1)
        print("1.\(resultPoint1)")
        
        return resultPoint1
    }
    
    func drawBoard(color: UIColor) {
        for i in 0...numCells {
            drawLine(withColor: color, fromX: topLeftX, fromY: topLeftY +  CGFloat(i) * gap, toX:topLeftX + CGFloat(numCells) * gap, toY: topLeftY + CGFloat(i) * gap)
        }
        let r = convert(gameX: 1, gameY: 0)
        let w = convert(gameX: 0, gameY: 0)
        
        for i in 0...numCells {
            drawLine(withColor: color,fromX: topLeftX + CGFloat(i) * gap, fromY: topLeftY , toX: topLeftX + CGFloat(i) * gap, toY: topLeftY + CGFloat(numCells) * gap)
        }
        
        for i in 0...3{
            var a = 0
            var b = 0.5
            
            while a < 4 {
                
                drawCell(withColor: .white, x: w.x + gap * 2 * CGFloat(i), y: w.y + gap * CGFloat(a) * 2, width: gap, height: gap)
                
                drawCell(withColor: .gray, x: w.x + gap * 2 * CGFloat(i), y: w.y + gap * CGFloat(b) * 2, width: gap, height: gap)
                
                drawCell(withColor: .gray, x: r.x + gap * 2 * CGFloat(i), y: r.y + gap * CGFloat(a) * 2, width: gap, height: gap)
                
                drawCell(withColor: .white, x: r.x + gap * 2 * CGFloat(i), y: r.y + gap * CGFloat(b) * 2, width: gap, height: gap)
                
                a = a + 1
                b = b + 1
            }
        }
    }
}
