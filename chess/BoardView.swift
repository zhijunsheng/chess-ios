//
//  BoardView.swift
//  chess
//
//  Created by Felix Lo on 2020/7/24.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    
    var cell: CGFloat = 75
    var originX: CGFloat = 50
    var originY: CGFloat = 50
    var shadowPieces: Set<Piece> = []
    
    override func draw(_ rect: CGRect) {
        shadowPieces.insert(Piece(col: 3, row: 7, player: .white, rank: .queen, imageName: "queen_w"))
        shadowPieces.insert(Piece(col: 4, row: 7, player: .white, rank: .king, imageName: "king_w"))
        shadowPieces.insert(Piece(col: 3, row: 0, player: .black, rank: .queen, imageName: "queen_b"))
        shadowPieces.insert(Piece(col: 4, row: 0, player: .black, rank: .king, imageName: "king_b"))
        
        for i in 0 ..< 8 {
            shadowPieces.insert(Piece(col: i, row: 6, player: .white, rank: .pawn, imageName: "pawn_w"))
            shadowPieces.insert(Piece(col: i, row: 1, player: .black, rank: .queen, imageName: "pawn_b"))
        }
        
        for i in 0 ..< 2 {
            shadowPieces.insert(Piece(col: i * 7, row: 0, player: .black, rank: .rook, imageName: "rook_b"))
            shadowPieces.insert(Piece(col: i * 5 + 1, row: 0, player: .black, rank: .knight, imageName: "knight_b"))
            shadowPieces.insert(Piece(col: i * 3 + 2, row: 0, player: .black, rank: .bishop, imageName: "bishop_b"))
            shadowPieces.insert(Piece(col: i * 7, row: 7, player: .white, rank: .rook, imageName: "rook_w"))
            shadowPieces.insert(Piece(col: i * 5 + 1, row: 7, player: .white, rank: .knight, imageName: "knight_w"))
            shadowPieces.insert(Piece(col: i * 3 + 2, row: 7, player: .white, rank: .bishop, imageName: "bishop_w"))
        }
        
        
        cell = bounds.width/9
        originX = (bounds.width - cell * 8)/2
        originY = (bounds.height - cell * 8)/2
        
        drawBoard()
        drawPieces()
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor) {
        let colourPath = UIBezierPath()
        color.setFill()
        colourPath.move(to: CGPoint(x: CGFloat(col) * cell + originX, y: CGFloat(row) * cell + originY))
        colourPath.addLine(to: CGPoint(x: CGFloat(col) * cell + cell + originX, y: CGFloat(row) * cell + originY))
        colourPath.addLine(to: CGPoint(x: CGFloat(col) * cell + cell + originX, y: CGFloat(row) * cell + cell + originY))
        colourPath.addLine(to: CGPoint(x: CGFloat(col) * cell + originX, y: CGFloat(row) * cell + cell + originY))
        colourPath.fill()
    }
    
    func drawBoard() {
        let path = UIBezierPath()
        
        for i in 0 ..< 9 {
            path.move(to: CGPoint(x: CGFloat(i) * cell + originX, y: originY))
            path.addLine(to: CGPoint(x: CGFloat(i) * cell + originX, y: cell * 8 + originY))
            
            path.move(to: CGPoint(x: originX, y: CGFloat(i) * cell + originY))
            path.addLine(to: CGPoint(x: cell * 8 + originX, y: CGFloat(i) * cell + originY))
        }
        
        for j in 0 ... 3 {
            for i in 0 ... 3 {
                drawSquare(col: i * 2 + 1, row: j * 2, color: #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1))
                drawSquare(col: i * 2, row: j * 2 + 1, color: #colorLiteral(red: 0, green: 0.5598887801, blue: 0.3187503517, alpha: 1))
                drawSquare(col: i * 2, row: j * 2, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                drawSquare(col: i * 2 + 1, row: j * 2 + 1, color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            }
        }
        
        path.stroke()
    }
    
    func drawPieces() {
        for piece in shadowPieces {
            let pieceImage = UIImage(named: piece.imageName)
            pieceImage?.draw(in: CGRect(x: CGFloat(piece.col) * cell + originX, y: CGFloat(piece.row) * cell + originY, width: cell, height: cell))
        }
        
    }
}
