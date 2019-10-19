import XCTest
@testable import chess
class PieceGameRulesTests: XCTestCase {
    /*
             c o l
       
         0 1 2 3 4 5 6 7
       0 . . . . . . . .
       1 . . . p . . . .
    r  2 . . o O o . . .
    o  3 . . . . . . . .
    w  4 . . . . . . . .
       5 . . o O o . . .
       6 . . . P . . . .
       7 . . . . . . . .
       
       */
    
    func testCanPawnMove() {
        var game = GameRules()
        game.pieceBox.insert(ChessPiece(col: 6, row: 7, rank: "P", isWhite: false, imageName: ""))
        XCTAssertTrue(game.canPawnMove(fromCol: 6, fromRow: 7, toCol: 7, toRow: 6))
        XCTAssertFalse(game.canPawnMove(fromCol: 6, fromRow: 7, toCol: 3, toRow: 2))
    }
    
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
        XCTAssertFalse(game.canBishopMove(fromCol: 2, fromRow: 1, toCol: 6, toRow: 5))
    }
    /*
             c o l
       
         0 1 2 3 4 5 6 7
       0 . . . . . . . .
       1 . . . . . . . .
    r  2 . . o o o . . .
    o  3 . . o k o . . .
    w  4 . . o o o . . .
       5 . . . . . . . .
       6 . . . . . . . .
       7 . . . . . . . .
       
       */
    func testCanKingMove() {
        let game = GameRules()
        XCTAssertTrue(game.canKingMove(fromCol: 5, fromRow: 6, toCol: 5, toRow: 7))
        XCTAssertFalse(game.canKingMove(fromCol: 3, fromRow: 6, toCol: 5, toRow: 7))
    }
    
    /*
           c o l
     
       0 1 2 3 4 5 6 7
     0 . . . . . . . .
     1 . . . . . . . .
  r  2 . . o . o . . .
  o  3 . o . . . o . .
  w  4 . . . n . . . .
     5 . o . . . o . .
     6 . . o . o . . .
     7 . . . . . . . .
     
     */
    func testCanKnightMove() {
        print("import XCTest")
        let game = GameRules()
        XCTAssertFalse(game.canKnightMove(fromCol: 2, fromRow: 1, toCol: 3, toRow: 2))
        
        XCTAssertTrue(game.canKnightMove(fromCol: 2, fromRow: 1, toCol: 4, toRow: 2))
        
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
