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
    
    let whoseTurnColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    let waitingColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    var chess: Chess = Chess()
    
    @IBOutlet weak var boardView: BoardView!
    
    @IBOutlet weak var upperPlayerView: UIView!
    @IBOutlet weak var peerLabel: UILabel!
    @IBOutlet weak var upperPlayerColorView: UIView!
    
    @IBOutlet weak var lowerPlayerView: UIView!
    @IBOutlet weak var youLabel: UILabel!
    @IBOutlet weak var lowerPlayerColorView: UIView!
    
    var audioPlayer: AVAudioPlayer!
    
    private var isolated = true
    private var isWhiteDevice = true
    private var firstMoveMade = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "drop", withExtension: "wav")!
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        
        boardView.chessDelegate = self
        nearbyService.nearbyServiceDelegate = self
        
        resetLocally()
    }
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Restart?", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .destructive) {_ in self.resetLocally() })
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        avoidAlertCrashOnPad(alertController: alertController)
        present(alertController, animated: true)
    }
    
    @IBAction func togglePieceImages(_ sender: UIBarButtonItem) {
        boardView.sharingDevice.toggle()
        boardView.setNeedsDisplay()
    }
    
    /*
     Don't move this function to model since a button could also trigger withdrawing.
     */
    private func isWithdrawing(move: Move) -> Bool {
        guard let lastMovedPiece = chess.lastMovedPiece, let movingPiece = pieceAt(col: move.fC, row: move.fR) else {
            return false
        }
        
        return movingPiece == lastMovedPiece && chess.whiteTurn != movingPiece.isWhite && pieceAt(col: move.tC, row: move.tR) == nil
    }
    
    private func resetLocally() {
        chess.initializeGame()
        boardView.shadowPieces = chess.pieces
        boardView.blackAtTop = true
        boardView.sharingDevice = false
        isWhiteDevice = true
        upperPlayerColorView.backgroundColor = .black
        lowerPlayerColorView.backgroundColor = .white
        firstMoveMade = false
        updateWhoseTurnColorsLocally(whiteTurn: chess.whiteTurn)
        boardView.isUserInteractionEnabled = true
        boardView.setNeedsDisplay()
    }
    
    private func updateWhoseTurnColorsLocally(whiteTurn: Bool) {
        var whoseTurnView: UIView
        var waiterView: UIView
        if isWhiteDevice {
            whoseTurnView = whiteTurn ? lowerPlayerView : upperPlayerView
            waiterView = whiteTurn ? upperPlayerView : lowerPlayerView
        } else {
            whoseTurnView = whiteTurn ? upperPlayerView : lowerPlayerView
            waiterView = whiteTurn ? lowerPlayerView : upperPlayerView
        }
        
        UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut) {
            whoseTurnView.backgroundColor = self.whoseTurnColor
            waiterView.backgroundColor = self.waitingColor
        }.startAnimation()
    }
    
    private func updateMoveLocally(move: Move) {
        guard chess.isHandicap(move: move) || chess.isValid(move: move, isWhite: chess.whiteTurn) else {
            return
        }
        
        chess.movePiece(move: move)
        boardView.shadowPieces = chess.pieces
        boardView.setNeedsDisplay()
        
        if !chess.isHandicap(move: move) {
            updateWhoseTurnColorsLocally(whiteTurn: chess.whiteTurn)
        }
        
        audioPlayer.play()
    }
    
    private func sendMoveToPeers(move: Move, targetRank: Character? = nil) {
        var promotionPostfix = ""
        if let targetRank = targetRank {
            promotionPostfix = ":\(targetRank)"
        }
        let msg = "\(move.fC):\(move.fR):\(move.tC):\(move.tR)\(promotionPostfix)"
        nearbyService.send(msg: msg)
        if !chess.isHandicap(move: move) {
            firstMoveMade = true
        }
    }
    
    func updateWithdrawLocally() {
        chess.withdraw()
        boardView.shadowPieces = chess.pieces
        updateWhoseTurnColorsLocally(whiteTurn: chess.whiteTurn)
        boardView.setNeedsDisplay()
    }
    
    func sendWithdrawToPeers() {
        nearbyService.send(msg: "withdraw")
    }
    
    private func promptPromotionOptions(with move: Move) {
        if chess.needsPromotion() {
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
            
            avoidAlertCrashOnPad(alertController: alertController)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    private func alertActionOf(move: Move, rank: ChessRank, targetRank: Character) {
        sendMoveToPeers(move: move, targetRank: targetRank)
        chess.promoteTo(rank: rank)
        boardView.shadowPieces = chess.pieces
        boardView.setNeedsDisplay()
    }
    
    private func avoidAlertCrashOnPad(alertController: UIAlertController) {
        if let popoverPresentationController = alertController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .init(rawValue: 0)
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
    }
}

extension ChessViewController: ChessDelegate {
    func play(with move: Move) {
        guard let movingPiece = chess.pieceAt(col: move.fC, row: move.fR),
              chess.isHandicap(move: move) ||
                isWithdrawing(move: move) ||
                movingPiece.isWhite == chess.whiteTurn else {
            return
        }
        
        if isolated {
            if isWithdrawing(move: move) {
                updateWithdrawLocally()
            } else {
                updateMoveLocally(move: move)
                if chess.needsPromotion() {
                    promptPromotionOptions(with: move)
                }
            }
        } else {
            if isWithdrawing(move: move) {
                updateWithdrawLocally()
                sendWithdrawToPeers()
            } else if isWhiteDevice == chess.whiteTurn {
                updateMoveLocally(move: move)
                if chess.needsPromotion() {
                    promptPromotionOptions(with: move)
                } else {
                    sendMoveToPeers(move: move)
                }
            }
        }
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        return chess.pieceAt(col: col, row: row)
    }
}

extension ChessViewController: NearbyServiceDelegate {
    func disconnectedFrom(peer: String) {
        isolated = true
        boardView.isUserInteractionEnabled = false
        peerLabel.text = peer
        
        let info = "It may be reconnected in a few seconds."
        let alertController = UIAlertController(title: "\(peer) disconnected.", message: "\(info)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Got it.", style: .default))
        
        avoidAlertCrashOnPad(alertController: alertController)
        present(alertController, animated: true, completion: nil)
    }
    
    func connectedWith(peer: String) {
        isolated = false
        boardView.isUserInteractionEnabled = true
        peerLabel.text = peer
        
        let info = firstMoveMade ? "" : "Whoever moves first becomes white player. For handicap, drag pieces out of board before making the first move."
        let alertController = UIAlertController(title: "\(peer) connected.", message: "\(info)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Got it.", style: .default))
        
        avoidAlertCrashOnPad(alertController: alertController)
        present(alertController, animated: true, completion: nil)
    }
    
    func didReceive(msg: String) {
        DispatchQueue.main.async {
            if msg == "withdraw" {
                self.updateWithdrawLocally()
            } else {
                let moveArr = msg.components(separatedBy: ":")
                if let fromCol = Int(moveArr[0]), let fromRow = Int(moveArr[1]), let toCol = Int(moveArr[2]), let toRow = Int(moveArr[3]) {
                    let move = Move(fC: fromCol, fR: fromRow, tC: toCol, tR: toRow)
                    if !self.firstMoveMade && !self.chess.isHandicap(move: move) {
                        self.firstMoveMade = true
                        self.boardView.blackAtTop = false
                        self.isWhiteDevice = false
                        self.upperPlayerColorView.backgroundColor = .white
                        self.lowerPlayerColorView.backgroundColor = .black
                        self.upperPlayerView.backgroundColor = self.whoseTurnColor
                        self.lowerPlayerView.backgroundColor = self.waitingColor
                        self.boardView.setNeedsDisplay()
                    }
                    
                    self.boardView.animate(move: move) { _ in
                        self.updateMoveLocally(move: move)
                        if moveArr.count == 5 {
                            switch moveArr[4] {
                            case "q":
                                self.chess.promoteTo(rank: .queen)
                            case "n":
                                self.chess.promoteTo(rank: .knight)
                            case "r":
                                self.chess.promoteTo(rank: .rook)
                            case "b":
                                self.chess.promoteTo(rank: .bishop)
                            default:
                                break
                            }
                            self.boardView.shadowPieces = self.chess.pieces
                            self.boardView.setNeedsDisplay()
                        }
                    }
                }
            }
        }
    }
}
