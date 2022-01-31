import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, ChessDelegate {

    @IBOutlet weak var promoteToQueenButton: UIButton!
    @IBOutlet weak var promoteToRookButton: UIButton!
    @IBOutlet weak var promoteToKnightButton: UIButton!
    @IBOutlet weak var promoteToBishopButton: UIButton!
    @IBOutlet weak var boardView: BoardView!
    @IBOutlet weak var peerIDnameLabel: UILabel!
    @IBOutlet weak var whosTurnLabel: UILabel!
    
    var chessBrain = ChessBrain()
    var peerID: MCPeerID!
    var session: MCSession!
    var nearbyServiceAdvertiser: MCNearbyServiceAdvertiser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peerID = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peerID)
        session.delegate = self
        peerIDnameLabel.text = "\(peerID.displayName)"
        chessBrain.reset()
        
        boardView.setNeedsDisplay()
        boardView.chessDelegate = self
    }
    
    func pieceAt(x: Int, y: Int) -> ChessPiece? {
        return chessBrain.pieceAt(x: x, y: y)
    }
    
    func appear() {
        if chessBrain.isWhiteTurn {
            whosTurnLabel.text = "white's turn"
        } else {
            whosTurnLabel.text = "black's turn"
        }
    }
    
    @IBAction func advertise(_ sender: Any) {
        nearbyServiceAdvertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "dabaos-chess")
        nearbyServiceAdvertiser.delegate = self
        nearbyServiceAdvertiser.startAdvertisingPeer()
    }
    
    @IBAction func join(_ sender: Any) {
        let browser = MCBrowserViewController(serviceType: "dabaos-chess", session: session)
        browser.delegate = self
        present(browser, animated: true)
    }

    @IBAction func newGame(_ sender: Any) {
        chessBrain.reset()
        boardView.setNeedsDisplay()
        whosTurnLabel.text = "white's turn"
    }
    
    func movePiece(frX: Int, frY: Int, toX: Int, toY: Int) {
        guard chessBrain.pieceAt(x: frX, y: frY) != nil && chessBrain.canPieceMove(frX: frX, frY: frY, toX: toX, toY: toY) else {
            return
        }
        
        chessBrain.movePiece(frX: frX, frY: frY, toX: toX, toY: toY)
        boardView.setNeedsDisplay()
        
        if chessBrain.needsPromotion() {
            let alertController = UIAlertController(title: "promotion", message: nil, preferredStyle: .actionSheet)
            
            let qenAcction = UIAlertAction(title: "Queen", style: .default) { _ in
                self.chessBrain.promote(rank: .queen)
                self.boardView.setNeedsDisplay()
            }
            let rokAcction = UIAlertAction(title: "Rook", style: .default) { _ in
                self.chessBrain.promote(rank: .rook)
                self.boardView.setNeedsDisplay()
            }
            let nitAcction = UIAlertAction(title: "Knight", style: .default) { _ in
                self.chessBrain.promote(rank: .knight)
                self.boardView.setNeedsDisplay()
            }
            let bisAcction = UIAlertAction(title: "Bishop", style: .default) { _ in
                self.chessBrain.promote(rank: .bishop)
                self.boardView.setNeedsDisplay()
            }
            alertController.addAction(qenAcction)
            alertController.addAction(rokAcction)
            alertController.addAction(nitAcction)
            alertController.addAction(bisAcction)
            
            if let popoverPresentationController = alertController.popoverPresentationController {
                popoverPresentationController.permittedArrowDirections = .init(rawValue: 0)
                popoverPresentationController.sourceView = self.view
                popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            }
            
            present(alertController, animated: true)
        }
        appear()
        let message: String = "\(frX) \(frY) \(toX) \(toY)"
        if let data = message.data(using: .utf8) {
            try? session.send(data, toPeers: session.connectedPeers, with: .reliable)
        }
    }

    func getMovingPiece(x: Int, y: Int) -> ChessPiece? {
        return chessBrain.pieceAt(x: x, y: y)
    }
}

extension ViewController: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .connected:
            print("connected: \(peerID.displayName)")
        case .connecting:
            print("connecting:  \(peerID.displayName)...")
        case .notConnected:
            print("not-connected! (\(peerID.displayName))")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let str = String(data: data, encoding: .utf8) {
//            print(str)
            let components = str.components(separatedBy: " ")
//            print("(\(components[0]),\(components[1])) -> (\(components[2]),\(components[3]))")
            if let fC = Int(components[0]), let fR = Int(components[1]), let tC = Int(components[2]), let tR = Int(components[3]) {
                
                DispatchQueue.main.async {
                    self.chessBrain.movePiece(frX: fC, frY: fR, toX: tC, toY: tR)
                    self.boardView.setNeedsDisplay()
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

extension ViewController: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }
}

extension ViewController: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true, session)
    }
}
