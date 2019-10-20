import UIKit

class BoardView: UIView {
    
    var boardOriginX: CGFloat = 0
    var boardOriginY: CGFloat = 0
    var cellSide: CGFloat = 80
    var xc = 12234
    var yr = 43221
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        cellSide = bounds.width / 8
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        print(touchLocation.x)
        // x
        xc = Int(touchLocation.x / cellSide)
        
        //y
        yr = Int(touchLocation.y / cellSide)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        cellSide = bounds.width / 8
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        print(touchLocation.x)
        // x
        let xx: Int = Int(touchLocation.x / cellSide)
        
        // y
        let yy: Int = Int(touchLocation.y / cellSide)
        print("(from: \(xc), \(yr)), (to: \(xx), \(yy))")
    }
    
    override func draw(_ rect: CGRect) {
        cellSide = bounds.width / 8
        print(cellSide)

        //
        boardOriginX = (bounds.width - 8 * cellSide) / 2
        boardOriginY = (bounds.height - 8 * cellSide) / 2
        
        drawChessBoard()
        whitePieceRoom()
        blackPieceRoom()
    }
    
    func drawPiece(string: String, x: Int, y: Int) {
        let image = UIImage(named: string)
        image?.draw(in: CGRect(x: boardOriginX + CGFloat(x) * cellSide, y: boardOriginY + CGFloat(y) * cellSide, width: cellSide, height: cellSide))
    }
    
    func whitePieceRoom() {
        drawPiece(string: "Rook-white", x: 0, y: 0)
        drawPiece(string: "Rook-white", x: 7, y: 0)
        
        drawPiece(string: "Knight-white", x: 1, y: 0)
        drawPiece(string: "Knight-white", x: 6, y: 0)

        drawPiece(string: "Bishop-white", x: 2, y: 0)
        drawPiece(string: "Bishop-white", x: 5, y: 0)

        drawPiece(string: "Queen-white", x: 4, y: 0)
        
        drawPiece(string: "King-white", x: 3, y: 0)
        
        // white pawn corner
        drawPiece(string: "Pawn-white", x: 0, y: 1)
        drawPiece(string: "Pawn-white", x: 1, y: 1)
        drawPiece(string: "Pawn-white", x: 2, y: 1)
        drawPiece(string: "Pawn-white", x: 3, y: 1)
        drawPiece(string: "Pawn-white", x: 4, y: 1)
        drawPiece(string: "Pawn-white", x: 5, y: 1)
        drawPiece(string: "Pawn-white", x: 6, y: 1)
        drawPiece(string: "Pawn-white", x: 7, y: 1)
    }
    
    func blackPieceRoom() {
        drawPiece(string: "Rook-black", x: 0, y: 7)
        drawPiece(string: "Rook-black", x: 7, y: 7)
        
        drawPiece(string: "Knight-black", x: 1, y: 7)
        drawPiece(string: "Knight-black", x: 6, y: 7)

        drawPiece(string: "Bishop-black", x: 2, y: 7)
        drawPiece(string: "Bishop-black", x: 5, y: 7)

        drawPiece(string: "Queen-black", x: 4, y: 7)
        
        drawPiece(string: "King-black", x: 3, y: 7)
        
        // white pawn corner
        drawPiece(string: "Pawn-black", x: 0, y: 6)
        drawPiece(string: "Pawn-black", x: 1, y: 6)
        drawPiece(string: "Pawn-black", x: 2, y: 6)
        drawPiece(string: "Pawn-black", x: 3, y: 6)
        drawPiece(string: "Pawn-black", x: 4, y: 6)
        drawPiece(string: "Pawn-black", x: 5, y: 6)
        drawPiece(string: "Pawn-black", x: 6, y: 6)
        drawPiece(string: "Pawn-black", x: 7, y: 6)
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























