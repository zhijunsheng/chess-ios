import XCTest
@testable import chess

class BishopTests: XCTestCase {

    /**
        + 0 1 2 3 4 5 6 7
        0 . . . . . . . .
        1 . . . . . . B .
        2 . . . . . N . .
        3 . . . . . . . .
        4 . . . . . . . .
        5 . . . . . . . .
        6 . . . . R . . .
        7 . . . . . . . .
        */
    
    func testBishopMove() {
        var brain = ChessBrain()
        brain.piecesBox.insert(ChessPiece(x: 6, y: 1, isWhite: true, rank: .bishop, imageName: "fdg573"))
        print(brain)
        brain.movePiece(frX: 6, frY: 1, toX: 0, toY: 0)
        print(brain)
        XCTAssertNotNil(brain.pieceAt(x: 6, y: 1))
        XCTAssertNil(brain.pieceAt(x: 0, y: 0))
    }
    
}
