import XCTest

@testable import chess

class QueenTests: XCTestCase {

    /**
        + 0 1 2 3 4 5 6 7
        0 . . . . . . . .
        1 . . . . . . B .
        2 . . . . . N . .
        3 . . . . . . . .
        4 . . . . . . . .
        5 . . . Q . . . .
        6 . . . . R . . .
        7 . . . . . . . .
        */
    
    func testBishopMove() {
        var brain = ChessBrain()
        brain.piecesBox.insert(ChessPiece(x: 3, y: 5, isWhite: true, rank: .queen, imageName: "fks357"))
        print(brain)
        brain.movePiece(frX: 3, frY: 5, toX: 0, toY: 0)
        print(brain)
        XCTAssertNotNil(brain.pieceAt(x: 3, y: 5))
        XCTAssertNil(brain.pieceAt(x: 0, y: 0))
    }
    
}
