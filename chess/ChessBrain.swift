import Foundation

struct ChessBrain: CustomStringConvertible {
    
    var description: String {
        /*
          0 1 2
        0 R . B . . . . .
        1 . . . . . . . .
        2 . . . . . . . .
         . . . . . . . .
         . . . . . . . .
         . . . . . . . .
         . . . . . . . .
         . . . . . . . .
         
         */
        var desc = ""
        
        desc += "  0 1 2 3 4 5 6 7 \n"
        
        for row in 0..<8 {
            desc += "\(row) "
            for col in 0..<8 {
                if let piece = pieceAt(x: col, y: row) {
                    switch piece.rank {
                    case .rook:
                        desc += piece.isWhite ? "R " : "r "
                    case .knight:
                        desc += piece.isWhite ? "N " : "n "
                    case .bishop:
                        desc += piece.isWhite ? "B " : "b "
                    case .king:
                        desc += piece.isWhite ? "K " : "k "
                    case .pawn:
                        desc += piece.isWhite ? "P " : "p "
                    case .queen:
                        desc += piece.isWhite ? "Q " : "q "
                    }
                } else {
                    desc += ". "
                }
            }
            
            desc += "\n"
        }

        return desc
    }
    
    var piecesBox = Set<ChessPiece>()
    var lastMovedPiece: ChessPiece? = nil
    
    var promotingPawn: ChessPiece? = nil
    
    
    mutating func promote(rank: ChessRank) {
        guard let promotingPawn = promotingPawn else {
            return
        }
//        promotingPawn?.rank = rank
        var imageName = ""
        if promotingPawn.isWhite {
            switch rank {
            case .queen:
                imageName = "Queen-white"
            case .knight:
                imageName = "Knight-white"
            case .rook:
                imageName = "Rook-white"
            case .bishop:
                imageName = "Bishop-white"
            default:
                break
            }
            
        } else {
            switch rank {
            case .queen:
                imageName = "Queen-black"
            case .knight:
                imageName = "Knight-black"
            case .rook:
                imageName = "Rook-black"
            case .bishop:
                imageName = "Bishop-black"
            default:
                break
            }
        }
        
            piecesBox.remove(promotingPawn)
   //     piecesBox.insert(<#T##newMember: ChessPiece##ChessPiece#>)
    }
    
    func pieceAt(x: Int, y: Int) -> ChessPiece? {
        for piece in piecesBox {
            if piece.x == x && piece.y == y {
                return piece
            }
        }
        
        return nil
    }
    
    /**
    
    i => ?
    0 => 1
    1 => 6
     2 => ?
     3 => ?
     
     */
    mutating func reset() {
        piecesBox.removeAll()
        
        for i in 0..<2 {
            piecesBox.insert(ChessPiece(x: 0 + i * 7, y: 7, isWhite: true, rank: .rook, imageName: "Rook-white"))
            piecesBox.insert(ChessPiece(x: 0 + i * 7, y: 0, isWhite: false, rank: .rook, imageName: "Rook-black"))
        }
        
        
        for i in 0..<2 {
            piecesBox.insert(ChessPiece(x: 1 + i * 5, y: 7, isWhite: true, rank: .knight, imageName: "Knight-white"))
            piecesBox.insert(ChessPiece(x: 1 + i * 5, y: 0, isWhite: false, rank: .knight, imageName: "Knight-black"))
        }
        
        for i in 0..<2 {
            piecesBox.insert(ChessPiece(x: 2 + i * 3, y: 7, isWhite: true, rank: .bishop, imageName: "Bishop-white"))
            piecesBox.insert(ChessPiece(x: 2 + i * 3, y: 0, isWhite: false, rank: .bishop, imageName: "Bishop-black"))
        }
        
        piecesBox.insert(ChessPiece(x: 3, y: 7, isWhite: true, rank: .queen, imageName: "Queen-white"))
        piecesBox.insert(ChessPiece(x: 3, y: 0, isWhite: false, rank: .queen, imageName: "Queen-black"))

        piecesBox.insert(ChessPiece(x: 4, y: 7, isWhite: true, rank: .king, imageName: "King-white"))
        piecesBox.insert(ChessPiece(x: 4, y: 0, isWhite: false, rank: .king, imageName: "King-black"))
        
        for i in 0..<8 {
            piecesBox.insert(ChessPiece(x: i, y: 6, isWhite: true, rank: .pawn, imageName: "Pawn-white"))
            piecesBox.insert(ChessPiece(x: i, y: 1, isWhite: false, rank: .pawn, imageName: "Pawn-black"))
        }
    }
    
    mutating func movePiece(frX: Int, frY: Int, toX: Int, toY: Int) {
        if toX > 7 || toX < 0 || toY > 7 || toY < 0 {
            return
        }
        
        let beCapturedPiece = pieceAt(x: toX, y: toY)
        guard let movingPiece = pieceAt(x: frX, y: frY) else {
            return
        }
        
        if beCapturedPiece?.isWhite == movingPiece.isWhite {
            return
        }
        
        switch movingPiece.rank {
        case .rook:
            if !isValidRook(frX: frX, frY: frY, toX: toX, toY: toY) {
                return
            }
            
        case .knight:
            if !isValidKnight(frX: frX, frY: frY, toX: toX, toY: toY) {
                return
            }
            
        case .bishop:
            if !isValidBishop(frX: frX, frY: frY, toX: toX, toY: toY) {
                return
            }
        case .king:
            break
        case .pawn:
            if !isValidPawn(frX: frX, frY: frY, toX: toX, toY: toY) {
                return
            } else {
                if let lastMovedPiece = lastMovedPiece {
                    if isEnPassant(frX: frX, frY: frY, toX: toX, toY: toY) {
                        piecesBox.remove(lastMovedPiece)
                    }
                }
            }
        case .queen:
            if !isValidQueen(frX: frX, frY: frY, toX: toX, toY: toY) {
                return
            }
        }
        
        if let actualBeCapturedPiece = beCapturedPiece {
            piecesBox.remove(actualBeCapturedPiece)
        }
                      
        piecesBox.remove(movingPiece)
        let movedPiece = ChessPiece(x: toX, y: toY, isWhite: movingPiece.isWhite, rank: movingPiece.rank, imageName: movingPiece.imageName)
        
        piecesBox.insert(movedPiece)
        
       
        if movedPiece.rank == .pawn && movedPiece.y == 7 || movedPiece.rank == .pawn && movedPiece.y == 0 {
            promotingPawn = movedPiece
        }
        
        lastMovedPiece = movedPiece
    }
    
    func isValidRook(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        return frX == toX && frY != toY ||
               frX != toX && frY == toY
    }
    
    /**
     frX +1/+2/-1/-2 = toX
     frY +2/+1/-2/-1 = toY (8)
     */
    
    func isValidKnight(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        return frX + 1 == toX && frY + 2 == toY ||
               frX + 2 == toX && frY + 1 == toY ||
               frX - 1 == toX && frY + 2 == toY ||
               frX - 2 == toX && frY + 1 == toY ||
               frX + 1 == toX && frY - 2 == toY ||
               frX + 2 == toX && frY - 1 == toY ||
               frX - 1 == toX && frY - 2 == toY ||
               frX - 2 == toX && frY - 1 == toY
    }
    
    func isValidBishop(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        let deltaX = abs(frX - toX)
        return frX + deltaX == toX && frY + deltaX == toY ||
               frX - deltaX == toX && frY + deltaX == toY ||
               frX + deltaX == toX && frY - deltaX == toY ||
               frX - deltaX == toX && frY - deltaX == toY
    }
    
    func isValidQueen(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        return isValidRook(frX: frX, frY: frY, toX: toX, toY: toY) ||
               isValidBishop(frX: frX, frY: frY, toX: toX, toY: toY)
    }
    
    func isValidPawn(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        guard let movingPiece = pieceAt(x: frX, y: frY) else {
            return false
        }
        
        if isEnPassant(frX: frX, frY: frY, toX: toX, toY: toY) {
            return true
        }
        
        switch movingPiece.isWhite {
        case true:
            
            
            if let target = pieceAt(x: toX, y: toY) {
                // capture
                if target.x == movingPiece.x + 1 {
                    return frX + 1 == toX && frY - 1 == toY
                } else if target.x == movingPiece.x - 1 {
                    return frX - 1 == toX && frY - 1 == toY
                } else {
                    return false
                }
                
                
            } else {
                
                
                // normal move
                if frY == 6 {
                    return frX == toX && frY - 1 == toY ||
                           frX == toX && frY - 2 == toY
                } else {
                    return frX == toX && frY - 1 == toY
                }
                
                
            }
            
        case false:
            if let target = pieceAt(x: toX, y: toY) {
                if target.x == movingPiece.x + 1 {
                    return frX + 1 == toX && frY + 1 == toY
                } else if target.x == movingPiece.x - 1 {
                    return frX - 1 == toX && frY + 1 == toY
                } else {
                    return false
                }
            } else {
                
                if frY == 1 {
                    return frX == toX && frY + 1 == toY ||
                           frX == toX && frY + 2 == toY
                } else {
                    return frX == toX && frY + 1 == toY
                }
            }
        }
    }
    
    func isEnPassant(frX: Int, frY: Int, toX: Int, toY: Int) -> Bool {
        guard let movingPiece = pieceAt(x: frX, y: frY) else {
            return false
        }
        
        switch movingPiece.isWhite {
        case true:
            if let deadPiece = pieceAt(x: toX, y: 3), frY == 3, toY == 2, deadPiece.rank == .pawn, lastMovedPiece == deadPiece {
                return abs(frX - toX) == 1
            }
        
        case false:
            if let deadPiece = pieceAt(x: toX, y: 4), frY == 4, toY == 5, deadPiece.rank == .pawn, lastMovedPiece == deadPiece {
                
                return abs(frX - toX) == 1
            }
        }
        
        return false
    }
}
