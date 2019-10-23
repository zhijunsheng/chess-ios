import UIKit

class ViewController: UIViewController, ChessDelegate {
    
    
    @IBOutlet weak var boardView: BoardView!
    
    var chessBrain = ChessBrain()
    
    func movePiece(frX: Int, frY: Int, toX: Int, toY: Int) {
        print("🌩chess🌩")
        chessBrain.movePiece(frX: frX, frY: frY, toX: toX, toY: toY)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessBrain.reset()
        boardView.piecesBoxShadow = chessBrain.piecesBox
        boardView.chessDelegate = self
        
    }
}
