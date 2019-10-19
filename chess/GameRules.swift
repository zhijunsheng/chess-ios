import Foundation
struct GameRules: CustomStringConvertible {
    var pieceBox = Set<ChessPiece>()
    
      /*
             c o l
       
         0 1 2 3 4 5 6 7
       0 . . . . . . . .
       1 . . n . . . . .
    r  2 . . . x o . . .
    o  3 . . . . . . . .
    w  4 . . . . . . . .
       5 . . . . . . . .
       6 . . . . . . . .
       7 . . . . . . . .
              c o l
     
          0 1 2 3 4 5 6 7
        0 . . . . . . . .
        1 . . . . . . . .
     r  2 . . o . o . . .
     o  3 . o . . . o . .
     w  4 . . . n . . . .
        5 . o . . . o . .
        6 . . o . o . . .
        7 . . . . . . . .
       
       */
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
    func canPawnMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        let movingPiece = pieceAt(col: fromCol, row: fromRow)
        if movingPiece?.isWhite == true {
            if fromRow + 1 == toRow && fromCol == toCol
            || fromRow + 1 == toRow && fromCol + 1 == toCol
            || fromRow + 1 == toRow && fromCol - 1 == toCol
            {
                return true
            }
        }else if movingPiece?.isWhite == false {
            if fromRow - 1 == toRow && fromCol == toCol
            || fromRow - 1 == toRow && fromCol + 1 == toCol
            || fromRow - 1 == toRow && fromCol - 1 == toCol
            {
                return true
            }
        }
        return false
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

        return true
    }
    func canKingMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) -> Bool {
        return fromCol + 1 == toCol && fromRow == toRow
        || fromCol - 1 == toCol && fromRow == toRow
        || fromCol == toCol && fromRow + 1 == toRow
        || fromCol == toCol && fromRow - 1 == toRow
        || fromCol + 1 == toCol && fromRow + 1 == toRow
        || fromCol - 1 == toCol && fromRow - 1 == toRow
        || fromCol + 1 == toCol && fromRow - 1 == toRow
        || fromCol - 1 == toCol && fromRow + 1 == toRow
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
        let movingPiece = pieceAt(col: fromCol, row: fromRow)
        
        if movingPiece?.rank == "K" {
            return canKingMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece?.rank == "N" {
            return canKnightMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        } else if movingPiece?.rank == "B" {
            return canBishopMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        }
        return true
    }
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        for piece in pieceBox {
            if piece.col == col && piece.row == row {
                return piece
            }
        }; return nil
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
        }; return desc
    }
}
