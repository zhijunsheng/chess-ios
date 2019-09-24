import UIKit

class BoardView: UIView {
    let originX         : CGFloat = 0
    let originY         : CGFloat = 0
    let side            : CGFloat = 91.5
    
    var fC : Int = 53
    var fR : Int = 89
    
    
    override func draw(_ rect: CGRect) {
    
        drawSquares()
        drawFrame()
        
      
    }
//    + side / 2
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        fC = Int(first.location(in: self).x / side)
        fR = Int(first.location(in: self).y / side)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let tC : Int = Int(first.location(in: self).x / side)
        let tR : Int = Int(first.location(in: self).y / side)
        print("FROM: (\(fC), \(fR)), TO: (\(tC), \(tR))")
        
        
    }
    
    func drawSquares() {
        for i in 0...3 {
            drawQuadrilateral(x: originX, y: originY + side * CGFloat(i) * 2)
        }
        for i in 0...3 {
            drawQuadrilateral(x: side + originX, y: side + originY + side * CGFloat(i) * 2)
        }
        for i in 0...3 {
            drawQuadrilateral(x: side * 2 + originX, y: originY + side * CGFloat(i) * 2)
        }
        for i in 0...3 {
            drawQuadrilateral(x: side * 3 + originX, y: side + originY + side * CGFloat(i) * 2)
        }
        for i in 0...3 {
            drawQuadrilateral(x: side * 4 + originX, y: originY + side * CGFloat(i) * 2)
        }
        for i in 0...3 {
            drawQuadrilateral(x: side * 5 + originX, y: side + originY + side * CGFloat(i) * 2)
        }
        for i in 0...3 {
            drawQuadrilateral(x: side * 6 + originX, y: originY + side * CGFloat(i) * 2)
        }
        for i in 0...3 {
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
        #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1).setFill()
        a1.fill()
    }
    
    
    
}
