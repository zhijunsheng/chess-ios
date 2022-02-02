import UIKit

class BoardView: UIView {
    
    var boardOriginX: CGFloat = 0
    var boardOriginY: CGFloat = 0
    var cellSide: CGFloat = 80
    var xc = 12234
    var yr = 43221
    var chessDelegate: ChessDelegate? = nil
    var fingerX: CGFloat = 1234567890
    var fingerY: CGFloat = 1234567890
    var movingPiece: ChessPiece?
    var isWhiteDevice: Bool = false
    var vcm = 0
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        cellSide = bounds.width / 8
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        xc = Int(touchLocation.x / cellSide)
        yr = Int(touchLocation.y / cellSide)
        
        movingPiece = chessDelegate?.getMovingPiece(x: xc, y: yr)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        fingerX = touchLocation.x
        fingerY = touchLocation.y

        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        cellSide = bounds.width / 8
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let xx: Int = Int(touchLocation.x / cellSide)
        let yy: Int = Int(touchLocation.y / cellSide)
        chessDelegate?.movePiece(frX: xc, frY: yr, toX: xx, toY: yy)
        
        movingPiece = nil
        if vcm == 1 {
            let img = UIImage(named: "check")
            img!.draw(in: CGRect(x: 3 * cellSide, y: 3 * cellSide, width: 2 * cellSide, height: 2 * cellSide))
            setNeedsDisplay()
        }
        
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        cellSide = bounds.width / 8

        boardOriginX = (bounds.width - 8 * cellSide) / 2
        boardOriginY = (bounds.height - 8 * cellSide) / 2
        
        drawChessBoard()
        drawPieces(isWhiteAdvertise: isWhiteDevice)
        
        if movingPiece != nil {
            
            if !isWhiteDevice {
                movingPiece!.isWhite.toggle()
                let string = movingPiece!.imageName
                let arr = string.split(separator: "-")
                switch arr[1] {
                case "white":
                    movingPiece!.imageName = "\(getRank(piece: movingPiece!))-black"
                case "black":
                    movingPiece!.imageName = "\(getRank(piece: movingPiece!))-white"
                default:
                    break
                }
            }
            
            let movingPieceImage = UIImage(named: movingPiece!.imageName)
            movingPieceImage?.draw(in: CGRect(x: fingerX - cellSide / 2, y: fingerY - cellSide / 2, width: cellSide, height: cellSide))
            movingPiece!.isWhite.toggle()
        }
    }
    
    func getRank(piece: ChessPiece) -> ChessRank {
        return piece.rank
    }
    
    func newCR(new: Int) -> Int {
        return 7 - new
    }
    func drawPieces(isWhiteAdvertise: Bool) {
        var imgnam: String = ""
        var image: UIImage
        
        for col in 0..<8 {
            for row in 0..<8 {
                var c = col
                var r = row
                if !isWhiteDevice {
                    c = newCR(new: c)
                    r = newCR(new: r)
                }
                if !isWhiteAdvertise {
                    if let piece = chessDelegate?.pieceAt(x: c, y: r) {
                        switch piece.rank {
                        case .rook:
                            imgnam = piece.isWhite ? "Rook-black" : "Rook-white"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        case .knight:
                            imgnam = piece.isWhite ? "Knight-black" : "Knight-white"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        case .bishop:
                            imgnam = piece.isWhite ? "Bishop-black" : "Bishop-white"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        case .king:
                            imgnam = piece.isWhite ? "King-black" : "King-white"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        case .pawn:
                            imgnam = piece.isWhite ? "Pawn-black" : "Pawn-white"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        case .queen:
                            imgnam = piece.isWhite ? "Queen-black" : "Queen-white"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        }
                    }
                } else {
                    if let piece = chessDelegate?.pieceAt(x: c, y: r) {
                        switch piece.rank {
                        case .rook:
                            imgnam = piece.isWhite ? "Rook-white" : "Rook-black"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        case .knight:
                            imgnam = piece.isWhite ? "Knight-white" : "Knight-black"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        case .bishop:
                            imgnam = piece.isWhite ? "Bishop-white" : "Bishop-black"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        case .king:
                            imgnam = piece.isWhite ? "King-white" : "King-black"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        case .pawn:
                            imgnam = piece.isWhite ? "Pawn-white" : "Pawn-black"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        case .queen:
                            imgnam = piece.isWhite ? "Queen-white" : "Queen-black"
                            image = UIImage(named: imgnam)!
                            image.draw(in: CGRect(x: CGFloat(c) * cellSide, y: CGFloat(r) * cellSide, width: cellSide, height: cellSide))
                        }
                    }
                }
            }
        }
    }
    
    func drawPiece(string: String, x: Int, y: Int) {
        let image = UIImage(named: string)
        image?.draw(in: CGRect(x: boardOriginX + CGFloat(x) * cellSide, y: boardOriginY + CGFloat(y) * cellSide, width: cellSide, height: cellSide))
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
    
    func drawColumn(idx: Int) {
        for i in 0..<8 {
            let color : UIColor
            if (i + idx) % 2 == 1 {
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
