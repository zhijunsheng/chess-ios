import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boardView: BoardView = view as! BoardView
    
        // i => a + b * i
        // i => 2 + 3 * i
        // 0 => 2
        // 1 => 5
        
        // i => a + b * i, a = 0, b = 7
        // i => 0 + 7 * i
        // 0 => 0
        // 1 => 7
        let bishopChessB = UIImage(named: "bishop_chess_b")
        for i in 0..<2 {
            let rect = CGRect(x: boardView.originX + (2 + 3 * CGFloat(i)) * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
            let imgV = UIImageView(frame: rect)
            imgV.image = bishopChessB
            view.addSubview(imgV)
        }
        
        let bishopChessW = UIImage(named: "bishop_chess_w")
        for i in 0..<2 {
            let rect = CGRect(x: boardView.originX + (2 + 3 * CGFloat(i)) * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
            let imgV = UIImageView(frame: rect)
            imgV.image = bishopChessW
            view.addSubview(imgV)
        }

        let rect3 = CGRect(x: boardView.originX + 3 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
        let imgV3 = UIImageView(frame: rect3)
        imgV3.image = UIImage(named: "king_chess_b")
        
        let rect4 = CGRect(x: boardView.originX + 3 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
        let imgV4 = UIImageView(frame: rect4)
        imgV4.image = UIImage(named: "king_chess_w")
        
        let knightChessB = UIImage(named: "knight_chess_b")
        for i in 0..<2 {
            let rect = CGRect(x: boardView.originX + (1 + 5 * CGFloat(i)) * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
            let imgV = UIImageView(frame: rect)
            imgV.image = knightChessB
            view.addSubview(imgV)
        }
        
        let knightChessW = UIImage(named: "knight_chess_w")
        for i in 0..<2 {
            let rect5 = CGRect(x: boardView.originX + (1 + 5 * CGFloat(i)) * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
            let imgV5 = UIImageView(frame: rect5)
            imgV5.image = knightChessW
            view.addSubview(imgV5)
        
        // black pawns
        
        let pawnChessB = UIImage(named: "pawn_chess_b")
        for i in 0..<8 {
            let rect = CGRect(x: boardView.originX + CGFloat(i) * boardView.cellSide, y: boardView.originY + 1 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
            let imgV = UIImageView(frame: rect)
            imgV.image = pawnChessB
            view.addSubview(imgV)
        }
        
        let pawnChessW = UIImage(named: "pawn_chess_w")
        for i in 0..<8 {
            let rect = CGRect(x: boardView.originX + CGFloat(i) * boardView.cellSide, y: boardView.originY + 6 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
            let imgV = UIImageView(frame: rect)
            imgV.image = pawnChessW
            view.addSubview(imgV)
        }
        
        let rect27 = CGRect(x: boardView.originX + 4 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
        let imgV27 = UIImageView(frame: rect27)
        imgV27.image = UIImage(named: "queen_chess_b")
        
        let rect28 = CGRect(x: boardView.originX + 4 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
        let imgV28 = UIImageView(frame: rect28)
        imgV28.image = UIImage(named: "queen_chess_w")
        
        let rookChessB = UIImage(named: "rook_chess_b")
        for i in 0..<2 {
            let rect = CGRect(x: boardView.originX + CGFloat(i) * 7 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
            let imgV = UIImageView(frame: rect)
            imgV.image = rookChessB
            view.addSubview(imgV)
        }
        
        let rookChessW = UIImage(named: "rook_chess_w")
        for i in 0..<2 {
            let rect = CGRect(x: boardView.originX + CGFloat(i) * 7 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
            let imgV = UIImageView(frame: rect)
            imgV.image = rookChessW
            view.addSubview(imgV)
        }
        view.addSubview(imgV3)
        view.addSubview(imgV4)
        view.addSubview(imgV27)
        view.addSubview(imgV28)
    }
}
}
