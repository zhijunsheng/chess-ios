import XCTest
@testable import chess

class PawnTests: XCTestCase {

    /**
        + 0 1 2 3 4 5 6 7
        0 . . . . . . . .
        1 . . . . . . B .
        2 . . . . . N . .
        3 . P . . . . . .
        4 . . . . . . . .
        5 . . . Q . . . .
        6 . . . . R . . .
        7 . . . . . . . .
        */
    
    func testPawnMove() {
        var brain = ChessBrain()
        brain.piecesBox.insert(ChessPiece(x: 1, y: 3, isWhite: true, rank: .pawn, imageName: "djg358"))
        print(brain)
        brain.movePiece(frX: 1, frY: 3, toX: 0, toY: 0)
        print(brain)
        XCTAssertNotNil(brain.pieceAt(x: 1, y: 3))
        XCTAssertNil(brain.pieceAt(x: 0, y: 0))
    }
    
}
