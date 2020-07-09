//
//  ViewController.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-06-03.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import UIKit
import AVFoundation
import MultipeerConnectivity

class ViewController: UIViewController {
    let whoseTurnColor: UIColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)

    var chessEngine: ChessEngine = ChessEngine()
    
    @IBOutlet weak var boardView: BoardView!
    @IBOutlet weak var upperView: UIView!
    @IBOutlet weak var lowerView: UIView!
    
    var audioPlayer: AVAudioPlayer!
    
    var peerID: MCPeerID?
    var session: MCSession?
    var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser?
    
    var rankPromotedTo: String = "q"
    var isWhiteDevice = true
    
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
    
    @IBAction func advertise(_ sender: Any) {
        peerID = MCPeerID(displayName: UIDevice.current.name)
        guard let peerID = peerID else { return }
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        guard let session = session else { return }
        session.delegate = self
        
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "gt-chess")
        guard let nearbyServiceAdvertiser = nearbyServiceAdvertiser else { return }
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceAdvertiser.startAdvertisingPeer()
        
        boardView.blackAtTop = false
        isWhiteDevice = false
        upperView.backgroundColor = whoseTurnColor
        lowerView.backgroundColor = .white
        boardView.setNeedsDisplay()
    }
    
    @IBAction func join(_ sender: Any) {
        peerID = MCPeerID(displayName: UIDevice.current.name)
        guard let peerID = peerID else { return }
        session = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        guard let session = session else { return }
        session.delegate = self
        
        let browser = MCBrowserViewController(serviceType: "gt-chess", session: session)
        browser.delegate = self
        present(browser, animated: true)
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
        guard chessEngine.canPieceMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow, isWhite: chessEngine.whitesTurn) else {
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
    
    func send(move: ChessMove) {
        print("chessEngine.needsPromotion() \(chessEngine.needsPromotion())")
        print("rankPromotedTo \(rankPromotedTo)")
        
        let promotionPostfix = chessEngine.needsPromotion() ? ":\(rankPromotedTo)" : ""
        let move = "\(move.fromCol):\(move.fromRow):\(move.toCol):\(move.toRow)\(promotionPostfix)"
        print("sending move: \(move)")
        if let data = move.data(using: .utf8), let session = session {
            try? session.send(data, toPeers: session.connectedPeers, with: .reliable)
        }
    }
    
    func promptPromotionOptions(with move: ChessMove) {
        if chessEngine.needsPromotion() {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            let queenAction = UIAlertAction(title: "Queen", style: .default) { _ in
                self.chessEngine.promoteTo(rank: .queen)
                self.boardView.shadowPieces = self.chessEngine.pieces
                self.boardView.setNeedsDisplay()
                self.rankPromotedTo = "q"
                self.send(move: move)
            }
            alertController.addAction(queenAction)
            
            let knightAction = UIAlertAction(title: "Knight", style: .default) { _ in
                self.chessEngine.promoteTo(rank: .knight)
                self.boardView.shadowPieces = self.chessEngine.pieces
                self.boardView.setNeedsDisplay()
                self.rankPromotedTo = "n"
                self.send(move: move)
            }
            alertController.addAction(knightAction)
            
            if let popoverPresentationController = alertController.popoverPresentationController {
                popoverPresentationController.permittedArrowDirections = .init(rawValue: 0)
                popoverPresentationController.sourceView = self.view
                popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)

            }
            present(alertController, animated: true, completion: nil)
        }
    }
}

extension ViewController: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
}

extension ViewController: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
}

extension ViewController: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            print("connected: \(peerID.displayName)")
        case .connecting:
            print("connecting: \(peerID.displayName)")
        case .notConnected:
            print("not connected: \(peerID.displayName)")
        @unknown default:
            fatalError()
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let move = String(data: data, encoding: .utf8) {
            print("recieved move: \(move)")
            let moveArr = move.components(separatedBy: ":")
            if let fromCol = Int(moveArr[0]), let fromRow = Int(moveArr[1]), let toCol = Int(moveArr[2]), let toRow = Int(moveArr[3]) {
                DispatchQueue.main.async {
                    self.updateMove(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
                    if moveArr.count == 5 {
                        let rankPromotedTo = moveArr[4]
                        switch rankPromotedTo {
                        case "q":
                            self.chessEngine.promoteTo(rank: .queen)
                        case "n":
                            self.chessEngine.promoteTo(rank: .knight)
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
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
}

extension ViewController: ChessDelegate {
    func play(with move: ChessMove) {
        if let movingPiece = chessEngine.pieceAt(col: move.fromCol, row: move.fromRow) {
            if movingPiece.isWhite != chessEngine.whitesTurn {
                return
            }
        }
        
        if let session = session, session.connectedPeers.count > 0 && isWhiteDevice != chessEngine.whitesTurn {
            return
        }
        
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
