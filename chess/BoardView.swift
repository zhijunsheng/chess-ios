import UIKit

class BoardView: UIView {
    let cellSide: CGFloat = 30
    let originX: CGFloat = 40
    var originY: CGFloat = 50
    
    override func draw(_ rect: CGRect) {
        for c in 0 ..< 8 {
            for i in 0 ..< 8 {
                var color: UIColor
                if (c + i) % 2 == 0 {
                    color = .white
                } else {
                    color = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                }
                drawSquare(x:  CGFloat(i) * cellSide + originX, y: originY + CGFloat(c) * cellSide, colour: color)
            }
        }
        
        //        for c in 0 ..< 4 {
        //            for i in 0 ..< 8 {
        //                var color: UIColor
        //                if i % 2 == 0 {
        //                    color = .white
        //                } else {
        //                    color = .black
        //                }
        //                drawSquare(x:  CGFloat(i) * cellSide + originX, y: originY + CGFloat(c) * 2 * cellSide, colour: color)
        //            }
        //
        //            for i in 0 ..< 8 {
        //                var color: UIColor
        //                if i % 2 == 0 {
        //                    color = .black
        //                } else {
        //                    color = .white
        //                }
        //                drawSquare(x:  CGFloat(i) * cellSide + originX, y: cellSide + originY + CGFloat(c) * 2 * cellSide, colour: color)
        //            }
        //        }
        
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

