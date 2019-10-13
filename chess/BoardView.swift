import UIKit

class BoardView: UIView {
    
    var boardOriginX: CGFloat = 33
    var boardOriginY: CGFloat = 38
    let cellSide: CGFloat = 80
    
    override func draw(_ rect: CGRect) {
        boardOriginX = (bounds.width - 8 * cellSide) / 2
        boardOriginY = (bounds.height - 8 * cellSide) / 2
        
        drawChessBoard()
        

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
    
    func drawColumn(idx:Int) {
        for i in 0..<8 {
            let color : UIColor
            if (i + idx) % 2 == 0 {
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























