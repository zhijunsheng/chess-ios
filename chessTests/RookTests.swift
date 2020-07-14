import XCTest
@testable import chess

class RookTests: XCTestCase {

    /**
     + 0 1 2 3 4 5 6 7
     0 . . . . . . . .
     1 . . . . . . . .
     2 . . . . . . . .
     3 . . . . . . . .
     4 . . . . . . . .
     5 . . . . . . . .
     6 . . . . R . . .
     7 . . . . . . . .
     */
    
    func testRookMove() {
        var brain = ChessBrain()
        brain.piecesBox.insert(ChessPiece(x: 4, y: 6, isWhite: true, rank: .rook, imageName: "133ujedjd"))
        print(brain)
        brain.movePiece(frX: 4, frY: 6, toX: 0, toY: 0)
        print(brain)
        XCTAssertNotNil(brain.pieceAt(x: 4, y: 6))
        XCTAssertNil(brain.pieceAt(x: 0, y: 0))
    }
}
