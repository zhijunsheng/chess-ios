import Foundation
protocol ChessDelegate {
    func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int)
}
