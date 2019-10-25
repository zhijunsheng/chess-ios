import Foundation

protocol ChessDelegate {
    func movePiece(frX: Int, frY: Int, toX: Int, toY: Int)
}
