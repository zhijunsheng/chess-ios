import UIKit

class BoardView: UIView {

    var originX: CGFloat = 123_456_789_123_456_789.0
    var originY: CGFloat = 173_738_383_838_839_498.0
    var cellSide: CGFloat = 80.0
    
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
                drawSquare(col: i * 2 + 1, row: j * 2, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
                drawSquare(col: i * 2, row: j * 2 + 1, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
            }
        }
        
        drawPiece(col: 3, row: 7, imageName: "king_chess_b")
        drawPiece(col: 3, row: 0, imageName: "king_chess_w")
        drawPiece(col: 4, row: 7, imageName: "queen_chess_b")
        drawPiece(col: 4, row: 0, imageName: "queen_chess_w")

        for i in 0..<2 {
            drawPiece(col: 7 * i, row: 0, imageName: "rook_chess_w")
            drawPiece(col: 1 + 5 * i, row: 0, imageName: "knight_chess_w")
            drawPiece(col: 2 + 3 * i, row: 0, imageName: "bishop_chess_w")
            
            drawPiece(col: 7 * i, row: 7, imageName: "rook_chess_b")
            drawPiece(col: 1 + 5 * i, row: 7, imageName: "knight_chess_b")
            drawPiece(col: 2 + 3 * i, row: 7, imageName: "bishop_chess_b")
        }
        
        for i in 0..<8 {
            drawPiece(col: i, row: 6, imageName: "pawn_chess_b")
            drawPiece(col: i, row: 1, imageName: "pawn_chess_w")
        }
    }
    
    func drawPiece(col: Int, row: Int, imageName: String) {
        let king_chess_bImg = UIImage(named: imageName)
        king_chess_bImg?.draw(in: CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
    }
    
    func drawSquare(col: Int, row: Int, color: UIColor) {
        let  pen = UIBezierPath(rect: CGRect(x:  CGFloat(col) * cellSide, y: CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        color.setFill()
        pen.fill()
    }
    
}
