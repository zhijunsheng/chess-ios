//
//  SetTests.swift
//  chessTests
//
//  Created by Lambert Lin on 2019/11/20.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import XCTest
@testable import chess

class SetTests: XCTestCase {
    
    func testCapture() {
        var chessEngine: ChessEngine = ChessEngine()
        
        let movingPiece = ChessPiece(col: 4, row: 6, rank: "queen", isBlack: false, imageName: "queen_chess_w")
        chessEngine.pieceBox.insert(movingPiece)
        
        let targetPiece = ChessPiece(col: 7, row: 4, rank: "bishop", isBlack: true, imageName:"bishop_chess_b" )
        chessEngine.pieceBox.insert(targetPiece)
        
        for piece in chessEngine.pieceBox {
            print("ChessPiece(col: \(piece.col), row: \(piece.row), rank: \(piece.rank), isblack: \(piece.isBlack), imageName: \(piece.imageName))")
        }
        
        //==================================================
        
        chessEngine.pieceBox.remove(movingPiece)
        chessEngine.pieceBox.remove(targetPiece)
          
        chessEngine.pieceBox.insert(ChessPiece(col: targetPiece.col, row: targetPiece.row, rank: movingPiece.rank, isBlack: movingPiece.isBlack, imageName: movingPiece.imageName))
        
        for piece in chessEngine.pieceBox {
            print("ChessPiece(col: \(piece.col), row: \(piece.row), rank: \(piece.rank), isblack: \(piece.isBlack), imageName: \(piece.imageName))")
        }
    }
    
    func testPiecesBox() {
        var chessEngine: ChessEngine = ChessEngine()
        let movingPiece = ChessPiece(col: 7, row: 7, rank: "rook", isBlack: true, imageName: "rook_chess_b")
        
        chessEngine.pieceBox.insert(movingPiece)
     
        for piece in chessEngine.pieceBox {
            print("ChessPiece(col: \(piece.col), row: \(piece.row), rank: \(piece.rank), isblack: \(piece.isBlack), imageName: \(piece.imageName))")
        }
        
        chessEngine.pieceBox.remove(movingPiece)
        
        for piece in chessEngine.pieceBox {
            print("ChessPiece(col: \(piece.col), row: \(piece.row), rank: \(piece.rank), isblack: \(piece.isBlack), imageName: \(piece.imageName))")
        }
        
        
        chessEngine.pieceBox.insert(ChessPiece(col: 7, row: 4, rank: movingPiece.rank, isBlack: movingPiece.isBlack, imageName: movingPiece.imageName))
        
        for piece in chessEngine.pieceBox {
            print("ChessPiece(col: \(piece.col), row: \(piece.row), rank: \(piece.rank), isblack: \(piece.isBlack), imageName: \(piece.imageName))")
        }
    }
    
    func testSet() {
        var intBox: Set<Int> = Set<Int>()
        intBox.insert(707)
        intBox.insert(727)
        intBox.insert(737)
        intBox.insert(747)
        intBox.insert(757)
        intBox.insert(767)
        intBox.insert(777)
        intBox.insert(787)
        intBox.insert(747)
        intBox.insert(747)
        
        for anInt in intBox {
            print("\(anInt)")
        }
    }
}

