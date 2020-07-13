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
    
    var chessEngine: ChessEngine = ChessEngine()
    
    @IBOutlet weak var boardView: BoardView!
    
    @IBOutlet weak var upperPlayerView: UIView!
    @IBOutlet weak var peerLabel: UILabel!
    @IBOutlet weak var upperPlayerColorView: UIView!
    
    @IBOutlet weak var lowerPlayerView: UIView!
    @IBOutlet weak var youLabel: UILabel!
    @IBOutlet weak var lowerPlayerColorView: UIView!
    
    var audioPlayer: AVAudioPlayer!
    
    private var isWhiteDevice = true
    private var firstMoveMade = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "drop", withExtension: "wav")!
        audioPlayer = try? AVAudioPlayer(contentsOf: url)
        
        boardView.chessDelegate = self
        
        resetLocally()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        nearbyService.nearbyServiceDelegate = self
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
    
    private func resetLocally() {
        chessEngine.initializeGame()
        boardView.shadowPieces = chessEngine.pieces
        boardView.blackAtTop = true
        boardView.sharingDevice = false
        isWhiteDevice = true
        upperPlayerColorView.backgroundColor = .black
        lowerPlayerColorView.backgroundColor = .white
        firstMoveMade = false
        updateWhoseTurnColorsLocally(whiteTurn: chessEngine.whiteTurn)
        boardView.isUserInteractionEnabled = true
        boardView.setNeedsDisplay()
    }
    
    private func updateMoveLocally(move: Move) {
        guard chessEngine.isHandicap(move: move) || chessEngine.isValid(move: move, isWhite: chessEngine.whiteTurn) else {
            return
        }
        
        chessEngine.movePiece(move: move)
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
        
        if !chessEngine.isHandicap(move: move) {
            updateWhoseTurnColorsLocally(whiteTurn: chessEngine.whiteTurn)
        }
        
        audioPlayer.play()
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
    
    private func notifyPeersWith(move: Move, targetRank: Character? = nil) {
        var promotionPostfix = ""
        if let targetRank = targetRank {
            promotionPostfix = ":\(targetRank)"
        }
        let msg = "\(move.fC):\(move.fR):\(move.tC):\(move.tR)\(promotionPostfix)"
        nearbyService.send(msg: msg)
        if !chessEngine.isHandicap(move: move) {
            firstMoveMade = true
        }
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
            
            avoidAlertCrashOnPad(alertController: alertController)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    private func alertActionOf(move: Move, rank: ChessRank, targetRank: Character) {
        notifyPeersWith(move: move, targetRank: targetRank)
        chessEngine.promoteTo(rank: rank)
        boardView.shadowPieces = chessEngine.pieces
        boardView.setNeedsDisplay()
    }
    
    private func avoidAlertCrashOnPad(alertController: UIAlertController) {
        if let popoverPresentationController = alertController.popoverPresentationController {
            popoverPresentationController.permittedArrowDirections = .init(rawValue: 0)
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        }
    }
    
    private func reportStatusBefore(move: Move) {
        var status = ""
        
        status += "\n\n"
        status += "================ Status for \(UIDevice.current.name) before move: \(move) ===================\n"
        status += "boardView.blackAtTop = \(boardView.blackAtTop)\n"
        status += "boardView.sharingDevice = \(boardView.sharingDevice)\n"
        status += "isWhiteDevice = \(isWhiteDevice)\n"
        status += "firstMoveMade = \(firstMoveMade)\n"
        status += "boardView.isUserInteractionEnabled = \(boardView.isUserInteractionEnabled)\n"
        status += "\n"
        status += "chessEngine.isHandicap = \(chessEngine.isHandicap(move: move))\n"
        status += "chessEngine.isWithdrawing = \(chessEngine.isWithdrawing(move: move))\n"
        status += "============= end of ==== Status for \(UIDevice.current.name) ================================"
        status += "\n\n"
        
        print(status)
    }
}

extension ChessViewController: ChessDelegate {
    func play(with move: Move) {
        let isWithdrawing = chessEngine.isWithdrawing(move: move)
        guard let movingPiece = chessEngine.pieceAt(col: move.fC, row: move.fR),
              chessEngine.isHandicap(move: move) ||
                isWithdrawing ||
                movingPiece.isWhite == chessEngine.whiteTurn else {
            return
        }

        if peerLabel.text != "Peer" &&  // two devices connected
            !isWithdrawing &&           // can withdraw the last move made by any player
            isWhiteDevice != chessEngine.whiteTurn {
            return
        }
        
        updateMoveLocally(move: move)
        
        if chessEngine.needsPromotion() {
            promptPromotionOptions(with: move)
        } else {
            notifyPeersWith(move: move)
        }
    }
    
    func pieceAt(col: Int, row: Int) -> ChessPiece? {
        return chessEngine.pieceAt(col: col, row: row)
    }
}

extension ChessViewController: NearbyServiceDelegate {
    func disconnectedFrom(peer: String) {
        boardView.isUserInteractionEnabled = false
        peerLabel.text = peer
        
        let alertController = UIAlertController(title: "\(peer) disconnected", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        avoidAlertCrashOnPad(alertController: alertController)
        present(alertController, animated: true, completion: nil)
    }
    
    func connectedWith(peer: String) {
        boardView.isUserInteractionEnabled = true
        peerLabel.text = peer
        
        let msg = firstMoveMade ? nil : "Whoever moves first becomes white player. For handicap, drag pieces out of board before making the first move."
        let alertController = UIAlertController(title: "\(peer) connected", message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        avoidAlertCrashOnPad(alertController: alertController)
        present(alertController, animated: true, completion: nil)
    }
    
    func didReceive(msg: String) {
        let moveArr = msg.components(separatedBy: ":")
        if let fromCol = Int(moveArr[0]), let fromRow = Int(moveArr[1]), let toCol = Int(moveArr[2]), let toRow = Int(moveArr[3]) {
            DispatchQueue.main.async {
                let move = Move(fC: fromCol, fR: fromRow, tC: toCol, tR: toRow)
                if !self.firstMoveMade && !self.chessEngine.isHandicap(move: move) {
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
