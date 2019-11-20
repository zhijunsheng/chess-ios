import UIKit

class BoardView: UIView {
    
    var originX: CGFloat = 0.0
    var originY: CGFloat = 0.0
    var cellSide: CGFloat = 0
    var fingerX: CGFloat = 34
    var fingerY: CGFloat = 354
    
    
    var fromCol : Int = 0
    var fromRow : Int = 0
    
    var copyCatBox: Set<ChessPiece> = Set<ChessPiece>()
    
    
    override func draw(_ rect: CGRect) {
        copyCatBox.insert(ChessPiece(rank: "rook", isWhite: true, col: 0, row: 7, imageName: "rook_chess_w"))
        copyCatBox.insert(ChessPiece(rank: "horse", isWhite: true, col: 1, row: 7, imageName: "knight_chess_w"))
        
        copyCatBox.insert(ChessPiece(rank: "bishop", isWhite: true, col: 2, row: 7, imageName: "bishop_chess_w"))
        
        copyCatBox.insert(ChessPiece(rank: "queen", isWhite: true, col: 3, row: 7, imageName: "queen_chess_w"))
        copyCatBox.insert(ChessPiece(rank: "king", isWhite: true, col: 4, row: 7, imageName: "king_chess_w"))
        
        copyCatBox.insert(ChessPiece(rank: "bishop", isWhite: true, col: 5, row: 7, imageName: "bishop_chess_w"))
        
        copyCatBox.insert(ChessPiece(rank: "horse", isWhite: true, col: 6, row: 7, imageName: "knight_chess_w"))
        
        copyCatBox.insert(ChessPiece(rank: "rook", isWhite: true, col: 7, row: 7, imageName: "rook_chess_w"))
        // black
        copyCatBox.insert(ChessPiece(rank: "rook", isWhite: false, col: 0, row: 0, imageName: "rook_chess_b"))
        
        copyCatBox.insert(ChessPiece(rank: "horse", isWhite: false, col: 1, row: 0, imageName: "knight_chess_b"))
        
        copyCatBox.insert(ChessPiece(rank: "bishop", isWhite: false, col: 2, row: 0, imageName: "bishop_chess_b"))
        
        copyCatBox.insert(ChessPiece(rank: "queen", isWhite: false, col: 3, row: 0, imageName: "queen_chess_b"))
        
        copyCatBox.insert(ChessPiece(rank: "king", isWhite: false, col: 4, row: 0, imageName: "king_chess_b"))
        
        copyCatBox.insert(ChessPiece(rank: "bishop", isWhite: false, col: 5, row: 0, imageName: "bishop_chess_b"))
        
        copyCatBox.insert(ChessPiece(rank: "horse", isWhite: false, col: 6, row: 0, imageName: "knight_chess_b"))
        
        copyCatBox.insert(ChessPiece(rank: "queen", isWhite: false, col: 7, row: 0, imageName: "rook_chess_b"))
        // Pawns
        for q in 0...7 {
            copyCatBox.insert(ChessPiece(rank: "pawn", isWhite: false, col: 0 + q, row: 1, imageName: "pawn_chess_b"))
        }
        for w in 0...7 {
            copyCatBox.insert(ChessPiece(rank: "pawn", isWhite: true, col: 0 + w, row: 6, imageName: "pawn_chess_w"))
        }


       
      
        cellSide = bounds.width / 8
        print(bounds.width)
        drawBoard()
        drawPieces()
        
        let image = UIImage(named: "queen_chess_b")
        image?.draw(in: CGRect(x: fingerX - cellSide / 2, y: fingerY - cellSide / 2  , width: cellSide, height: cellSide))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        fromCol = Int(fingerLocation.x / cellSide)
        fromRow = Int(fingerLocation.y / cellSide)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        print(" (\(fingerLocation.x), \(fingerLocation.y))")
        fingerX = fingerLocation.x
        fingerY = fingerLocation.y
        setNeedsDisplay()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let fingerLocation = touch.location(in: self)
        let row : Int = Int(fingerLocation.y / cellSide)
        let col : Int = Int(fingerLocation.x / cellSide)
        print("to: (\(col), \(row)) from: (\(fromCol), \(fromRow))")
    }
    
    func drawPieces()  {
        for element in copyCatBox {
            drawPiece(col: element.col, row: element.row, imageName: element.imageName)
        }
    }
    
    func drawPiece(col:Int,  row:Int, imageName: String)  {
        let image = UIImage(named: imageName)
        image?.draw(in: CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
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
