import XCTest
@testable import chess

class KnightTests: XCTestCase {

    /**
        + 0 1 2 3 4 5 6 7
        0 . . . . . . . .
        1 . . . . . . . .
        2 . . . . . . . .
        3 . . . . . . . .
        4 . . . . . . . .
        5 . . . . . . . .
        6 . . . . R . . .
        7 N . . . . . . .
        */
    
    func testKnightMove() {
        var brain = ChessBrain()
        brain.piecesBox.insert(ChessPiece(x: 0, y: 7, isWhite: true, rank: .knight, imageName: "303ffd"))
        print(brain)
        brain.movePiece(frX: 0, frY: 7, toX: 0, toY: 0)
        print(brain)
        XCTAssertNotNil(brain.pieceAt(x: 0, y: 7))
        XCTAssertNil(brain.pieceAt(x: 0, y: 0))
    }
}
