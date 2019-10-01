import Foundation
struct GameRules: CustomStringConvertible {
    
    /*
    0 1 2 3 4 5 6 7
  0 . . . k . . . .
  1 . . . . . . . .
  2 . . . . . . . .
  3 . . . . . . . .
  4 . . . . . . . .
  5 . . . . . . . .
  6 . . . . . . . .
  7 . . . . . . . .
     
 
    */
    var pieceBox = Set<ChessPiece>()
    
    mutating func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard let movingPiece = pieceAt(col: fromCol, row: fromRow) else {
            return
        }
        
        pieceBox.remove(movingPiece)
        
        pieceBox.insert(ChessPiece(col: toCol, row: toRow, rank: movingPiece.rank, isWhite: movingPiece.isWhite, imageName: movingPiece.imageName))
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
