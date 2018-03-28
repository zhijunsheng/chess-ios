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
//        drawPawns()
//        drawBishops()
        drawRooks()
//        drawKings()
//        drawQueens()
//        drawKnights()
    }
    
    func drawKnights(){
        drawKnightW(xAxis: 2, yAxis: 8)
        drawKnightW(xAxis: 7, yAxis: 8)
        drawKnightB(xAxis: 2, yAxis: 1)
        drawKnightB(xAxis: 7, yAxis: 1)
    }
    
    func drawQueens(){
        drawQueenB(xAxis: 5, yAxis: 1)
        drawQueenW(xAxis: 4, yAxis: 8)
    }
    
    func drawKings(){
        drawKingW(xAxis: 5, yAxis: 8)
        drawKingB(xAxis: 4, yAxis: 1)
    }
    func rowToY(){
        
        
    }
    func drawRooks(){
        var Brl1col = board.pieces[0].location.col
        var Brl1row = board.pieces[0].location.row
        //        drawRookW(xAxis: 1, yAxis: 8)
//        drawRookW(xAxis: 8, yAxis: 8)
        drawRookB(xAxis: Brl1col, yAxis: Brl1row)
//        drawRookB(xAxis: 8, yAxis: 1)
    }
    
    func drawBishops(){
        drawBishopB(xAxis: 3, yAxis: 1)
        drawBishopB(xAxis: 6, yAxis: 1)
        drawBishopW(xAxis: 3, yAxis: 8)
        drawBishopW(xAxis: 6, yAxis: 8)
    }
    
    func drawPawns(){
        drawPawnW(xAxis: 1, yAxis: 7)
        drawPawnW(xAxis: 2, yAxis: 7)
        drawPawnW(xAxis: 3, yAxis: 7)
        drawPawnW(xAxis: 4, yAxis: 7)
        drawPawnW(xAxis: 5, yAxis: 7)
        drawPawnW(xAxis: 6, yAxis: 7)
        drawPawnW(xAxis: 7, yAxis: 7)
        drawPawnW(xAxis: 8, yAxis: 7)
        drawPawnB(xAxis: 1, yAxis: 2)
        drawPawnB(xAxis: 2, yAxis: 2)
        drawPawnB(xAxis: 3, yAxis: 2)
        drawPawnB(xAxis: 4, yAxis: 2)
        drawPawnB(xAxis: 5, yAxis: 2)
        drawPawnB(xAxis: 6, yAxis: 2)
        drawPawnB(xAxis: 7, yAxis: 2)
        drawPawnB(xAxis: 8, yAxis: 2)
    }
    
    func drawKnightB(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "knight_chess_b")
        piece?.draw(in: CGRect(x: x + 3, y: y, width: gap - 3, height: gap - 1))
    }
    
    func drawKnightW(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "knight_chess_w")
        piece?.draw(in: CGRect(x: x + 3, y: y + 1, width: gap - 4, height: gap - 2))
    }
    
    func drawQueenW(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "queen_chess_w")
        piece?.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
    }
    
    func drawQueenB(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "queen_chess_b")
        piece?.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
    }
    
    func drawKingB(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "king_chess_b")
        piece?.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
    }
    
    func drawKingW(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "king_chess_w")
        piece?.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
    }
    
    func drawRookB(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "rook_chess_b")
        piece?.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
    }
    
    func drawRookW(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "rook_chess_w")
        piece?.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
    }
    
    func drawBishopW(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "bishop_chess_w")
        piece?.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
    }
    
    func drawBishopB(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "bishop_chess_b")
        piece?.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
    }
    
    func drawPawnB(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "pawn_chess_b")
        piece?.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
    }
    
    func drawPawnW(xAxis: Int, yAxis: Int){
        let x = topLeftX - gap + CGFloat(xAxis) * gap
        let y = topLeftY - gap + CGFloat(yAxis) * gap
        
        let piece = UIImage(named: "pawn_chess_w")
        piece?.draw(in: CGRect(x: x, y: y, width: gap, height: gap))
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
