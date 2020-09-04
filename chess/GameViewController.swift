//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

// design pattern called MVC
// M: model
// V: view
// C: controller

class GameViewController: UIViewController, ChessDelegate {
    var chessBoard = ChessBoard()
    
    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chessBoard.reset()
        boardView.pieceBoxShadow = chessBoard.pieceBox
        boardView.chessDelegate = self
    }
    
    @IBAction func newGame(_ sender: Any) {
        chessBoard.reset()
        boardView.pieceBoxShadow = chessBoard.pieceBox
        boardView.setNeedsDisplay()
    }
    
    @IBAction func goBack(_ sender: Any) {
        chessBoard.goBack()
        boardView.pieceBoxShadow = chessBoard.pieceBox
        boardView.setNeedsDisplay()
    }

    
    
    
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        
        if chessBoard.canPieceMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
            chessBoard.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
            
            if chessBoard.isItPromotion(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow) {
                let alertController = UIAlertController(title: "Choose your piece", message: nil, preferredStyle: .actionSheet)
                
                let queenAction = UIAlertAction(title: "Queen", style: .default) { _ in
                    self.chessBoard.promote(col: toCol, row: toRow, newRank: .Queen)
                    
                    self.boardView.pieceBoxShadow = self.chessBoard.pieceBox
                    self.boardView.setNeedsDisplay()
                }
                
                let rookAction = UIAlertAction(title: "Rook", style: .default) { _ in
                    self.chessBoard.promote(col: toCol, row: toRow, newRank: .Rook)
                    
                    self.boardView.pieceBoxShadow = self.chessBoard.pieceBox
                    self.boardView.setNeedsDisplay()
                }
                
                let bishopAction = UIAlertAction(title: "Bishop", style: .default) { _ in
                    self.chessBoard.promote(col: toCol, row: toRow, newRank: .Bishop)
                    
                    self.boardView.pieceBoxShadow = self.chessBoard.pieceBox
                    self.boardView.setNeedsDisplay()
                }
                
                let knightAction = UIAlertAction(title: "Knight", style: .default) { _ in
                    self.chessBoard.promote(col: toCol, row: toRow, newRank: .Knight)
                    
                    self.boardView.pieceBoxShadow = self.chessBoard.pieceBox
                    self.boardView.setNeedsDisplay()
                }
                
                let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
                
                
                alertController.addAction(queenAction)
                alertController.addAction(rookAction)
                alertController.addAction(bishopAction)
                alertController.addAction(knightAction)
                alertController.addAction(cancelAction)
                
                
                if let presentationController = alertController.popoverPresentationController {
                    presentationController.permittedArrowDirections = .init(rawValue: 0)
                    presentationController.sourceView = view
                    presentationController.sourceRect = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: 0, height: 0)
                }
                
                present(alertController, animated: true, completion: nil)
            }
        }
        
        boardView.pieceBoxShadow = chessBoard.pieceBox
        boardView.setNeedsDisplay()
    }
    
    func pieceAt(locationX: Int, locationY: Int) -> ChessPiece? {
        return chessBoard.pieceAt(locationX: locationX, locationY: locationY)
    }
}
    
