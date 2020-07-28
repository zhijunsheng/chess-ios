import Foundation
struct GameRules: CustomStringConvertible {
    
    var lastPieceBox = Set<ChessPiece>()
    
    var pieceBox = Set<ChessPiece>()
    
    
    func canKnightMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if fromCol + 1 == toCol && fromRow + 2 == toRow
            || fromCol - 1 == toCol && fromRow - 2 == toRow
            || fromCol + 1 == toCol && fromRow - 2 == toRow
            || fromCol - 1 == toCol && fromRow + 2 == toRow
            || fromCol + 2 == toCol && fromRow + 1 == toRow
            || fromCol - 2 == toCol && fromRow - 1 == toRow
            || fromCol + 2 == toCol && fromRow - 1 == toRow
            || fromCol - 2 == toCol && fromRow + 1 == toRow
            
        {
            return true
        }
        return false
    }
    func canRookMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if pieceAt(col: fromCol, row: fromRow) != nil {
            if fromRow == toRow
                || fromCol == toCol {
                return true
            }
        }
        return false
    }
    func canPawnMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        let movingPiece = pieceAt(col: fromCol, row: fromRow)
        let frwhite: Int = 1
        let trwhite: Int = 3
        let frblack: Int = 6
        let trblack: Int = 4
        if movingPiece?.isWhite == true {
            if fromRow + 1 == toRow && fromCol == toCol
                || fromRow + 1 == toRow && fromCol + 1 == toCol
                || fromRow + 1 == toRow && fromCol - 1 == toCol
                || fromRow == frwhite && toRow == trwhite && fromCol == toCol
            {
                return true
            }
        } else if movingPiece?.isWhite == false {
            if fromRow - 1 == toRow && fromCol == toCol
                || fromRow - 1 == toRow && fromCol + 1 == toCol
                || fromRow - 1 == toRow && fromCol - 1 == toCol
                || fromRow == frblack && toRow == trblack && fromCol == toCol
            {
                return true
            }
            
        }
        return false
    }
    mutating func reset() {
        pieceBox.insert(ChessPiece(col: 3, row: 0, rank: "K", isWhite: true, imageName:   "King-white"))
        pieceBox.insert(ChessPiece(col: 3, row: 7, rank: "K", isWhite: false, imageName:  "King-black"))
        pieceBox.insert(ChessPiece(col: 4, row: 0, rank: "Q", isWhite: true, imageName:  "Queen-white"))
        pieceBox.insert(ChessPiece(col: 4, row: 7, rank: "Q", isWhite: false, imageName: "Queen-black"))
        for i in 0...7 {
            pieceBox.insert(ChessPiece(col: i, row: 1, rank: "P", isWhite: true, imageName:  "Pawn-white"))
            pieceBox.insert(ChessPiece(col: i, row: 6, rank: "P", isWhite: false, imageName: "Pawn-black"))
        }
        for i in 0...1 {
            pieceBox.insert(ChessPiece(col: 0 + i * 7, row: 0, rank: "R", isWhite: true, imageName:    "Rook-white"))
            pieceBox.insert(ChessPiece(col: 0 + i * 7, row: 7, rank: "R", isWhite: false, imageName:   "Rook-black"))
            pieceBox.insert(ChessPiece(col: 1 + i * 5, row: 0, rank: "N", isWhite: true, imageName:  "Knight-white"))
            pieceBox.insert(ChessPiece(col: 1 + i * 5, row: 7, rank: "N", isWhite: false, imageName: "Knight-black"))
            pieceBox.insert(ChessPiece(col: 2 + i * 3, row: 0, rank: "B", isWhite: true, imageName:  "Bishop-white"))
            pieceBox.insert(ChessPiece(col: 2 + i * 3, row: 7, rank: "B", isWhite: false, imageName: "Bishop-black"))
            
        }
    }
    /*
     c o l
     
     0 1 2 3 4 5 6 7
     0 x . . . . . . .
     1 . x . . . . . x
     r  2 . . x . . . x .
     o  3 . . . x . x . .
     w  4 . . . . o . . .
     5 . . . x . x . .
     6 . . x . . . x .
     7 . x . . . . . x
     */
    func canBishopMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        let number: ClosedRange<Int> = 1...8
        for n in number {
            if fromCol + n == toCol && fromRow + n == toRow
                || fromCol + n == toCol && fromRow - n == toRow
                || fromCol - n == toCol && fromRow + n == toRow
                || fromCol - n == toCol && fromRow - n == toRow {
                return true
            }
        }
        return false
    }
    func canQueenMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) ||            canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
    }
    func canKingMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        if fromCol + 1 == toCol && fromRow == toRow
            || fromCol - 1 == toCol && fromRow == toRow
            || fromCol == toCol && fromRow + 1 == toRow
            || fromCol == toCol && fromRow - 1 == toRow
            || fromCol + 1 == toCol && fromRow + 1 == toRow
            || fromCol - 1 == toCol && fromRow - 1 == toRow
            || fromCol + 1 == toCol && fromRow - 1 == toRow
            || fromCol - 1 == toCol && fromRow + 1 == toRow
        {
            return true
        }
        return false
    }
    mutating func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        if !canMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            return
        }
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        let targetPiece = pieceAt(col: toCol, row: toRow)
        if targetPiece != nil {
            pieceBox.remove(targetPiece!)
        }
        
        lastPieceBox = pieceBox
        
        
        
        pieceBox.remove(movingPiece)
        
        pieceBox.insert(ChessPiece(col: toCol, row: toRow, rank: movingPiece.rank, isWhite: movingPiece.isWhite, imageName: movingPiece.imageName))
        
        
        
    }
    /*
     case "K" : desc.append(piece!.isWhite ? " k" : " K")// king
     case "R" : desc.append(piece!.isWhite ? " r" : " R")// rook
     case "N" : desc.append(piece!.isWhite ? " n" : " N")// knight
     case "B" : desc.append(piece!.isWhite ? " b" : " B")// bishop
     case "Q" : desc.append(piece!.isWhite ? " q" : " Q")// queen
     case "P" : desc.append(piece!.isWhite ? " p" : " P")// pown
     
     */
    func canMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return false
        }
        
        if movingPiece.rank == "K" {
            return canKingMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "N" {
            return canKnightMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "B" {
            return canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "R" {
            return canRookMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "Q" {
            return canQueenMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece.rank == "P" {
            return canPawnMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        return true
    }
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        for piece in pieceBox {
            if piece.col == col && piece.row == row {
                return piece
            }
        }
        return nil
    }
    
    var description: String {
        var desc = ""
        desc += "  0 1 2 3 4 5 6 7"
        for y in 0..<8 {
            desc += "\n"
            desc += "\(y)"
            for x in 0..<8 {
                let piece = pieceAt(col: x, row: y)
                if piece == nil {
                    desc.append(" .")
                } else {
                    switch piece!.rank {
                    case "K" : desc.append(piece!.isWhite ? " k" : " K")// king
                    case "R" : desc.append(piece!.isWhite ? " r" : " R")// rook
                    case "N" : desc.append(piece!.isWhite ? " n" : " N")// knight
                    case "B" : desc.append(piece!.isWhite ? " b" : " B")// bishop
                    case "Q" : desc.append(piece!.isWhite ? " q" : " Q")// queen
                    case "P" : desc.append(piece!.isWhite ? " p" : " P")// pown
                        
                    default:
                        break
                    }
                }
            }
        }
        return desc
    }
}
