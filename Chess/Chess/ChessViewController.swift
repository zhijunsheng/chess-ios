//
//  ViewController.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-06-03.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import UIKit
import AVFoundation

class ChessViewController: UIViewController {
    let nearbyService = NearbyService(serviceType: "gt-chess")
    
    let whoseTurnColor: UIColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)

    var chessEngine: ChessEngine = ChessEngine()
    
    @IBOutlet weak var boardView: BoardView!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var lowerView: UIView!
    
    var audioPlayer: AVAudioPlayer!
    
    private var isWhiteDevice = true
    private var firstMoveFinished = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "drop", withExtension: "wav")!
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        
        boardView.chessDelegate = self
        
        lowerView.backgroundColor = whoseTurnColor
        
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        nearbyService.nearbyServiceDelegate = self
    }
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
        boardView.blackAtTop = true
        boardView.sharingDevice = false
        isWhiteDevice = true
        updateWhoseTurnColors()
        boardView.setNeedsDisplay()
    }
    
    @IBAction func togglePieceImages(_ sender: UIBarButtonItem) {
        boardView.sharingDevice.toggle()
        boardView.setNeedsDisplay()
    }
    
    func updateMove(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        guard chessEngine.isHandicap(move: Move(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)) || chessEngine.isValid(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow, isWhite: chessEngine.whitesTurn) else {
            return
        }
        chessEngine.movePiece(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
        
        audioPlayer.play()
        
        updateWhoseTurnColors()
    }
    
    func updateWhoseTurnColors() {
        upperView.backgroundColor = .white
        lowerView.backgroundColor = .white
        var whoseTurnView: UIView
        if isWhiteDevice {
            whoseTurnView = chessEngine.whitesTurn ? lowerView : upperView
        } else {
            whoseTurnView = chessEngine.whitesTurn ? upperView : lowerView
        }
        whoseTurnView.backgroundColor = whoseTurnColor
    }
    
    func send(move: Move, targetRank: Character? = nil) {
        var promotionPostfix = ""
        if let targetRank = targetRank {
            promotionPostfix = ":\(targetRank)"
        }
        let move = "\(move.fromCol):\(move.fromRow):\(move.toCol):\(move.toRow)\(promotionPostfix)"
        nearbyService.send(msg: move)
        firstMoveFinished = true
    }
    
    private func promptPromotionOptions(with move: Move) {
        if chessEngine.needsPromotion() {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let queenAction = UIAlertAction(title: "Queen", style: .default) { _ in
                self.alertActionOf(move: move, rank: .queen, targetRank: "q")
            }
            alertController.addAction(queenAction)
            
            let knightAction = UIAlertAction(title: "Knight", style: .default) { _ in
                self.alertActionOf(move: move, rank: .knight, targetRank: "n")
            }
            alertController.addAction(knightAction)
            
            let rookAction = UIAlertAction(title: "Rook", style: .default) { _ in
                self.alertActionOf(move: move, rank: .rook, targetRank: "r")
            }
            alertController.addAction(rookAction)
            
            let bishopAction = UIAlertAction(title: "Bishop", style: .default) { _ in
                self.alertActionOf(move: move, rank: .bishop, targetRank: "b")
            }
            alertController.addAction(bishopAction)
            
            if let popoverPresentationController = alertController.popoverPresentationController {
                popoverPresentationController.permittedArrowDirections = .init(rawValue: 0)
                popoverPresentationController.sourceView = self.view
                popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            }
            present(alertController, animated: true, completion: nil)
        }
    }
    
    private func alertActionOf(move: Move, rank: ChessRank, targetRank: Character) {
        send(move: move, targetRank: targetRank)
        chessEngine.promoteTo(rank: rank)
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
    }
}

extension ChessViewController: ChessDelegate {
    func play(with move: Move) {
        let isWithdrawing = chessEngine.isWithdrawing(move.fromCol, move.fromRow, move.toCol, move.toRow)
        guard let movingPiece = chessEngine.pieceAt(col: move.fromCol, row: move.fromRow),
              isWithdrawing || movingPiece.isWhite == chessEngine.whitesTurn else {
            return
        }

//        if let session = session, session.connectedPeers.count > 0 && !isWithdrawing && isWhiteDevice != chessEngine.whitesTurn {
//            return
//        }
        
        updateMove(fromCol: move.fromCol, fromRow: move.fromRow, toCol: move.toCol, toRow: move.toRow)
        
        if chessEngine.needsPromotion() {
            promptPromotionOptions(with: move)
        } else {
            send(move: move)
        }
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        return chessEngine.pieceAt(col: col, row: row)
    }
}

extension ChessViewController: NearbyServiceDelegate {
    func connectedWith(peer: String) {
        let alertController = UIAlertController(title: "Connected with \(peer)", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        if let popoverPresentationController = alertController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .init(rawValue: 0)
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
        present(alertController, animated: true, completion: nil)
    }
    
    func didReceive(msg: String) {
        let moveArr = msg.components(separatedBy: ":")
        if let fromCol = Int(moveArr[0]), let fromRow = Int(moveArr[1]), let toCol = Int(moveArr[2]), let toRow = Int(moveArr[3]) {
            DispatchQueue.main.async {
                if !self.firstMoveFinished {
                    self.firstMoveFinished = true
                    self.boardView.blackAtTop = false
                    self.isWhiteDevice = false
                    self.upperView.backgroundColor = self.whoseTurnColor
                    self.lowerView.backgroundColor = .white
                    self.boardView.setNeedsDisplay()
                }
                
                let move = Move(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
                self.boardView.animate(move: move) { _ in
                    self.updateMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
                    if moveArr.count == 5 {
                        switch moveArr[4] {
                        case "q":
                            self.chessEngine.promoteTo(rank: .queen)
                        case "n":
                            self.chessEngine.promoteTo(rank: .knight)
                        case "r":
                            self.chessEngine.promoteTo(rank: .rook)
                        case "b":
                            self.chessEngine.promoteTo(rank: .bishop)
                        default:
                            break
                        }
                        self.boardView.shadowPieces = self.chessEngine.pieces
                        self.boardView.setNeedsDisplay()
                    }
                }
            }
        }
    }
}
