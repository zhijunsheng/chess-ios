import Foundation

struct ChessBrain {
    var piecesBox = Set<ChessPiece>()
    
    func pieceAt(x: Int, y: Int) -> ChessPiece? {
        for piece in piecesBox {
            if piece.x == x && piece.y == y {
                return piece
            }
        }
        
        return nil
    }
    
    mutating func reset() {
        piecesBox.insert(ChessPiece(x: 0, y: 0, isWhite: true, rank: .rook, imageName: "Rook-white"))
        piecesBox.insert(ChessPiece(x: 1, y: 0, isWhite: true, rank: .rook, imageName: "Knight-white"))
        piecesBox.insert(ChessPiece(x: 2, y: 0, isWhite: true, rank: .rook, imageName: "Bishop-white"))
        piecesBox.insert(ChessPiece(x: 3, y: 0, isWhite: true, rank: .rook, imageName: "Queen-white"))
        piecesBox.insert(ChessPiece(x: 4, y: 0, isWhite: true, rank: .rook, imageName: "King-white"))
        piecesBox.insert(ChessPiece(x: 5, y: 0, isWhite: true, rank: .rook, imageName: "Bishop-white"))
        piecesBox.insert(ChessPiece(x: 6, y: 0, isWhite: true, rank: .rook, imageName: "Knight-white"))
        piecesBox.insert(ChessPiece(x: 7, y: 0, isWhite: true, rank: .rook, imageName: "Rook-white"))
                                    // white pawn corner
        piecesBox.insert(ChessPiece(x: 0, y: 1, isWhite: true, rank: .pawn, imageName: "Pawn-white"))
        piecesBox.insert(ChessPiece(x: 1, y: 1, isWhite: true, rank: .pawn, imageName: "Pawn-white"))
        piecesBox.insert(ChessPiece(x: 2, y: 1, isWhite: true, rank: .pawn, imageName: "Pawn-white"))
        piecesBox.insert(ChessPiece(x: 3, y: 1, isWhite: true, rank: .pawn, imageName: "Pawn-white"))
        piecesBox.insert(ChessPiece(x: 4, y: 1, isWhite: true, rank: .pawn, imageName: "Pawn-white"))
        piecesBox.insert(ChessPiece(x: 5, y: 1, isWhite: true, rank: .pawn, imageName: "Pawn-white"))
        piecesBox.insert(ChessPiece(x: 6, y: 1, isWhite: true, rank: .pawn, imageName: "Pawn-white"))
        piecesBox.insert(ChessPiece(x: 7, y: 1, isWhite: true, rank: .pawn, imageName: "Pawn-white"))
        
        
        
        piecesBox.insert(ChessPiece(x: 0, y: 7, isWhite: true, rank: .rook, imageName: "Rook-black"))
        piecesBox.insert(ChessPiece(x: 1, y: 7, isWhite: true, rank: .rook, imageName: "Knight-black"))
        piecesBox.insert(ChessPiece(x: 2, y: 7, isWhite: true, rank: .rook, imageName: "Bishop-black"))
        piecesBox.insert(ChessPiece(x: 3, y: 7, isWhite: true, rank: .rook, imageName: "Queen-black"))
        piecesBox.insert(ChessPiece(x: 4, y: 7, isWhite: true, rank: .rook, imageName: "King-black"))
        piecesBox.insert(ChessPiece(x: 5, y: 7, isWhite: true, rank: .rook, imageName: "Bishop-black"))
        piecesBox.insert(ChessPiece(x: 6, y: 7, isWhite: true, rank: .rook, imageName: "Knight-black"))
        piecesBox.insert(ChessPiece(x: 7, y: 7, isWhite: true, rank: .rook, imageName: "Rook-black"))
                                    // white pawn corner
        piecesBox.insert(ChessPiece(x: 0, y: 6, isWhite: true, rank: .pawn, imageName: "Pawn-black"))
        piecesBox.insert(ChessPiece(x: 1, y: 6, isWhite: true, rank: .pawn, imageName: "Pawn-black"))
        piecesBox.insert(ChessPiece(x: 2, y: 6, isWhite: true, rank: .pawn, imageName: "Pawn-black"))
        piecesBox.insert(ChessPiece(x: 3, y: 6, isWhite: true, rank: .pawn, imageName: "Pawn-black"))
        piecesBox.insert(ChessPiece(x: 4, y: 6, isWhite: true, rank: .pawn, imageName: "Pawn-black"))
        piecesBox.insert(ChessPiece(x: 5, y: 6, isWhite: true, rank: .pawn, imageName: "Pawn-black"))
        piecesBox.insert(ChessPiece(x: 6, y: 6, isWhite: true, rank: .pawn, imageName: "Pawn-black"))
        piecesBox.insert(ChessPiece(x: 7, y: 6, isWhite: true, rank: .pawn, imageName: "Pawn-black"))


    }
    
    
    
    mutating func movePiece(frX: Int, frY: Int, toX: Int, toY: Int) {
        let beCapturedPiece = pieceAt(x: toX, y: toY)
        let movingPiece = pieceAt(x: frX, y: frY)
        if beCapturedPiece?.isWhite == movingPiece?.isWhite {
            return
        }
        
        if let actualBeCapturedPiece = beCapturedPiece {
            piecesBox.remove(actualBeCapturedPiece)
        }
        
        if let actualMovingPiece = movingPiece {
            piecesBox.remove(actualMovingPiece)
            piecesBox.insert(ChessPiece(x: toX, y: toY, isWhite: actualMovingPiece.isWhite, rank: actualMovingPiece.rank, imageName: actualMovingPiece.imageName))
        }
    }
    
}
