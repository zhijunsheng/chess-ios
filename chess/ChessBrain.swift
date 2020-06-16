import Foundation

struct ChessBrain {
    var piecesBox = Set<ChessPiece>()
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
        for i in 0..<2 {
            piecesBox.insert(ChessPiece(x: 0 + i * 7, y: 0, isWhite: true, rank: .rook, imageName: "Rook-white"))
            piecesBox.insert(ChessPiece(x: 0 + i * 7, y: 7, isWhite: false, rank: .rook, imageName: "Rook-black"))
        }
        
        
        for i in 0..<2 {
            piecesBox.insert(ChessPiece(x: 1 + i * 5, y: 0, isWhite: true, rank: .knight, imageName: "Knight-white"))
            piecesBox.insert(ChessPiece(x: 1 + i * 5, y: 7, isWhite: false, rank: .knight, imageName: "Knight-black"))
        }
        
        for i in 0..<2 {
            piecesBox.insert(ChessPiece(x: 2 + i * 3, y: 0, isWhite: true, rank: .bishop, imageName: "Bishop-white"))
            piecesBox.insert(ChessPiece(x: 2 + i * 3, y: 7, isWhite: false, rank: .bishop, imageName: "Bishop-black"))
        }
        
        piecesBox.insert(ChessPiece(x: 3, y: 0, isWhite: true, rank: .queen, imageName: "Queen-white"))
        piecesBox.insert(ChessPiece(x: 3, y: 7, isWhite: false, rank: .queen, imageName: "Queen-black"))

        piecesBox.insert(ChessPiece(x: 4, y: 0, isWhite: true, rank: .queen, imageName: "King-white"))
        piecesBox.insert(ChessPiece(x: 4, y: 7, isWhite: true, rank: .queen, imageName: "King-black"))
        
        for i in 0..<8 {
            piecesBox.insert(ChessPiece(x: i, y: 1, isWhite: true, rank: .pawn, imageName: "Pawn-white"))
            piecesBox.insert(ChessPiece(x: i, y: 6, isWhite: false, rank: .pawn, imageName: "Pawn-black"))
        }
        
        
                                    // white pawn corner
//        for i in 0..<8 {
//            piecesBox.insert(ChessPiece(x: i, y: 6, isWhite: false, rank: .pawn, imageName: "Pawn-black"))
//        }
       

//
    }
    
    
    
    mutating func movePiece(frX: Int, frY: Int, toX: Int, toY: Int) {
        let beCapturedPiece = pieceAt(x: toX, y: toY)
        guard let movingPiece = pieceAt(x: frX, y: frY) else {
            return
        }
        
        if beCapturedPiece?.isWhite == movingPiece.isWhite {
            return
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
    }
}
