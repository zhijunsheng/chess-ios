import Foundation

struct ChessPiece: Hashable {
    let x: Int
    let y: Int
    let isWhite: Bool
    let rank: ChessRank
    let imageName: String
}
