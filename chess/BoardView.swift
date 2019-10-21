import UIKit

class BoardView: UIView {

    var originX: CGFloat = 123_456_789_123_456_789.0
    var originY: CGFloat = 173_738_383_838_839_498.0
    var cellSide: CGFloat = 80.0
    /*
 
     (123, 234) x = 123, y = 234
     (col = ?, row = ?)
     
     x = 440
     col = 4
     
     
     x = 751.2
     col = 7
     
     Int(751.2 / cellSide)
 
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        print(first.location(in: self))
    }
    
    
    override func draw(_ rect: CGRect) {
        
//        originX = (bounds.width - cellSide * 8) / 2
//        originY = (bounds.height - cellSide * 8) / 2
        originX = 0
        originY = 0
        cellSide = bounds.width / 8
        print(originX)
        print(originY)
    
        for i in 0..<4 {
            for j in 0..<4 {
                drawSquare(col: i * 2, row: j * 2, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                drawSquare(col: i * 2 + 1, row: j * 2 + 1, color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                drawSquare(col: i * 2 + 1, row: j * 2, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                drawSquare(col: i * 2, row: j * 2 + 1, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            }
        }
        
        let queen_chess_bImg = UIImage(named: "queen_chess_b")
        let king_chess_bImg = UIImage(named: "king_chess_b")
        let king_chess_wImg = UIImage(named: "king_chess_w")
        let queen_chess_wImg = UIImage(named: "queen_chess_w")
        let rook_chess_wImg = UIImage(named: "rook_chess_w")
        let knight_chess_wImg = UIImage(named: "knight_chess_w")
        let bishop_chess_wImg = UIImage(named: "bishop_chess_w")
        let rook_chess_bImg = UIImage(named: "rook_chess_b")
        let knight_chess_bImg = UIImage(named: "knight_chess_b")
        let bishop_chess_bImg = UIImage(named: "bishop_chess_b")
        let pawn_chess_wImg = UIImage(named: "pawn_chess_w")
        let pawn_chess_bImg = UIImage(named: "pawn_chess_b")
        
        king_chess_wImg?.draw(in: CGRect(x: originX + 3 * cellSide, y: originY + 0 * cellSide, width: cellSide, height: cellSide))
        queen_chess_wImg?.draw(in: CGRect(x: originX + 4 * cellSide, y: originY + 0 * cellSide, width: cellSide, height: cellSide))
        king_chess_bImg?.draw(in: CGRect(x: originX + 3 * cellSide, y: originY + 7 * cellSide, width: cellSide, height: cellSide))
        queen_chess_bImg?.draw(in: CGRect(x: originX + 4 * cellSide, y: originY + 7 * cellSide, width: cellSide, height: cellSide))
        
        for i in 0..<2 {
            rook_chess_wImg?.draw(in: CGRect(x: originX + CGFloat(7 * i) * cellSide, y: originY + 0 * cellSide, width: cellSide, height: cellSide))
            knight_chess_wImg?.draw(in: CGRect(x: originX + CGFloat(1 + 5 * i) * cellSide, y: originY + 0 * cellSide, width: cellSide, height: cellSide))
            bishop_chess_wImg?.draw(in: CGRect(x: originX + CGFloat(2 + 3 * i) * cellSide, y: originY + 0 * cellSide, width: cellSide, height: cellSide))
            
            rook_chess_bImg?.draw(in: CGRect(x: originX + CGFloat(7 * i) * cellSide, y: originY + 7 * cellSide, width: cellSide, height: cellSide))
            knight_chess_bImg?.draw(in: CGRect(x: originX + CGFloat(1 + 5 * i) * cellSide, y: originY + 7 * cellSide, width: cellSide, height: cellSide))
            bishop_chess_bImg?.draw(in: CGRect(x: originX + CGFloat(2 + 3 * i) * cellSide, y: originY + 7 * cellSide, width: cellSide, height: cellSide))
        }
        
        for i in 0..<8 {
            pawn_chess_bImg?.draw(in: CGRect(x: originX + CGFloat(i) * cellSide, y: originY + 6 * cellSide, width: cellSide, height: cellSide))
            pawn_chess_wImg?.draw(in: CGRect(x: originX + CGFloat(i) * cellSide, y: originY + 1 * cellSide, width: cellSide, height: cellSide))
        }
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor) {
        let  pen = UIBezierPath(rect: CGRect(x:  CGFloat(col) * cellSide, y: CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        color.setFill()
        pen.fill()
    }
    
}

/*
 
 ABCDE * 4 = EDCBA

 A = 2
 E = 8
 
 ABCDE
 *   4
-------
 EDCBA
 
  2BCD8
  *   4
 -------
  8DCB2
 
   21978
   *   4
  -------
   87912
 
 
 */
