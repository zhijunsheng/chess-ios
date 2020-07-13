//
//  ChessEngine.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-06-03.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

struct Chess {
    var pieces: Set<ChessPiece> = []
    var previousPieces: Set<ChessPiece> = []
    private(set) var whiteTurn: Bool = true
    private(set) var lastMovedPiece: ChessPiece?
    
    var whiteKingSideRookMoved = false
    var whiteQueenSideRookMoved = false
    var whiteKingMoved = false
    
    var blackKingSideRookMoved = false
    var blackQueenSideRookMoved = false
    var blackKingMoved = false
    
    func isWithdrawing(move: Move) -> Bool {
        guard let lastMovedPiece = lastMovedPiece, let movingPiece = pieceAt(col: move.fC, row: move.fR) else {
            return false
        }
        
        return movingPiece == lastMovedPiece && whiteTurn != movingPiece.isWhite && pieceAt(col: move.tC, row: move.tR) == nil
    }
    
    mutating func withdraw() {
        guard let lastMovedPiece = lastMovedPiece else {
            return
        }
        pieces = previousPieces
        whiteTurn = lastMovedPiece.isWhite
        self.lastMovedPiece = nil
    }
    
    func needsPromotion() -> Bool {
        if let lastMovedPiece = lastMovedPiece,
           lastMovedPiece.rank == .pawn,
           pieceAt(col: lastMovedPiece.col, row: lastMovedPiece.row)?.rank == .pawn {
            return lastMovedPiece.row == (lastMovedPiece.isWhite ? 0 : 7)
        }
        return false
    }
    
    mutating func promoteTo(rank: ChessRank) {
        guard let lastMovedPiece = lastMovedPiece else {
            return
        }
        
        pieces.remove(lastMovedPiece)
        var imageName: String
        switch rank {
        case .knight:
            imageName = lastMovedPiece.isWhite ? BoardView.knightWhite : BoardView.knightBlack
        case .rook:
            imageName = lastMovedPiece.isWhite ? BoardView.rookWhite : BoardView.rookBlack
        case .bishop:
            imageName = lastMovedPiece.isWhite ? BoardView.bishopWhite : BoardView.bishopBlack
        default:
            imageName = lastMovedPiece.isWhite ? BoardView.queenWhite : BoardView.queenBlack
        }
        pieces.insert(ChessPiece(col: lastMovedPiece.col, row: lastMovedPiece.row, imageName: imageName, isWhite: lastMovedPiece.isWhite, rank: rank))
    }
    
    // for test cases only
    mutating func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        movePiece(move: Move(fromCol, fromRow, toCol, toRow))
    }
    
    mutating func movePiece(move: Move) {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        if isHandicap(move: move) {
            if movingPiece.rank != .king {
                pieces.remove(movingPiece)
            }
            return
        }
        
        if isWithdrawing(move: move) {
            withdraw()
            return
        }
        
        previousPieces = pieces
        
        if movingPiece.rank == .pawn {
            tryRemovingEnPassantEnemy(fromCol, fromRow, toCol, toRow)
        }
        
        if let target = pieceAt(col: toCol, row: toRow) {
            pieces.remove(target)
        }
        
        if movingPiece.rank == .king && fromCol == 4 {
            tryMovingRook(fromRow, toCol, toRow)
        }
        
        pieces.remove(movingPiece)
        pieces.insert(ChessPiece(col: toCol, row: toRow, imageName: movingPiece.imageName, isWhite: movingPiece.isWhite, rank: movingPiece.rank))
        
        updateCastlingPrerequisite(move: move)
        lastMovedPiece = ChessPiece(col: toCol, row: toRow, imageName: movingPiece.imageName, isWhite: movingPiece.isWhite, rank: movingPiece.rank)
        whiteTurn = !whiteTurn
    }
    
    private mutating func tryRemovingEnPassantEnemy(_ fromCol: Int, _ fromRow: Int, _ toCol: Int, _ toRow: Int) {
        if let lastMovedPiece = lastMovedPiece,
           pieceAt(col: toCol, row: toRow) == nil,
           abs(fromCol - toCol) == 1 && abs(fromRow - toRow) == 1 {
            pieces.remove(lastMovedPiece)
        }
    }
    
    private mutating func tryMovingRook(_ fromRow: Int, _ toCol: Int, _ toRow: Int) {
        guard let king = pieceAt(col: 4, row: fromRow) else {
            return
        }
        
        let row = king.isWhite ? 7 : 0
        if toCol == 6 {
            if let rook = pieceAt(col: 7, row: row) {
                pieces.remove(rook)
                pieces.insert(ChessPiece(col: 5, row: row, imageName: rook.imageName, isWhite: rook.isWhite, rank: rook.rank))
            }
        } else if toCol == 2 {
            if let rook = pieceAt(col: 0, row: row) {
                pieces.remove(rook)
                pieces.insert(ChessPiece(col: 3, row: row, imageName: rook.imageName, isWhite: rook.isWhite, rank: rook.rank))
            }
        }
    }
    
    private mutating func updateCastlingPrerequisite(move: Move) {
        let fromCol = move.fC
        let fromRow = move.fR
        
        if fromCol == 4 && fromRow == 7 {
            whiteKingMoved = true
        }
        if fromCol == 7 && fromRow == 7 {
            whiteKingSideRookMoved = true
        }
        if fromCol == 0 && fromRow == 7 {
            whiteQueenSideRookMoved = true
        }
        
        if fromCol == 4 && fromRow == 0 {
            blackKingMoved = true
        }
        if fromCol == 7 && fromRow == 0 {
            blackKingSideRookMoved = true
        }
        if fromCol == 0 && fromRow == 0 {
            blackQueenSideRookMoved = true
        }
    }
    
    func underThreatAt(col: Int, row: Int, whiteEnemy: Bool) -> Bool {
        for piece in pieces where piece.isWhite == whiteEnemy {
            if canPieceAttack(move: Move(fC: piece.col, fR: piece.row, tC: col, tR: row)) {
                return true
            }
        }
        return false
    }
    
    func isHandicap(move: Move) -> Bool {
        return lastMovedPiece == nil && !inBoard(move.tC, move.tR)
    }
    
    // for unit test only
    func isValid(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int, isWhite: Bool) -> Bool {
        return isValid(move: Move(fromCol, fromRow, toCol, toRow), isWhite: isWhite)
    }

    func isValid(move: Move, isWhite: Bool) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        guard inBoard(toCol, toRow), !isStandstill(move: Move(fC: fromCol, fR: fromRow, tC: toCol, tR: toRow)) else {
            return false
        }
        
        if isWithdrawing(move: move) {
            return true
        }
        
        if let target = pieceAt(col: toCol, row: toRow), target.isWhite == movingPiece.isWhite  {
            return false
        }
        
        switch movingPiece.rank {
        case .knight where !validKnight(move):
            return false
        case .rook where !validRook(move):
            return false
        case .bishop where !validBishop(move):
            return false
        case .queen where !validQueen(move):
            return false
        case .king where !canKingMove(move):
            return false
        case .pawn where !canPawnMove(move):
            return false
        default:
            break
        }
        
        if canRescueCheck(move: move, isWhite: isWhite) {
            return true
        }

        if kingExposedBy(protector: movingPiece) {
            return false
        }
        
        return true
    }
    
    private func kingExposedBy(protector: ChessPiece) -> Bool {
        if let king = pieces.filter({ $0.isWhite == protector.isWhite && $0.rank == .king }).first {
            var gameCopy = self
            gameCopy.pieces.remove(protector)
            if gameCopy.checked(isWhite: king.isWhite) {
                return true
            }
        }
        return false
    }
    
    private func isStandstill(move: Move) -> Bool {
        return move.fC == move.tC && move.fR == move.tR
    }
    
    func checked(isWhite: Bool) -> Bool {
        if let king = pieces.filter({ $0.isWhite == isWhite && $0.rank == .king }).first {
            return underThreatAt(col: king.col, row: king.row, whiteEnemy: !isWhite)
        }
        return false
    }
    
    func canRescueCheck(move: Move, isWhite: Bool) -> Bool {
        guard let movingPiece = pieceAt(col: move.fC, row: move.fR), checked(isWhite: isWhite) else {
            return false
        }
        var gameCopy = self
        gameCopy.pieces.remove(movingPiece)
        if let target = gameCopy.pieceAt(col: move.tC, row: move.tR) {
            gameCopy.pieces.remove(target)
        }
        gameCopy.pieces.insert(ChessPiece(col: move.tC, row: move.tR, imageName: movingPiece.imageName, isWhite: movingPiece.isWhite, rank: movingPiece.rank))
        return !gameCopy.checked(isWhite: isWhite)
    }
    
    func canPieceAttack(move: Move) -> Bool {
        guard let movingPiece = pieceAt(col: move.fC, row: move.fR),
              !isStandstill(move: move) else {
            return false
        }

        switch movingPiece.rank {
        case .knight:
            return validKnight(move)
        case .rook:
            return validRook(move)
        case .bishop:
            return validBishop(move)
        case .queen:
            return validQueen(move)
        case .king:
            return canKingAttack(move)
        case .pawn:
            return canPawnAttack(move)
        }
    }
    
    private func validKnight(_ move: Move) -> Bool {
        return
            abs(move.fC - move.tC) == 1 && abs(move.fR - move.tR) == 2 ||
            abs(move.fR - move.tR) == 1 && abs(move.fC - move.tC) == 2
    }
    
    func validRook(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard emptyBetween(move) else {
            return false
        }
        return fromCol == toCol || fromRow == toRow
    }
    
    func validBishop(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard emptyBetween(move) else {
            return false
        }
        return abs(fromCol - toCol) == abs(fromRow - toRow)
    }
    
    func validQueen(_ move: Move) -> Bool {
        return validRook(move) || validBishop(move)
    }
    
    func canKingMove(_ move: Move) -> Bool {
        let toCol = move.tC
        let toRow = move.tR
        
        guard !underThreatAt(col: toCol, row: toRow, whiteEnemy: !whiteTurn) else {
            return false
        }
        if canCastle(toCol: toCol, toRow: toRow) {
            return true
        }
        return canKingAttack(move)
    }
    
    func canKingAttack(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        let deltaCol = abs(fromCol - toCol)
        let deltaRow = abs(fromRow - toRow)
        return (deltaCol == 1 || deltaRow == 1) && deltaCol + deltaRow < 3
    }
    
    func canCastle(toCol: Int, toRow: Int) -> Bool {
        guard
            let piece = pieceAt(col: 4, row: toRow),
            piece.rank == .king,
            piece.isWhite == whiteTurn,
            toRow == (piece.isWhite ? 7 : 0) else {
            return false
        }
        
        let kingSide = toCol == 6
        let row = piece.isWhite ? 7 : 0
        let cols = kingSide ? 5...6 : 1...3
        
        guard emptyAndSafe(row: row, cols: cols, whiteEnemy: !whiteTurn), toCol == (kingSide ? 6 : 2) else {
            return false
        }
        
        if piece.isWhite && !whiteKingMoved {
            return kingSide ? !whiteKingSideRookMoved : !whiteQueenSideRookMoved
        } else if !piece.isWhite && !blackKingMoved {
            return kingSide ? !blackKingSideRookMoved : !blackQueenSideRookMoved
        }
        
        return false
    }
    
    func emptyAndSafe(row: Int, cols: ClosedRange<Int>, whiteEnemy: Bool) -> Bool {
        return emptyAt(row: row, cols: cols) && safeAt(row: row, cols: cols, whiteEnemy: whiteEnemy)
    }
    
    func safeAt(row: Int, cols: ClosedRange<Int>, whiteEnemy: Bool) -> Bool {
        for col in cols {
            if underThreatAt(col: col, row: row, whiteEnemy: whiteEnemy) {
                return false
            }
        }
        return true
    }
    
    func emptyAt(row: Int, cols: ClosedRange<Int>) -> Bool {
        for col in cols {
            if pieceAt(col: col, row: row) != nil {
                return false
            }
        }
        return true
    }
    
    func canPawnMove(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard let movingPawn = pieceAt(col: move.fC, row: move.fR) else {
            return false
        }
        
        if let target = pieceAt(col: move.tC, row: move.tR), target.isWhite != movingPawn.isWhite {
            return canPawnAttack(move)
        } else if toCol == fromCol {
            if pieceAt(col: move.fC, row: move.fR + (movingPawn.isWhite ? -1 : 1)) == nil {
                return
                    move.tR == fromRow + (movingPawn.isWhite ? -1 : 1) ||
                    toRow == fromRow + (movingPawn.isWhite ? -2 : 2) &&
                    pieceAt(col: fromCol, row: toRow) == nil &&
                    fromRow == (movingPawn.isWhite ? 6 : 1)
            }
        } else if let lastMovedPiece = lastMovedPiece,
                  lastMovedPiece.rank == .pawn,
                  lastMovedPiece.isWhite != movingPawn.isWhite,
                  lastMovedPiece.row == fromRow,
                  lastMovedPiece.col == toCol,
                  abs(toCol - fromCol) == 1 {
            if movingPawn.isWhite {
                return fromRow == 3 && toRow == 2
            } else {
                return fromRow == 4 && toRow == 5
            }
        }

        return false
    }
    
    func canPawnAttack(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        guard let movingPawn = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        return toRow == fromRow + (movingPawn.isWhite ? -1 : 1) && abs(toCol - fromCol) == 1
    }
    
    func emptyBetween(_ move: Move) -> Bool {
        let fromCol = move.fC
        let fromRow = move.fR
        let toCol = move.tC
        let toRow = move.tR
        
        if fromRow == toRow { // horizontal
            let minCol = min(fromCol, toCol)
            let maxCol = max(fromCol, toCol)
            if maxCol - minCol < 2   {
                return true
            }
            for i in minCol + 1 ... maxCol - 1 {
                if pieceAt(col: i, row: fromRow) != nil {
                    return false
                }
            }
            return true
        } else if fromCol == toCol { // vertical
            let minRow = min(fromRow, toRow)
            let maxRow = max(fromRow, toRow)
            if maxRow - minRow < 2   {
                return true
            }
            for i in minRow + 1 ... maxRow - 1 {
                if pieceAt(col: fromCol, row: i) != nil {
                    return false
                }
            }
            return true
        } else if abs(fromCol - toCol) == abs(fromRow - toRow) { // diagonal
            let minCol = min(fromCol, toCol)
            let maxCol = max(fromCol, toCol)
            let minRow = min(fromRow, toRow)
            let maxRow = max(fromRow, toRow)
            
            if fromRow - toRow == fromCol - toCol { // top left to bottom right \
                if maxCol - minCol < 2   {
                    return true
                }
                for i in 1..<abs(fromCol - toCol) {
                    if pieceAt(col: minCol + i, row: minRow + i) != nil {
                        return false
                    }
                }
                return true
            } else { // bottom left to top right /
                if maxCol - minCol < 2   {
                    return true
                }
                for i in 1..<abs(fromCol - toCol) {
                    if pieceAt(col: minCol + i, row: maxRow - i) != nil {
                        return false
                    }
                }
                return true
            }
        }
        
        return false
    }
    
    func emptyBetween(from: Int, to: Int, constant: Int) -> Bool {
        let minCol = min(from, to)
        let maxCol = max(from, to)
        if maxCol - minCol < 2   {
            return true
        }
        for i in minCol + 1 ... maxCol - 1 {
            if pieceAt(col: i, row: constant) != nil {
                return false
            }
        }
        return true
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        for piece in pieces {
            if col == piece.col && row == piece.row {
                return piece
            }
        }
        return nil
    }
    
    mutating func initializeGame() {
        pieces.removeAll()
        whiteTurn = true
        lastMovedPiece = nil
        
        whiteKingSideRookMoved = false
        whiteQueenSideRookMoved = false
        whiteKingMoved = false
        
        blackKingSideRookMoved = false
        blackQueenSideRookMoved = false
        blackKingMoved = false
        
        for i in 0..<2 {
            pieces.insert(ChessPiece(col: i * 7, row: 0, imageName: BoardView.rookBlack, isWhite: false, rank: .rook))
            pieces.insert(ChessPiece(col: i * 7, row: 7, imageName: BoardView.rookWhite, isWhite: true, rank: .rook))
            pieces.insert(ChessPiece(col: 1 + i * 5, row: 0, imageName: BoardView.knightBlack, isWhite: false, rank: .knight))
            pieces.insert(ChessPiece(col: 1 + i * 5, row: 7, imageName: BoardView.knightWhite, isWhite: true, rank: .knight))
            pieces.insert(ChessPiece(col: 2 + i * 3, row: 0, imageName: BoardView.bishopBlack, isWhite: false, rank: .bishop))
            pieces.insert(ChessPiece(col: 2 + i * 3, row: 7, imageName: BoardView.bishopWhite, isWhite: true, rank: .bishop))
        }
        
        pieces.insert(ChessPiece(col: 3, row: 0, imageName: BoardView.queenBlack, isWhite: false, rank: .queen))
        pieces.insert(ChessPiece(col: 3, row: 7, imageName: BoardView.queenWhite, isWhite: true, rank: .queen))
        pieces.insert(ChessPiece(col: 4, row: 0, imageName: BoardView.kingBlack, isWhite: false, rank: .king))
        pieces.insert(ChessPiece(col: 4, row: 7, imageName: BoardView.kingWhite, isWhite: true, rank: .king))
        
        for col in 0..<8 {
            pieces.insert(ChessPiece(col: col, row: 1, imageName: BoardView.pawnBlack, isWhite: false, rank: .pawn))
            pieces.insert(ChessPiece(col: col, row: 6, imageName: BoardView.pawnWhite, isWhite: true, rank: .pawn))
        }
    }
    
    private func inBoard(_ col: Int, _ row: Int) -> Bool {
        return col >= 0 && col <= 7 && row >= 0 && row <= 7
    }
}

extension Chess: CustomStringConvertible {
    var description: String {
        var desc = ""
        
        desc += "+ 0 1 2 3 4 5 6 7\n"
        for row in 0..<8 {
            desc += "\(row)"
            for col in 0..<8 {
                if let piece = pieceAt(col: col, row: row) {
                    switch piece.rank {
                    case .king:
                        desc += piece.isWhite ? " k" : " K"
                    case .queen:
                        desc += piece.isWhite ? " q" : " Q"
                    case .bishop:
                        desc += piece.isWhite ? " b" : " B"
                    case .knight:
                        desc += piece.isWhite ? " n" : " N"
                    case .rook:
                        desc += piece.isWhite ? " r" : " R"
                    case .pawn:
                        desc += piece.isWhite ? " p" : " P"
                    }
                } else {
                    desc += " ."
                }
            }
            desc += "\n"
        }
        
        return desc
    }
}

