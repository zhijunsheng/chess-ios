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
        
        guard let movingPiece = chessBrain.pieceAt(x: frX, y: frY) else {
            return
        }
        
        chessBrain.movePiece(frX: frX, frY: frY, toX: toX, toY: toY)
        boardView.piecesBoxShadow = chessBrain.piecesBox
        boardView.setNeedsDisplay()
        
        if movingPiece.rank == .pawn {
            if movingPiece.isWhite {
                if movingPiece.y == 7 {
                    togglePromotionButtons(show: true)
                    boardView.isUserInteractionEnabled = false
                }
                
            } else if movingPiece.isWhite == false {
               if movingPiece.y == 0 {
                    togglePromotionButtons(show: true)
                    boardView.isUserInteractionEnabled = false
                }
            }
        }
    }

    func getMovingPiece(x: Int, y: Int) -> ChessPiece? {
        return chessBrain.pieceAt(x: x, y: y)
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
    
    @IBAction func queenPressed(_ sender: UIButton) {
        print("q u e e n")
    }
    
    @IBAction func rookPressed(_ sender: UIButton) {
        print("r o o k")
    }
    
    @IBAction func knightPressed(_ sender: UIButton) {
        print("k n i g h t")
    }
    
    @IBAction func bishopPressed(_ sender: UIButton) {
        print("b i s h o p")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessBrain.reset()
        
        boardView.piecesBoxShadow = chessBrain.piecesBox
        boardView.setNeedsDisplay()
        boardView.chessDelegate = self
        
        boardDeploy()
        
        togglePromotionButtons(show: false)
    }
    
    func togglePromotionButtons(show: Bool) {
        promoteToKnightButton.isHidden = !show
        promoteToQueenButton.isHidden = !show
        promoteToRookButton.isHidden = !show
        promoteToBishopButton.isHidden = !show
    }
}
