import UIKit

class ViewController: UIViewController, ChessDelegate {
    var game = GameRules()
    
    @IBOutlet weak var isWhiteTurnLabel: UILabel!
    
    
    @IBAction func newGame(_ sender: Any) {
    }
    @IBOutlet weak var boardView: BoardView!
    @IBAction func withdraw(_ sender: Any) {

        game.pieceBox = game.lastPieceBox
        boardView.shadowPieceBox = game.lastPieceBox
        boardView.setNeedsDisplay()



        print("(_ sender: Any)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.delegate = self
        
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
            game.pieceBox.insert(ChessPiece(col: 2 + i * 3, row: 7, rank: "B", isWhite: false, imageName: "Bishop-black"))
            
        }
        
        boardView.shadowPieceBox = game.pieceBox
        boardView.setNeedsDisplay()
    }
    
    func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        game.move(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.shadowPieceBox = game.pieceBox
        boardView.setNeedsDisplay()
    }
    
    

    
}
