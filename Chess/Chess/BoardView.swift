//
//  BoardView.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-06-03.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {
    static let kingWhite = "King-white"
    static let queenWhite = "Queen-white"
    static let bishopWhite = "Bishop-white"
    static let knightWhite = "Knight-white"
    static let rookWhite = "Rook-white"
    static let pawnWhite = "Pawn-white"
    static let kingBlack = "King-black"
    static let queenBlack = "Queen-black"
    static let bishopBlack = "Bishop-black"
    static let knightBlack = "Knight-black"
    static let rookBlack = "Rook-black"
    static let pawnBlack = "Pawn-black"
    
    // for cropping each piece image out of 6x2 big image
    private let tupleByName: [String: (Int, Int)] = [
        kingWhite : (0, 0),
        queenWhite : (1, 0),
        bishopWhite : (2, 0),
        knightWhite : (3, 0),
        rookWhite : (4, 0),
        pawnWhite : (5, 0),
        kingBlack : (0, 1),
        queenBlack : (1, 1),
        bishopBlack : (2, 1),
        knightBlack : (3, 1),
        rookBlack : (4, 1),
        pawnBlack : (5, 1),
    ]
    
    private let boardRatio: CGFloat = 1.0
    private var pieceRatio: CGFloat = 1.0
    private var movingPieceRatio: CGFloat = 1.3
    var originX: CGFloat = -10
    var originY: CGFloat = -10
    var cellSide: CGFloat = -10
    
    var shadowPieces: Set<ChessPiece> = Set<ChessPiece>()
    var chessDelegate: ChessDelegate? = nil
    
    var fromCol: Int? = nil
    var fromRow: Int? = nil
    
    var movingImage: UIImage? = nil
    var movingPieceX: CGFloat = -1
    var movingPieceY: CGFloat = -1
    
    var blackAtTop = true
    
    var imageByName: [String: UIImage] = [:]
    var sharingDevice = false {
        didSet {
            imageByName.removeAll()
        }
    }

    override func draw(_ rect: CGRect) {
        if UIDevice.current.userInterfaceIdiom == .phone {
            pieceRatio = 1.1
            movingPieceRatio = 2.0
        } else {
            pieceRatio = 0.9
            movingPieceRatio = 1.2
        }
        
        cellSide = bounds.width * boardRatio / 8
        originX = bounds.width * (1 - boardRatio) / 2
        originY = bounds.height * (1 - boardRatio) / 2
        
        drawBoard()
        drawPieces()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        fromCol = p2p(Int((fingerLocation.x - originX) / cellSide))
        fromRow = p2p(Int((fingerLocation.y - originY) / cellSide))
        
        if let fromCol = fromCol, let fromRow = fromRow, let movingPiece = chessDelegate?.pieceAt(col: fromCol, row: fromRow) {
            movingImage = image(named: movingPiece.imageName)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        movingPieceX = fingerLocation.x
        movingPieceY = fingerLocation.y
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let first = touches.first!
        let fingerLocation = first.location(in: self)
        
        let toCol: Int = p2p(Int((fingerLocation.x - originX) / cellSide))
        let toRow: Int = p2p(Int((fingerLocation.y - originY) / cellSide))
        
        if let fromCol = fromCol, let fromRow = fromRow, fromCol != toCol || fromRow != toRow {
            chessDelegate?.play(with: Move(fC: fromCol, fR: fromRow, tC: toCol, tR: toRow))
        }
        movingImage = nil
        fromCol = nil
        fromRow = nil
        setNeedsDisplay()
    }
    
    @available(iOS 10.0, *)
    func animate(move: Move, _ completion: @escaping (UIViewAnimatingPosition) -> Void) {
        guard let chessEngine = chessDelegate, let piece = chessEngine.pieceAt(col: move.fC, row: move.fR) else {
            return
        }
        let pieceImageView = UIImageView(image: image(named: piece.imageName))
        addSubview(pieceImageView)
        let normalBeginningFrame = CGRect(x: originX + CGFloat(p2p(piece.col)) * cellSide, y: originY + CGFloat(p2p(piece.row)) * cellSide, width: cellSide, height: cellSide)
        pieceImageView.frame = imageRect(normalRect: normalBeginningFrame, ratio: pieceRatio)
        let moveAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            let normalEnddingFrame = CGRect(x: self.originX + CGFloat(self.p2p(move.tC)) * self.cellSide, y: self.originY + CGFloat(self.p2p(move.tR)) * self.cellSide, width: self.cellSide, height: self.cellSide)
            pieceImageView.frame = self.imageRect(normalRect: normalEnddingFrame, ratio: self.movingPieceRatio)
        }
        moveAnimator.addCompletion { animPos in
            pieceImageView.removeFromSuperview()
            completion(animPos)
        }
        moveAnimator.startAnimation()
    }
    
    private func drawPieces() {
        for piece in shadowPieces where fromCol != piece.col || fromRow != piece.row {
            let normalRect = CGRect(x: originX + CGFloat(p2p(piece.col)) * cellSide, y: originY + CGFloat(p2p(piece.row)) * cellSide, width: cellSide, height: cellSide)
            let imgRect = imageRect(normalRect: normalRect, ratio: pieceRatio)
            image(named: piece.imageName)?.draw(in: imgRect)
        }
        
        if let movingImage = movingImage {
            drawCrosshair(x: movingPieceX, y: movingPieceY)
            movingImage.draw(in: imageRect(center: CGPoint(x: movingPieceX, y: movingPieceY), normalSize: CGSize(width: cellSide, height: cellSide), ratio: movingPieceRatio))
        }
    }
    
    private func drawCrosshair(x: CGFloat, y: CGFloat) {
        #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).setStroke()
        let radius = 1.5 * cellSide
        let circle = UIBezierPath(arcCenter: CGPoint(x: x, y: y), radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        circle.lineWidth = 3
        circle.stroke()
        
        let cross = UIBezierPath()
        let half = 1.3 * radius
        cross.move(to: CGPoint(x: x - half, y: y))
        cross.addLine(to: CGPoint(x: x + half, y: y))
        cross.move(to: CGPoint(x: x, y: y - half))
        cross.addLine(to: CGPoint(x: x, y: y + half))
        cross.lineWidth = 3
        cross.stroke()
    }
    
    private func imageRect(normalRect: CGRect, ratio: CGFloat) -> CGRect {
        let center = CGPoint(x: normalRect.midX, y: normalRect.midY)
        let normalSize = CGSize(width: normalRect.width, height: normalRect.height)
        return imageRect(center: center, normalSize: normalSize, ratio: ratio)
    }
    
    private func imageRect(center: CGPoint, normalSize: CGSize, ratio: CGFloat) -> CGRect {
        let w = ratio * normalSize.width
        let h = ratio * normalSize.height
        return CGRect(x: center.x - w/2, y: center.y - h/2, width: w, height: h)
    }
    
    private func drawBoard() {
        for row in 0..<4 {
            for col in 0..<4 {
                drawSquare(col: col * 2, row: row * 2, color: UIColor.white)
                drawSquare(col: 1 + col * 2, row: row * 2, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
                drawSquare(col: col * 2, row: 1 + row * 2, color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
                drawSquare(col: 1 + col * 2, row: 1 + row * 2, color: UIColor.white)
            }
        }
        UIBezierPath(rect: CGRect(x: -10, y: 0, width: bounds.width + 20, height: bounds.height)).stroke()
    }
    
    private func drawSquare(col: Int, row: Int, color: UIColor) {
        let path = UIBezierPath(rect: CGRect(x: originX + CGFloat(col) * cellSide, y: originY + CGFloat(row) * cellSide, width: cellSide, height: cellSide))
        color.setFill()
        path.fill()
    }
    
    private func p2p(_ coordinate: Int) -> Int { // p2p: peer 2 peer
        return blackAtTop ? coordinate : 7 - coordinate
    }
    
    private func image(named name: String) -> UIImage? {
        if let stored = imageByName[name] {
            return stored
        }
        
        var img: UIImage?
        if sharingDevice || UIDevice.current.userInterfaceIdiom == .phone {
            img = flatPieceImage(pieceName: name, blackFlipped: sharingDevice)
        } else {
            img = UIImage(named: name)
            
        }
        imageByName[name] = img
        return img
    }
    
    private func flatPieceImage(pieceName: String, blackFlipped: Bool) -> UIImage? {
        guard let twelvePieces = UIImage(named: "twelve_pieces"), let tuple = tupleByName[pieceName] else {
            return nil
        }
        
        let col = tuple.0
        let row = tuple.1
        let side: CGFloat = 333
        UIGraphicsBeginImageContext(CGSize(width: side, height: side))
        twelvePieces.draw(in: CGRect(x: CGFloat(-col) * side, y: CGFloat(-row) * side, width: 6 * side, height: 2 * side))
        var img = UIGraphicsGetImageFromCurrentImageContext()
        if row == 1, let actualImg = img, let cgImg = actualImg.cgImage {
            img = UIImage(cgImage: cgImg, scale: 1.0, orientation: blackFlipped ? .down : .up)
        }
        UIGraphicsEndImageContext()
        return img
    }
}
