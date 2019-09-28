import UIKit

class BoardView: UIView {
    // boardWidthPercent
    let boardWidthPercent: CGFloat = 0.9
    var cellSide: CGFloat = 30
    var originX: CGFloat = 40
    var originY: CGFloat = 50
    var chessPieces: Set<ChessPiece> = Set<ChessPiece>()
    
    
    
    // x - 0.25x =
    override func draw(_ rect: CGRect) {
        cellSide = bounds.width * boardWidthPercent / 8
        originX = bounds.width * (1 - boardWidthPercent) / 2
        originY = (bounds.height - bounds.width * boardWidthPercent) / 2
        
        drawBoard()
        drawPieces()
        
    }
    
    func drawPieces() {
        chessPieces.insert(ChessPiece(rank: .rook, col: 3, row: 1, isWhite: true, imgName: "rook_chess_w"))
        chessPieces.insert(ChessPiece(rank: .rook, col: 4, row: 1, isWhite: false, imgName: "rook_chess_b"))
        for piece in chessPieces {
            
            drawPiece(x: piece.col, y: piece.row, name: piece.imgName)
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

