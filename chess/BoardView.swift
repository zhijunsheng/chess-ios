import UIKit

class BoardView: UIView {
    let boardWidthPercent: CGFloat = 0.9
    var cellSide: CGFloat = 30
    var originX: CGFloat = 40
    var originY: CGFloat = 50
    var chessPieces: Set<ChessPiece> = Set<ChessPiece>()
    var fingerX: CGFloat = -2
    var fingerY: CGFloat = -1
    
    var fromCol: Int = -1
    var fromRow: Int = -2
    
    var chessDelegate: ChessDelegate?
    
    var movingPiece: ChessPiece? = nil
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchBeganLocation = touch.location(in: self)
        
        fromCol = Int((touchBeganLocation.x - originX) / cellSide)
        fromRow = Int((touchBeganLocation.y - originY) / cellSide)
    
        movingPiece = chessDelegate?.pieceAt(col: fromCol, row: fromRow)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchEndedLocation = touch.location(in: self)
        
        let toCol: Int = Int((touchEndedLocation.x - originX) / cellSide)
        let toRow: Int = Int((touchEndedLocation.y - originY) / cellSide)
        
        chessDelegate?.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        movingPiece = nil
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        fingerX = touchLocation.x
        fingerY = touchLocation.y
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        cellSide = bounds.width * boardWidthPercent / 8
        originX = bounds.width * (1 - boardWidthPercent) / 2
        originY = (bounds.height - bounds.width * boardWidthPercent) / 2
        
        drawBoard()
        drawPieces()
        
        if let movingPiece = movingPiece {
            let image = UIImage(named: movingPiece.imgName)
            image?.draw(in: CGRect(x: fingerX - cellSide / 2 , y: fingerY - cellSide / 2, width: cellSide, height: cellSide))
        }
    }
    
    func drawPieces() {
        for piece in chessPieces {
            if piece != movingPiece {
                drawPiece(x: piece.col, y: piece.row, name: piece.imgName)
            }
        }
    }
    
    func drawPiece(x: Int, y: Int, name: String) {
        let image = UIImage(named: name)
        image?.draw(in: CGRect(x: originX + cellSide * CGFloat(x), y: originY + cellSide * CGFloat(y), width: cellSide, height: cellSide))
    }
    
    func drawBoard() {
        for row in 0 ..< 8 {
            for col in 0 ..< 8 {
                let color: UIColor = (row + col) % 2 == 0 ? .white : .gray
                drawSquare(x:  CGFloat(col) * cellSide + originX, y: originY + CGFloat(row) * cellSide, colour: color)
            }
        }
    }
    
    func drawSquare(x: CGFloat, y: CGFloat, colour: UIColor) {
        let pen = UIBezierPath()
        pen.move(to: CGPoint(x: x, y: y))
        pen.addLine(to: CGPoint(x: x, y: cellSide + y))
        pen.addLine(to: CGPoint(x: cellSide + x, y: cellSide + y))
        pen.addLine(to: CGPoint(x: cellSide + x, y: y))
        
        pen.close()
        colour.setFill()
        pen.fill()
    }
}
