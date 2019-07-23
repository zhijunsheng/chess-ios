import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boardView: BoardView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<2 {
            let rookWhiteImageView = UIImageView(frame: CGRect(x: CGFloat(i) * 7 * boardView.side + boardView.originX, y: boardView.originY, width: boardView.side, height: boardView.side))
            let rookWhiteImage = UIImage(named: "Rook-white")
            rookWhiteImageView.image = rookWhiteImage
            boardView.addSubview(rookWhiteImageView)
        }
        for i in 0..<2 {
            let rookBlackImageView = UIImageView(frame: CGRect(x: CGFloat(i) * 7 * boardView.side + boardView.originX, y: boardView.side *  7 + boardView.originY, width: boardView.side, height: boardView.side))
            let rookBlackImage = UIImage(named: "Rook-black")
            rookBlackImageView.image = rookBlackImage
            boardView.addSubview(rookBlackImageView)
        }
        
        
        for i in 0..<2 {
            let bishopWhiteImageView = UIImageView(frame: CGRect(x:  (CGFloat(i) * 3 + 2) * boardView.side + boardView.originX, y: boardView.originY, width: boardView.side, height: boardView.side))
            let bishopWhiteImage = UIImage(named: "Bishop-white")
            bishopWhiteImageView.image = bishopWhiteImage
            boardView.addSubview(bishopWhiteImageView)
        }
        
        let queenBlackImageView = UIImageView(frame: CGRect(x: boardView.side * 4 + boardView.originX, y: boardView.side * 7 + boardView.originY, width: boardView.side, height: boardView.side))
        let queenBlackImage = UIImage(named: "Queen-black")
        queenBlackImageView.image = queenBlackImage
        boardView.addSubview(queenBlackImageView)
        
        for i in 0..<2 {
            let bishopBlackImageView = UIImageView(frame: CGRect(x: boardView.side * (CGFloat(i) * 3 + 2) + boardView.originX, y: boardView.side * 7 + boardView.originY, width: boardView.side, height: boardView.side))
            let bishopBlackImage = UIImage(named: "Bishop-black")
            bishopBlackImageView.image = bishopBlackImage
            boardView.addSubview(bishopBlackImageView)
        }
        let pawnBlackImage = UIImage(named: "Pawn-black")
        for i in 0...7 {
            let pawnBlackImageView = UIImageView(frame: CGRect(x: boardView.side * CGFloat(i) + boardView.originX, y: boardView.side * 6 + boardView.originY, width: boardView.side, height: boardView.side))
            pawnBlackImageView.image = pawnBlackImage
            boardView.addSubview(pawnBlackImageView)
        }
        
        let pawnWhiteImage = UIImage(named: "Pawn-white")
        for i in 0...7 {
            let pawnWhiteImageView = UIImageView(frame: CGRect(x: boardView.side * CGFloat(i) + boardView.originX, y: boardView.side * 1 + boardView.originY, width: boardView.side, height: boardView.side))
            pawnWhiteImageView.image = pawnWhiteImage
            boardView.addSubview(pawnWhiteImageView)
            
        }
        
        let queenWhiteImageView = UIImageView(frame: CGRect(x: boardView.side * 4 + boardView.originX, y: boardView.side * 0 + boardView.originY, width: boardView.side, height: boardView.side))
        let queenWhiteImage = UIImage(named: "Queen-white")
        queenWhiteImageView.image = queenWhiteImage
        boardView.addSubview(queenWhiteImageView)
        
        let kingWhiteImageView = UIImageView(frame: CGRect(x: boardView.side * 3 + boardView.originX, y: boardView.side * 0 + boardView.originY, width: boardView.side, height: boardView.side))
        let kingWhiteImage = UIImage(named: "King-white")
        kingWhiteImageView.image = kingWhiteImage
        boardView.addSubview(kingWhiteImageView)
        
        let kingBlackImageView = UIImageView(frame: CGRect(x: boardView.side * 3 + boardView.originX, y: boardView.side * 7 + boardView.originY, width: boardView.side, height: boardView.side))
        let kingBlackImage = UIImage(named: "King-black")
        kingBlackImageView.image = kingBlackImage
        boardView.addSubview(kingBlackImageView)
        
        for i in 0..<2 {
            let knightWhiteImageView = UIImageView(frame: CGRect(x: boardView.side * (1 + CGFloat(i) * 5) + boardView.originX, y: boardView.side * 0 + boardView.originY, width: boardView.side, height: boardView.side))
            let knightWhiteImage = UIImage(named: "Knight-white")
            knightWhiteImageView.image = knightWhiteImage
            boardView.addSubview(knightWhiteImageView)
        }
        for i in 0..<2 {
            let knightBlackImageView = UIImageView(frame: CGRect(x: boardView.side * (1 + CGFloat(i) * 5) + boardView.originX, y: boardView.side * 7 + boardView.originY, width: boardView.side, height: boardView.side))
            let knightBlackImage = UIImage(named: "Knight-black")
            knightBlackImageView.image = knightBlackImage
            boardView.addSubview(knightBlackImageView)
        }
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        print(". . .")
        print(sender.location(in: boardView))
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

