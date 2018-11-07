//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // control drag boardView to here
    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(boardView)
        
        
        let originX: CGFloat = 25
        let originY: CGFloat = 25
        let side: CGFloat = 25
         //var piece: UIImageView = UIImageView(image: UIImage(named: "rook_chess_b"))
        let bRook1: UIImageView = UIImageView(frame: CGRect(x: 60 + originX, y: 100 + originY, width: side, height: side))
        bRook1.image = #imageLiteral(resourceName: "rook_chess_b")
        view.addSubview(bRook1)
        let bKnight1: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side, y: 100 + originY, width: side, height: side))
        bKnight1.image = #imageLiteral(resourceName: "knight_chess_b")
        view.addSubview(bKnight1)
        let bBishop1: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 2, y: 100 + originY, width: side, height: side))
        bBishop1.image = #imageLiteral(resourceName: "bishop_chess_b")
        view.addSubview(bBishop1)
        let bQueen: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 3, y: 100 + originY, width: side, height: side))
        bQueen.image = #imageLiteral(resourceName: "queen_chess_b")
        view.addSubview(bQueen)
        let bKing: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 4, y: 100 + originY, width: side, height: side))
        bKing.image = #imageLiteral(resourceName: "king_chess_b")
        view.addSubview(bKing)
        let bBishop2: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 5, y: 100 + originY, width: side, height: side))
        bBishop2.image = #imageLiteral(resourceName: "bishop_chess_b")
        view.addSubview(bBishop2)
        let bKnight2: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 6, y: 100 + originY, width: side, height: side))
        bKnight2.image = #imageLiteral(resourceName: "knight_chess_b")
        view.addSubview(bKnight2)
        let bRook2: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 7, y: 100 + originY, width: side, height: side))
        bRook2.image = #imageLiteral(resourceName: "rook_chess_b")
        view.addSubview(bRook2)
        for i in 0...7 {
            let bPawn: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * CGFloat(i), y: 100 + originY + side, width: side, height: side))
            bPawn.image = #imageLiteral(resourceName: "pawn_chess_b")
            view.addSubview(bPawn)
        }
        for i in 0...7 {
            let wPawn: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * CGFloat(i), y: 100 + originY + side * 6, width: side, height: side))
            wPawn.image = #imageLiteral(resourceName: "pawn_chess_w")
            view.addSubview(wPawn)
        }
        let wRook1: UIImageView = UIImageView(frame: CGRect(x: 60 + originX, y: 100 + originY + side * 7, width: side, height: side))
        wRook1.image = #imageLiteral(resourceName: "rook_chess_w")
        view.addSubview(wRook1)
        let wKnight1: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side, y: 100 + originY + side * 7, width: side, height: side))
        wKnight1.image = #imageLiteral(resourceName: "knight_chess_w")
        view.addSubview(wKnight1)
        let wBishop1: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 2, y: 100 + originY + side * 7, width: side, height: side))
        wBishop1.image = #imageLiteral(resourceName: "bishop_chess_w")
        view.addSubview(wBishop1)
        let wQueen: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 3, y: 100 + originY + side * 7, width: side, height: side))
        wQueen.image = #imageLiteral(resourceName: "queen_chess_w")
        view.addSubview(wQueen)
        let wKing: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 4, y: 100 + originY + side * 7, width: side, height: side))
        wKing.image = #imageLiteral(resourceName: "king_chess_w")
        view.addSubview(wKing)
        let wBishop2: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 5, y: 100 + originY + side * 7, width: side, height: side))
        wBishop2.image = #imageLiteral(resourceName: "bishop_chess_w")
        view.addSubview(wBishop2)
        let wKnight2: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 6, y: 100 + originY + side * 7, width: side, height: side))
        wKnight2.image = #imageLiteral(resourceName: "knight_chess_w")
        view.addSubview(wKnight2)
        let wRook2: UIImageView = UIImageView(frame: CGRect(x: 60 + originX + side * 7, y: 100 + originY + side * 7, width: side, height: side))
        wRook2.image = #imageLiteral(resourceName: "rook_chess_w")
        view.addSubview(wRook2)
    }
}

