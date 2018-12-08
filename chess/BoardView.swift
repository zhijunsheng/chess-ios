
import UIKit

class BoardView: UIView {

    let originX: CGFloat = 30
    let originY: CGFloat = 150
    let cellSide: CGFloat = 30
    
    override func draw(_ rect: CGRect) {
        let  feather = UIBezierPath()
        
        // row 1, gray
        
        feather.move(to: CGPoint(x: originX, y: originY))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + cellSide))
        feather.addLine(to: CGPoint(x: originX, y: originY + cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 2 * cellSide, y: originY))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + cellSide))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 4 * cellSide, y: originY))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 6 * cellSide, y: originY))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + cellSide))
        feather.close()
        
        // row 2, gray
        
        feather.move(to: CGPoint(x: originX + cellSide, y: originY))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + 2 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 3 * cellSide, y: originY + cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 2 * cellSide))
        feather.close()

        feather.move(to: CGPoint(x: originX + 5 * cellSide, y: originY + cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 2 * cellSide))
        feather.close()

        feather.move(to: CGPoint(x: originX + 7 * cellSide, y: originY + cellSide))
        feather.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + cellSide))
        feather.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 2 * cellSide))
        feather.close()
        
        // row 3, gray
        
        feather.move(to: CGPoint(x: originX, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX, y: originY + 3 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 2 * cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 3 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 4 * cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 3 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 6 * cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 2 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 3 * cellSide))
        feather.close()
        
        // row 4, gray
        
        feather.move(to: CGPoint(x: originX + cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + 4 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 3 * cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 4 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 5 * cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 4 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 7 * cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 3 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 4 * cellSide))
        feather.close()
        
        // row 5, gray
        
        feather.move(to: CGPoint(x: originX, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX, y: originY + cellSide + 4 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 2 * cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 5 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 4 * cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 5 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 6 * cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 4 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 5 * cellSide))
        feather.close()
        
        // row 6, gray
        
        feather.move(to: CGPoint(x: originX + cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + 6 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 3 * cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 6 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 5 * cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 6 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 7 * cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 5 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 8 * cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 6 * cellSide))
        feather.close()
        
        // row 7, gray
        
        feather.move(to: CGPoint(x: originX, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX, y: originY + cellSide + 6 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 2 * cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 3 * cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 2 * cellSide, y: originY + 7 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 4 * cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 5 * cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 4 * cellSide, y: originY + 7 * cellSide))
        feather.close()
        
        feather.move(to: CGPoint(x: originX + 6 * cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 6 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 7 * cellSide, y: originY + 7 * cellSide))
        feather.addLine(to: CGPoint(x: originX + 6 * cellSide, y: originY + 7 * cellSide))
        feather.close()
        
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

        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
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

        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        pen.fill()
        
//        drawSquare(col: 7, row: 0, color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
//        drawSquare(col: 0, row: 1, color: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1))
//
//    }
//
//    func drawSquare(col: Int, row: Int, color: UIColor) {
//        let pen = UIBezierPath()

//        color.setFill()
        pen.fill()
    }
}

/*
 
 pwd
 ls -l
 
 
 
 
 
 */
