import UIKit

class BoardView: UIView {
    let cellside101: CGFloat = 0
    
    var originX: CGFloat = 0.0
    var originY: CGFloat = 100.0
    var cellSide: CGFloat = 0.0
    
    override func draw(_ rect: CGRect) {
        cellSide = (bounds.width * 0.90) / 8
        originX = (bounds.width - cellSide * 8) / 2
        
        drawBoard()
        drawPieces()

    }
    
    func drawPieces()  { 
        drawPiece(col: 1, row: 7, imageName: "knight_chess_w")
        drawPiece(col: 2, row: 0, imageName: "bishop_chess_b")
    }

    
    func drawPiece(col:Int,  row:Int, imageName: String)  {
        let image = UIImage(named: imageName)
        image?.draw(in: CGRect(x: originX + CGFloat(col) * cellSide, y: originY, width: cellSide, height: cellSide))
    }
    
    func drawBoard()  {
        for d in 0..<4 {
            drawSquare(locationX: originX + cellSide , locationY: originY + cellSide * 2 * CGFloat(d), colourLiteral: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            drawSquare(locationX: originX +  cellSide * 3 , locationY: originY + cellSide * 2 * CGFloat(d), colourLiteral: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            drawSquare(locationX: originX +  cellSide * 5 , locationY: originY + cellSide * 2 * CGFloat(d), colourLiteral: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            drawSquare(locationX: originX +  cellSide * 7 , locationY: originY + cellSide * 2 * CGFloat(d), colourLiteral: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
        
        for p in 0..<4 {
            drawSquare(locationX: originX   , locationY: originY + cellSide * CGFloat(p * 2 + 1), colourLiteral: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            drawSquare(locationX: originX +  cellSide * 2 , locationY: originY + cellSide * CGFloat(p * 2 + 1), colourLiteral: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            drawSquare(locationX: originX +  cellSide * 4 , locationY: originY + cellSide * CGFloat(p * 2 + 1), colourLiteral: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
            drawSquare(locationX: originX +  cellSide * 6 , locationY: originY + cellSide * CGFloat(p * 2 + 1), colourLiteral: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        }
        
        for n in 0..<4 {
            drawSquare(locationX: originX + cellSide * CGFloat(n * 2 + 1), locationY: originY + cellSide * 1, colourLiteral: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
            drawSquare(locationX: originX + cellSide * CGFloat(n * 2 + 1), locationY: originY + cellSide * 3, colourLiteral: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
            drawSquare(locationX: originX + cellSide * CGFloat(n * 2 + 1), locationY: originY + cellSide * 5, colourLiteral: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
            drawSquare(locationX: originX + cellSide * CGFloat(n * 2 + 1), locationY: originY + cellSide * 7, colourLiteral: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
        }
        
        for q in 0..<4 {
            drawSquare(locationX: originX + cellSide * 2 * CGFloat(q) , locationY: originY , colourLiteral: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
            drawSquare(locationX: originX + cellSide * 2 * CGFloat(q) , locationY: originY + cellSide * 2, colourLiteral: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
            drawSquare(locationX: originX + cellSide * 2 * CGFloat(q), locationY: originY + cellSide * 4, colourLiteral: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
            drawSquare(locationX: originX + cellSide * 2 * CGFloat(q) , locationY: originY + cellSide * 6, colourLiteral: #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1))
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

