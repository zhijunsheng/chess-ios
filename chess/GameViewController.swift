import UIKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boardView: BoardView = view as! BoardView
    
        
        let rect = CGRect(x: boardView.originX + 2 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: 30)
        let imgV = UIImageView(frame: rect)
        imgV.image = UIImage(named: "bishop_chess_b")
        
        view.addSubview(imgV)
        
        let rect2 = CGRect(x: boardView.originX + 2 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV2 = UIImageView(frame: rect2)
        imgV2.image = UIImage(named: "bishop_chess_w")
        
        let rect3 = CGRect(x: boardView.originX + 3 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: 30)
        let imgV3 = UIImageView(frame: rect3)
        imgV3.image = UIImage(named: "king_chess_b")
        
        let rect4 = CGRect(x: boardView.originX + 3 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV4 = UIImageView(frame: rect4)
        imgV4.image = UIImage(named: "king_chess_w")
        
        let rect5 = CGRect(x: boardView.originX + 1 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: 30)
        let imgV5 = UIImageView(frame: rect5)
        imgV5.image = UIImage(named: "knight_chess_b")
        
        let rect6 = CGRect(x: boardView.originX + 1 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV6 = UIImageView(frame: rect6)
        imgV6.image = UIImage(named: "knight_chess_w")
        
        let rect7 = CGRect(x: boardView.originX, y: boardView.originY + 1 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV7 = UIImageView(frame: rect7)
        imgV7.image = UIImage(named: "pawn_chess_b")
        
        let rect8 = CGRect(x: boardView.originX + 1 * boardView.cellSide, y: boardView.originY + 1 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV8 = UIImageView(frame: rect8)
        imgV8.image = UIImage(named: "pawn_chess_b")
        
        let rect9 = CGRect(x: boardView.originX + 2 * boardView.cellSide, y: boardView.originY + 1 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV9 = UIImageView(frame: rect9)
        imgV9.image = UIImage(named: "pawn_chess_b")
        
        let rect10 = CGRect(x: boardView.originX + 3 * boardView.cellSide, y: boardView.originY + 1 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV10 = UIImageView(frame: rect10)
        imgV10.image = UIImage(named: "pawn_chess_b")
        
        let rect11 = CGRect(x: boardView.originX + 4 * boardView.cellSide, y: boardView.originY + 1 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV11 = UIImageView(frame: rect11)
        imgV11.image = UIImage(named: "pawn_chess_b")
        
        let rect12 = CGRect(x: boardView.originX + 5 * boardView.cellSide, y: boardView.originY + 1 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV12 = UIImageView(frame: rect12)
        imgV12.image = UIImage(named: "pawn_chess_b")
        
        let rect13 = CGRect(x: boardView.originX + 6 * boardView.cellSide, y: boardView.originY + 1 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV13 = UIImageView(frame: rect13)
        imgV13.image = UIImage(named: "pawn_chess_b")
        
        let rect14 = CGRect(x: boardView.originX + 7 * boardView.cellSide, y: boardView.originY + 1 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV14 = UIImageView(frame: rect14)
        imgV14.image = UIImage(named: "pawn_chess_b")
        
        let rect15 = CGRect(x: boardView.originX, y: boardView.originY + 6 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV15 = UIImageView(frame: rect15)
        imgV15.image = UIImage(named: "pawn_chess_w")
        
        let rect16 = CGRect(x: boardView.originX + 1 * boardView.cellSide, y: boardView.originY + 6 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV16 = UIImageView(frame: rect16)
        imgV16.image = UIImage(named: "pawn_chess_w")
        
        let rect17 = CGRect(x: boardView.originX + 2 * boardView.cellSide, y: boardView.originY + 6 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV17 = UIImageView(frame: rect17)
        imgV17.image = UIImage(named: "pawn_chess_w")
        
        let rect18 = CGRect(x: boardView.originX + 3 * boardView.cellSide, y: boardView.originY + 6 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV18 = UIImageView(frame: rect18)
        imgV18.image = UIImage(named: "pawn_chess_w")
        
        let rect19 = CGRect(x: boardView.originX + 4 * boardView.cellSide, y: boardView.originY + 6 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV19 = UIImageView(frame: rect19)
        imgV19.image = UIImage(named: "pawn_chess_w")
        
        let rect20 = CGRect(x: boardView.originX + 5 * boardView.cellSide, y: boardView.originY + 6 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV20 = UIImageView(frame: rect20)
        imgV20.image = UIImage(named: "pawn_chess_w")
        
        let rect21 = CGRect(x: boardView.originX + 6 * boardView.cellSide, y: boardView.originY + 6 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV21 = UIImageView(frame: rect21)
        imgV21.image = UIImage(named: "pawn_chess_w")
        
        let rect22 = CGRect(x: boardView.originX + 7 * boardView.cellSide, y: boardView.originY + 6 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV22 = UIImageView(frame: rect22)
        imgV22.image = UIImage(named: "pawn_chess_w")
        
        let rect23 = CGRect(x: boardView.originX + 5 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: 30)
        let imgV23 = UIImageView(frame: rect23)
        imgV23.image = UIImage(named: "bishop_chess_b")
        
        let rect24 = CGRect(x: boardView.originX + 5 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV24 = UIImageView(frame: rect24)
        imgV24.image = UIImage(named: "bishop_chess_w")
        
        let rect25 = CGRect(x: boardView.originX + 6 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: 30)
        let imgV25 = UIImageView(frame: rect25)
        imgV25.image = UIImage(named: "knight_chess_b")
        
        let rect26 = CGRect(x: boardView.originX + 6 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV26 = UIImageView(frame: rect26)
        imgV26.image = UIImage(named: "knight_chess_w")
        
        let rect27 = CGRect(x: boardView.originX + 4 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: 30)
        let imgV27 = UIImageView(frame: rect27)
        imgV27.image = UIImage(named: "queen_chess_b")
        
        let rect28 = CGRect(x: boardView.originX + 4 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV28 = UIImageView(frame: rect28)
        imgV28.image = UIImage(named: "queen_chess_w")
        
        let rect29 = CGRect(x: boardView.originX, y: boardView.originY, width: boardView.cellSide, height: 30)
        let imgV29 = UIImageView(frame: rect29)
        imgV29.image = UIImage(named: "rook_chess_b")
        
        let rect30 = CGRect(x: boardView.originX + 7 * boardView.cellSide, y: boardView.originY, width: boardView.cellSide, height: 30)
        let imgV30 = UIImageView(frame: rect30)
        imgV30.image = UIImage(named: "rook_chess_b")
        
        let rect31 = CGRect(x: boardView.originX, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV31 = UIImageView(frame: rect31)
        imgV31.image = UIImage(named: "rook_chess_w")
        
        let rect32 = CGRect(x: boardView.originX + 7 * boardView.cellSide, y: boardView.originY + 7 * boardView.cellSide, width: boardView.cellSide, height: 30)
        let imgV32 = UIImageView(frame: rect32)
        imgV32.image = UIImage(named: "rook_chess_w")
        
        view.addSubview(imgV)
        view.addSubview(imgV2)
        view.addSubview(imgV3)
        view.addSubview(imgV4)
        view.addSubview(imgV5)
        view.addSubview(imgV6)
        view.addSubview(imgV7)
        view.addSubview(imgV8)
        view.addSubview(imgV9)
        view.addSubview(imgV10)
        view.addSubview(imgV11)
        view.addSubview(imgV12)
        view.addSubview(imgV13)
        view.addSubview(imgV14)
        view.addSubview(imgV15)
        view.addSubview(imgV16)
        view.addSubview(imgV17)
        view.addSubview(imgV18)
        view.addSubview(imgV19)
        view.addSubview(imgV20)
        view.addSubview(imgV21)
        view.addSubview(imgV22)
        view.addSubview(imgV23)
        view.addSubview(imgV24)
        view.addSubview(imgV25)
        view.addSubview(imgV26)
        view.addSubview(imgV27)
        view.addSubview(imgV28)
        view.addSubview(imgV29)
        view.addSubview(imgV30)
        view.addSubview(imgV31)
        view.addSubview(imgV32)
    }
}
