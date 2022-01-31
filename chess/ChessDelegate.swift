import Foundation

protocol ChessDelegate {
    func movePiece(frX: Int, frY: Int, toX: Int, toY: Int)
    func getMovingPiece(x: Int, y: Int) -> ChessPiece?
    func pieceAt(x: Int, y: Int) -> ChessPiece?
}
