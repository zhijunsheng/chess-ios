import UIKit

class BoardView: UIView {
    let cellside101: CGFloat = 0
    
    var originXForBoard: CGFloat = 0.0
    var originYForFirstSquare: CGFloat = 0.0
    var cellSide: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        
        cellSide = (bounds.width * 0.90) / 8
        originXForBoard = (bounds.width - cellSide * 8) / 2
        originYForFirstSquare = (bounds.height - cellSide * 8) / 2
        
        for i in 0...3 {
             drawSquare(locationX: originXForBoard + cellSide * CGFloat(i) * 2 , locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
            
             drawSquare(locationX: originXForBoard + cellSide * (1 + CGFloat(i) * 2), locationY: originYForFirstSquare, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
            
             drawSquare(locationX: originXForBoard + cellSide * ( 1 + CGFloat(i) * 2) , locationY: originYForFirstSquare + cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
            
            drawSquare(locationX: originXForBoard + cellSide * CGFloat(i) * 2, locationY: originYForFirstSquare + cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
            
            drawSquare(locationX: originXForBoard + cellSide * ( 1 + CGFloat(i) * 2) , locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
            
             drawSquare(locationX: originXForBoard + cellSide *  CGFloat(i) * 2 , locationY: originYForFirstSquare + 2 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
            
             drawSquare(locationX: originXForBoard + cellSide * ( 1 + CGFloat(i) * 2) , locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))

             drawSquare(locationX: originXForBoard + cellSide *  CGFloat(i) * 2 , locationY: originYForFirstSquare + 3 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))

            drawSquare(locationX: originXForBoard + cellSide * ( 1 + CGFloat(i) * 2) , locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))

             drawSquare(locationX: originXForBoard + cellSide *  CGFloat(i) * 2 , locationY: originYForFirstSquare + 4 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))

             drawSquare(locationX: originXForBoard + cellSide * ( 1 + CGFloat(i) * 2) , locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
            
               drawSquare(locationX: originXForBoard + cellSide *  CGFloat(i) * 2 , locationY: originYForFirstSquare + 5 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
            
            drawSquare(locationX: originXForBoard + cellSide * ( 1 + CGFloat(i) * 2) , locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
            
            drawSquare(locationX: originXForBoard + cellSide *  CGFloat(i) * 2 , locationY: originYForFirstSquare + 6 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
            
            drawSquare(locationX: originXForBoard + cellSide * ( 1 + CGFloat(i) * 2) , locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1))
            
             drawSquare(locationX: originXForBoard + cellSide *  CGFloat(i) * 2 , locationY: originYForFirstSquare + 7 * cellSide, colourLiteral: #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))
            
            
        }
        
    }
    
    func drawSquare(locationX: CGFloat, locationY : CGFloat, colourLiteral: UIColor) {
        let pencil = UIBezierPath()
        
        pencil.move(to: CGPoint(x: locationX, y: locationY))
        pencil.addLine(to: CGPoint(x: locationX + cellSide, y: locationY))
        pencil.addLine(to: CGPoint(x: locationX + cellSide , y: locationY + cellSide))
        pencil.addLine(to: CGPoint(x: locationX , y: locationY + cellSide))
        pencil.close()
        
        colourLiteral.setFill()
        pencil.fill()
        pencil.stroke()
    }
}
