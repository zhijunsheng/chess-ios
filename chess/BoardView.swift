import UIKit

class BoardView: UIView {
    
    var boardOriginX: CGFloat = 0
    var boardOriginY: CGFloat = 0
    var cellSide: CGFloat = 80
    var xc = 12234
    var yr = 43221
    var chessDelegate: ChessDelegate? = nil
    var piecesBoxShadow = Set<ChessPiece>()
    var fingerX: CGFloat = 1234567890
    var fingerY: CGFloat = 1234567890
    var movingPiece: ChessPiece?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        cellSide = bounds.width / 8
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        print(touchLocation.x)
        // x
        xc = Int(touchLocation.x / cellSide)
        
        // y
        yr = Int(touchLocation.y / cellSide)
        
        movingPiece = chessDelegate?.getMovingPiece(x: xc, y: yr)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        fingerX = touchLocation.x
        fingerY = touchLocation.y
        
        setNeedsDisplay()
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        cellSide = bounds.width / 8
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        print(touchLocation.x)
        // x
        let xx: Int = Int(touchLocation.x / cellSide)
        
        // y
        let yy: Int = Int(touchLocation.y / cellSide)
        print("(from: \(xc), \(yr)), (to: \(xx), \(yy))")
        
        chessDelegate?.movePiece(frX: xc, frY: yr, toX: xx, toY: yy)
        
        movingPiece = nil
        
    }
    
    override func draw(_ rect: CGRect) {
        cellSide = bounds.width / 8

        boardOriginX = (bounds.width - 8 * cellSide) / 2
        boardOriginY = (bounds.height - 8 * cellSide) / 2
        
        drawChessBoard()
        drawPieces()
        
        if movingPiece != nil {
            let movingPieceImage = UIImage(named: movingPiece!.imageName)
            movingPieceImage?.draw(in: CGRect(x: fingerX - cellSide / 2, y: fingerY - cellSide / 2, width: cellSide, height: cellSide))
        }
    }
    
    func drawPieces() {
        for piece in piecesBoxShadow {
            drawPiece(string: piece.imageName, x: piece.x, y: piece.y)
            
            if movingPiece == piece {
                continue
            }
        }
    }
    
    func drawPiece(string: String, x: Int, y: Int) {
        let image = UIImage(named: string)
        image?.draw(in: CGRect(x: boardOriginX + CGFloat(x) * cellSide, y: boardOriginY + CGFloat(y) * cellSide, width: cellSide, height: cellSide))
    }
    
    func drawChessBoard() {
        drawColumn(idx: 0)
        drawColumn(idx: 1)
        drawColumn(idx: 2)
        drawColumn(idx: 3)
        drawColumn(idx: 4)
        drawColumn(idx: 5)
        drawColumn(idx: 6)
        drawColumn(idx: 7)
        
    }
    
    func drawColumn(idx: Int) {
        for i in 0..<8 {
            let color : UIColor
            if (i + idx) % 2 == 1 {
                color = .red
            } else {
                color = .green
            }
            
            drawSquare(x: boardOriginX + CGFloat(idx) * cellSide, y: boardOriginY + CGFloat(i) * cellSide, color: color)
        }
    }
    
    func drawSquare(x: CGFloat, y: CGFloat, color: UIColor) {
        let j10 = UIBezierPath()
        j10.move(to: CGPoint(x: x, y: y))
        j10.addLine(to: CGPoint(x: x + cellSide, y: y))
        j10.addLine(to: CGPoint(x: x + cellSide, y: y + cellSide))
        j10.addLine(to: CGPoint(x: x, y: y + cellSide))
        j10.close()
        
        color.setFill()
        j10.fill()
    }
}























