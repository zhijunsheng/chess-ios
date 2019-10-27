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
        let bottonGap: CGFloat = 20
        let buttonLong: CGFloat = 176
        
        
        promoteToQueenButton.frame.origin.x = bottonGap + 0 * buttonLong
        promoteToQueenButton.frame.origin.y = view.frame.height - bottonGap - promoteToQueenButton.bounds.height
        
        promoteToKnightButton.frame.origin.x = bottonGap + 1 * buttonLong
        promoteToKnightButton.frame.origin.y = view.frame.height - bottonGap - promoteToKnightButton.bounds.height
        
        promoteToBishopButton.frame.origin.x = bottonGap + 3 * buttonLong
        promoteToBishopButton.frame.origin.y = view.frame.height - bottonGap - promoteToBishopButton.bounds.height
        
        promoteToRookButton.frame.origin.x = bottonGap + 2 * buttonLong
        promoteToRookButton.frame.origin.y = view.frame.height - bottonGap - promoteToRookButton.bounds.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessBrain.reset()
        boardView.piecesBoxShadow = chessBrain.piecesBox
        boardView.setNeedsDisplay()
        
        boardView.chessDelegate = self
        
        boardDeploy()
    }
}
