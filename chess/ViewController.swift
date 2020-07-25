import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, ChessDelegate {
    var game = GameRules()
    var peerID: MCPeerID!
    var session: MCSession!
//    var advertiserAssistant: MCAdvertiserAssistant!
    var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser!
    
    @IBOutlet weak var isWhiteTurnLabel: UILabel!
    
    @IBAction func newGame(_ sender: Any) {
        game.pieceBox.removeAll()
        game.reset()
        boardView.shadowPieceBox = game.pieceBox
        boardView.setNeedsDisplay()
    }
    @IBOutlet weak var boardView: BoardView!
    
    
    @IBAction func advertise(_ sender: Any) {
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "mariuschess")
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceAdvertiser.startAdvertisingPeer()
    }
    @IBAction func join(_ sender: Any) {
        let blowser = MCBrowserViewController(serviceType: "maruischess", session: session)
        blowser.delegate = self
        present(blowser, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        peerID = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peerID)
        session.delegate = self
        
        boardView.delegate = self
        
        game.reset()
        
        boardView.shadowPieceBox = game.pieceBox
        boardView.setNeedsDisplay()
    }
    
    func move(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int) {
        game.move(fromCol: fromCol, fromRow: fromRow, toCol: toCol, toRow: toRow)
        boardView.shadowPieceBox = game.pieceBox
        boardView.setNeedsDisplay()
    }
   
}

extension ViewController: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            print("CONNECTED: \(peerID.displayName)")
        case .connecting:
            print("SOMEONEISCONNECTING: \(peerID.displayName)")
        case .notConnected:
            print("SOMEONEFAILEDCONNECTED: \(peerID.displayName)")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        
    }
    
    
}

extension ViewController: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        
    }
}

extension ViewController: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
    
    
}
