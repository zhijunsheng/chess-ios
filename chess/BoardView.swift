import UIKit

class BoardView: UIView {
    // boardWidthPercent
    let boardWidthPercent: CGFloat = 0.9
    var cellSide: CGFloat = 30
    var originX: CGFloat = 40
    var originY: CGFloat = 50
    
    // x - 0.25x =
    override func draw(_ rect: CGRect) {
        cellSide = bounds.width * boardWidthPercent / 8
        originX = bounds.width * (1 - boardWidthPercent) / 2
        originY = (bounds.height - bounds.width * boardWidthPercent) / 2
        
        drawBoard()
        
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

