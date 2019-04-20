import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boardView: BoardView = view as! BoardView
        
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

        let kingChessBRect = CGRect(x: boardView.originX + 3 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
        let kingChessBImgV = UIImageView(frame: kingChessBRect)
        kingChessBImgV.image = UIImage(named: "king_chess_b")
        view.addSubview(kingChessBImgV)
        
        let kingChessWRect = CGRect(x: boardView.originX + 3 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
        let kingChessWImgV = UIImageView(frame: kingChessWRect)
        kingChessWImgV.image = UIImage(named: "king_chess_w")
        view.addSubview(kingChessWImgV)
        
        let knightChessB = UIImage(named: "knight_chess_b")
        for i in 0..<2 {
            let rect = CGRect(x: boardView.originX + (1 + 5 * CGFloat(i)) * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
            let imgV = UIImageView(frame: rect)
            imgV.image = knightChessB
            view.addSubview(imgV)
        }
        
        let knightChessW = UIImage(named: "knight_chess_w")
        for i in 0..<2 {
            let rect = CGRect(x: boardView.originX + (1 + 5 * CGFloat(i)) * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
            let imgV = UIImageView(frame: rect)
            imgV.image = knightChessW
            view.addSubview(imgV)
        }
        
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
        
        let queenChessBRect = CGRect(x: boardView.originX + 4 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
        let queenChessBImgV = UIImageView(frame: queenChessBRect)
        queenChessBImgV.image = UIImage(named: "queen_chess_b")
        view.addSubview(queenChessBImgV)
        
        let queenChessWRect = CGRect(x: boardView.originX + 4 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
        let queenChessWImgV = UIImageView(frame: queenChessWRect)
        queenChessWImgV.image = UIImage(named: "queen_chess_w")
        view.addSubview(queenChessWImgV)
        
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
    }
}
