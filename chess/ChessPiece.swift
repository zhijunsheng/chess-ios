import Foundation

struct ChessPiece: Hashable {
    var x: Int
    var y: Int
    let isWhite: Bool
    let rank: ChessRank
    let imageName: String
}
