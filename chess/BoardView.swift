
import UIKit

class BoardView: UIView {

    var originX: CGFloat = 123_456_789_123_456_789.0
    var originY: CGFloat = 173_738_383_838_839_498.0
    let cellSide: CGFloat = 80.0
    
    override func draw(_ rect: CGRect) {
        
        originX = (bounds.width - cellSide * 8) / 2
        originY = (bounds.height - cellSide * 8) / 2
        
        let  feather = UIBezierPath()
        
        // row 1, gray
        
        for i in 0..<4 {
            feather.move(to: CGPoint(x: originX + CGFloat(i * 2) * cellSide, y: originY))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2) * cellSide, y: originY + cellSide))
            feather.close()
        }
        
        // row 2, gray
    
        for i in 0..<4 {
            feather.move(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 2) * cellSide, y: originY))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 2) * cellSide, y: originY + 2 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 2 * cellSide))
            feather.close()
        }
        
        // row 3, gray
        
        for i in 0..<4 {
            feather.move(to: CGPoint(x: originX + CGFloat(i * 2) * cellSide, y: originY + 2 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 2 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 3 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2) * cellSide, y: originY + 3 * cellSide))
            feather.close()
        }
        
        // row 4, gray
        
        for i in 0..<4 {
            feather.move(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 3 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 2) * cellSide, y: originY + 3 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 2) * cellSide, y: originY + 4 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 4 * cellSide))
            feather.close()
        }
        
        // row 5, gray
        
        for i in 0..<4 {
            feather.move(to: CGPoint(x: originX + CGFloat(i * 2) * cellSide, y: originY + 4 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 4 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 5 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2) * cellSide, y: originY + 5 * cellSide))
            feather.close()
        }
        
        // row 6, gray
        
        for i in 0..<4 {
            feather.move(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 5 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 2) * cellSide, y: originY + 5 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 2) * cellSide, y: originY + 6 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 6 * cellSide))
            feather.close()
        }
        
        // row 7, gray
        
        for i in 0..<4 {
            feather.move(to: CGPoint(x: originX + CGFloat(i * 2) * cellSide, y: originY + 6 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 6 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2 + 1) * cellSide, y: originY + 7 * cellSide))
            feather.addLine(to: CGPoint(x: originX + CGFloat(i * 2) * cellSide, y: originY + 7 * cellSide))
            feather.close()
        }
        
        // row 8, gray
        
        feather.move(to: CGPoint(x: originX + cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 8 * cellSide))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + 8 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 3 * cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 8 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 8 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 5 * cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 8 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 8 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 7 * cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 8 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 8 * cellSide))
        feather.close()

        #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).setFill()
        feather.fill()
        
        let pen = UIBezierPath()
        
        // row 1, black
        
        pen.move(to: CGPoint(x: originX + cellSide, y: originY))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 3 * cellSide, y: originY))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 5 * cellSide, y: originY))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 7 * cellSide, y: originY))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + cellSide))
        pen.close()
        
        // row 2, black
        
        pen.move(to: CGPoint(x: originX, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX, y: originY + 2 * cellSide))
        pen.close()
            
        pen.move(to: CGPoint(x: originX + 2 * cellSide, y: originY + cellSide ))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 2 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 4 * cellSide, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + cellSide + cellSide))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + cellSide + cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 6 * cellSide, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 2 * cellSide))
        pen.close()
        
        // row 3, black
        
        pen.move(to: CGPoint(x: originX + cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + 3 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 3 * cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 3 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 5 * cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 3 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 7 * cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 2 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 3 * cellSide))
        pen.close()
        
        // row 4, biack
        
        pen.move(to: CGPoint(x: originX, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX, y: originY + 4 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 2 * cellSide, y: originY + 3 * cellSide ))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 4 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 4 * cellSide, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 4 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 6 * cellSide, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 3 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 4 * cellSide))
        pen.close()
        
        // row 5, black
        
        pen.move(to: CGPoint(x: originX + cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + 5 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 3 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 5 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 5 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 5 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 7 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 4 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 5 * cellSide))
        pen.close()
        
        // row 6, black
        
        pen.move(to: CGPoint(x: originX, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX, y: originY + 6 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 2 * cellSide, y: originY + 5 * cellSide ))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 6 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 4 * cellSide, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 6 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 6 * cellSide, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 5 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 6 * cellSide))
        pen.close()
        
        // row 7, biack
        
        pen.move(to: CGPoint(x: originX + cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + 7 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 3 * cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 7 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 5 * cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 7 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 7 * cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 6 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 7 * cellSide))
        pen.close()
        
        // row 8, black
        
        pen.move(to: CGPoint(x: originX, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + cellSide, y: originY + 8 * cellSide))
        pen.addLine(to: CGPoint(x: originX, y: originY + 8 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 2 * cellSide, y: originY + 7 * cellSide ))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 8 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 8 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 4 * cellSide, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 8 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 8 * cellSide))
        pen.close()
        
        pen.move(to: CGPoint(x: originX + 6 * cellSide, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 7 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 8 * cellSide))
        pen.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 8 * cellSide))
        pen.close()

        #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1).setFill()
        pen.fill()
        
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
}
