import UIKit

class ViewController: UIViewController, ChessDelegate {
    @IBOutlet weak var promoteToQueenButton: UIButton!
    @IBOutlet weak var promoteToRookButton: UIButton!
    @IBOutlet weak var promoteToKnightButton: UIButton!
    @IBOutlet weak var promoteToBishopButton: UIButton!
    
    @IBOutlet weak var boardView: BoardView!
    
    var chessBrain = ChessBrain()
    
    func movePiece(frX: Int, frY: Int, toX: Int, toY: Int) {
        print("🌩chess🌩")
        chessBrain.movePiece(frX: frX, frY: frY, toX: toX, toY: toY)
        boardView.piecesBoxShadow = chessBrain.piecesBox
        boardView.setNeedsDisplay()
    }
    
    func boardDeploy() {
        // botton [1]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessBrain.reset()
        boardView.piecesBoxShadow = chessBrain.piecesBox
        boardView.setNeedsDisplay()
        
        boardView.chessDelegate = self
        
    }
}
