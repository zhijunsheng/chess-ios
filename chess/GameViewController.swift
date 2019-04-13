import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boardView: BoardView = view as! BoardView
    
    
        let rect = CGRect(x: boardView.originX + 2 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
        let imgV = UIImageView(frame: rect)
        imgV.image = UIImage(named: "bishop_chess_b")
        
        view.addSubview(imgV)
        
        let rect2 = CGRect(x: boardView.originX + 2 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
        let imgV2 = UIImageView(frame: rect2)
        imgV2.image = UIImage(named: "bishop_chess_w")
        
        let rect3 = CGRect(x: boardView.originX + 3 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
        let imgV3 = UIImageView(frame: rect3)
        imgV3.image = UIImage(named: "king_chess_b")
        
        let rect4 = CGRect(x: boardView.originX + 3 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
        let imgV4 = UIImageView(frame: rect4)
        imgV4.image = UIImage(named: "king_chess_w")
        
        let rect5 = CGRect(x: boardView.originX + 1 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
        let imgV5 = UIImageView(frame: rect5)
        imgV5.image = UIImage(named: "knight_chess_b")
        
        let rect6 = CGRect(x: boardView.originX + 1 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
        let imgV6 = UIImageView(frame: rect6)
        imgV6.image = UIImage(named: "knight_chess_w")
        
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
        
        let rect23 = CGRect(x: boardView.originX + 5 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
        let imgV23 = UIImageView(frame: rect23)
        imgV23.image = UIImage(named: "bishop_chess_b")
        
        let rect24 = CGRect(x: boardView.originX + 5 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
        let imgV24 = UIImageView(frame: rect24)
        imgV24.image = UIImage(named: "bishop_chess_w")
        
        let rect25 = CGRect(x: boardView.originX + 6 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: boardView.cellSide)
        let imgV25 = UIImageView(frame: rect25)
        imgV25.image = UIImage(named: "knight_chess_b")
        
        let rect26 = CGRect(x: boardView.originX + 6 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
        let imgV26 = UIImageView(frame: rect26)
        imgV26.image = UIImage(named: "knight_chess_w")
        
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
        view.addSubview(imgV)
        view.addSubview(imgV2)
        view.addSubview(imgV3)
        view.addSubview(imgV4)
        view.addSubview(imgV5)
        view.addSubview(imgV6)
        view.addSubview(imgV23)
        view.addSubview(imgV24)
        view.addSubview(imgV25)
        view.addSubview(imgV26)
        view.addSubview(imgV27)
        view.addSubview(imgV28)
    }
}
