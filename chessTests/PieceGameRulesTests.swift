import XCTest
@testable import chess
class PieceGameRulesTests: XCTestCase {
    
      /*
             c o l
       
         0 1 2 3 4 5 6 7
       0 . . . . . . . .
       1 . . o . . . * .
    r  2 . . . v . v . .
    o  3 . . . . V . . .
    w  4 . . . v . v . .
       5 . . v . . . o .
       6 . v . . . . . .
       7 * . . . . . . .
       
       */
    func testCanBishopMove() {
        let game = GameRules()
        XCTAssertFalse(game.canBishopMove(fromCol: 3, fromRow: 3, toCol: 1, toRow: 2))
        XCTAssertFalse(game.canBishopMove(fromCol: 2, fromRow: 1, toCol: 6, toRow: 5))// XCTAssertTrue(~)
    }
    
    /*
           c o l
     
       0 1 2 3 4 5 6 7
     0 . . . . . . . .
     1 . . n . . . . .
  r  2 . . . x o . . .
  o  3 . . . . . . . .
  w  4 . . . . . . . .
     5 . . . . . . . .
     6 . . . . . . . .
     7 . . . . . . . .
     
     */
    func testCanKnightMove() {
        print("import XCTest")
        let game = GameRules()
        XCTAssertTrue(game.canKnightMove(fromCol: 2, fromRow: 1, toCol: 4, toRow: 2))
        XCTAssertFalse(game.canKnightMove(fromCol: 2, fromRow: 1, toCol: 3, toRow: 2))
    }

    func testPrintingBoard() {
        var game = GameRules()
        print(game)
        game.pieceBox.insert(ChessPiece(col: 3, row: 0, rank: "K", isWhite: true, imageName:   "King-white"))
        game.pieceBox.insert(ChessPiece(col: 3, row: 7, rank: "K", isWhite: false, imageName:  "King-black"))
        game.pieceBox.insert(ChessPiece(col: 4, row: 0, rank: "Q", isWhite: true, imageName:  "Queen-white"))
        game.pieceBox.insert(ChessPiece(col: 4, row: 7, rank: "Q", isWhite: false, imageName: "Queen-black"))
        for i in 0...7 {
            game.pieceBox.insert(ChessPiece(col: i, row: 1, rank: "P", isWhite: true, imageName:  "Pawn-white"))
            game.pieceBox.insert(ChessPiece(col: i, row: 6, rank: "P", isWhite: false, imageName: "Pawn-black"))
        }
        for i in 0...1 {
            game.pieceBox.insert(ChessPiece(col: 0 + i * 7, row: 0, rank: "R", isWhite: true, imageName:    "Rook-white"))
            game.pieceBox.insert(ChessPiece(col: 0 + i * 7, row: 7, rank: "R", isWhite: false, imageName:   "Rook-black"))
            game.pieceBox.insert(ChessPiece(col: 1 + i * 5, row: 0, rank: "N", isWhite: true, imageName:  "Knight-white"))
            game.pieceBox.insert(ChessPiece(col: 1 + i * 5, row: 7, rank: "N", isWhite: false, imageName: "Knight-black"))
            game.pieceBox.insert(ChessPiece(col: 2 + i * 3, row: 0, rank: "B", isWhite: true, imageName:  "Bishop-white"))
            game.pieceBox.insert(ChessPiece(col: 2 + i * 3, row: 7, rank: "B", isWhite: false, imageName: "Bishop-white"))
        };print(game)
    }
}
