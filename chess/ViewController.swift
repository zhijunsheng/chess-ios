import UIKit

class ViewController: UIViewController, ChessDelegate {
    var game = GameRules()
    
    
    
    @IBOutlet weak var boardView: BoardView!
    func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        game.move(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
//        boardView.
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardView.delegate = self
        
    }
    
}
