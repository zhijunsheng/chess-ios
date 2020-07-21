import UIKit

class BoardView: UIView {
    let originX         : CGFloat = 0
    let originY         : CGFloat = 0
    let side            : CGFloat = 91.5
    var fC              : Int = 53
    var fR              : Int = 89
    var delegate        : ChessDelegate? = nil
    var shadowPieceBox  : Set<ChessPiece> = Set<ChessPiece>()

    override func draw(_ rect: CGRect) {
    
        drawSquares()
        drawFrame()
        drawPieces()
      
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        fC = Int(first.location(in: self).x / side)
        fR = Int(first.location(in: self).y / side)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let tC : Int = Int(first.location(in: self).x / side)
        let tR : Int = Int(first.location(in: self).y / side)
        
        delegate?.move(fromCol: fC, fromRow: fR, toCol: tC, toRow: tR)

    }

    func drawPieces() {
        for piece in shadowPieceBox {
            drawPiece(col: piece.col, row: piece.row, imageName: piece.imageName)
        }
    }
    
    func drawPiece(col: Int, row: Int, imageName: String) {
        let piece = UIImage(named: "\(imageName)")
        piece?.draw(in: CGRect(x: originX + side * CGFloat(col), y: originY + side * CGFloat(row), width: side, height: side))
    }
    
    func drawSquares() {
        for i in 0...3 {
            drawQuadrilateral(x: originX, y: originY + side * CGFloat(i) * 2)
            drawQuadrilateral(x: side + originX, y: side + originY + side * CGFloat(i) * 2)
            drawQuadrilateral(x: side * 2 + originX, y: originY + side * CGFloat(i) * 2)
            drawQuadrilateral(x: side * 3 + originX, y: side + originY + side * CGFloat(i) * 2)
            drawQuadrilateral(x: side * 4 + originX, y: originY + side * CGFloat(i) * 2)
            drawQuadrilateral(x: side * 5 + originX, y: side + originY + side * CGFloat(i) * 2)
            drawQuadrilateral(x: side * 6 + originX, y: originY + side * CGFloat(i) * 2)
            drawQuadrilateral(x: side * 7 + originX, y: side + originY + side * CGFloat(i) * 2)
        }
    }
    
    func drawFrame() {
        let b2 = UIBezierPath()
        b2.move(to: CGPoint(x: originX + side * 8, y: originY))
        b2.addLine(to: CGPoint(x: originX + side * 8, y: originY + side * 8))
        b2.addLine(to: CGPoint(x: originX, y: originY + side * 8))
        b2.addLine(to: CGPoint(x: originX, y: originY))
        b2.close()
        b2.stroke()
    }
    
    func drawQuadrilateral(x: CGFloat, y: CGFloat) {
        let a1 = UIBezierPath()
        a1.move(to: CGPoint(x: x, y: y))
        a1.addLine(to: CGPoint(x: x + side, y: y))
        a1.addLine(to: CGPoint(x: x + side, y: y + side))
        a1.addLine(to: CGPoint(x: x, y: y + side))
        a1.close()
        #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).setFill()
        a1.fill()
    }
}
