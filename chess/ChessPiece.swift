import Foundation

struct ChessPiece: Hashable {
    var x: Int
    var y: Int
    var isWhite: Bool
    let rank: ChessRank
    var imageName: String
}
