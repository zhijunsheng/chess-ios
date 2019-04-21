//
//  ViewController.swift
//  chess
//
//  Created by Donald Sheng on 2018-01-23.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        

        
//        let wreck = CGRect(x:  boardView.originXForBoard + boardView.cellSide * 3, y: boardView.originYForFirstSquare, width: boardView.cellSide, height: boardView.cellSide)
//        let fightingImage = UIImage(named: "queen_chess_b")
//        let pieceImageView = UIImageView(frame: wreck)
//        pieceImageView.image = fightingImage
//        boardView.addSubview(pieceImageView)
//
//        let wreck11 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * 3, y: boardView.originYForFirstSquare + boardView.cellSide * 7, width: boardView.cellSide, height: boardView.cellSide)
//        let fightingImage11 = UIImage(named: "queen_chess_w")
//        let pieceImageView11 = UIImageView(frame: wreck11)
//        pieceImageView11.image = fightingImage11
//        boardView.addSubview(pieceImageView11)
//
//        let wreck1 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * 4, y: boardView.originYForFirstSquare, width: boardView.cellSide, height: boardView.cellSide)
//        let fightingImage1 = UIImage(named: "king_chess_b")
//        let pieceImageView1 = UIImageView(frame: wreck1)
//        pieceImageView1.image = fightingImage1
//        boardView.addSubview(pieceImageView1)
//
//        let wreck2 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * 4, y: boardView.originYForFirstSquare + boardView.cellSide * 7, width: boardView.cellSide, height: boardView.cellSide)
//        let fightingImage2 = UIImage(named: "king_chess_w")
//        let pieceImageView2 = UIImageView(frame: wreck2)
//        pieceImageView2.image = fightingImage2
//        boardView.addSubview(pieceImageView2)
//
//        for i in 0 ..< 2 {
//            let wreck7 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * CGFloat(i * 7), y: boardView.originYForFirstSquare, width: boardView.cellSide, height: boardView.cellSide)
//            let fightingImage7 = UIImage(named: "rook_chess_b")
//            let pieceImageView7 = UIImageView(frame: wreck7)
//            pieceImageView7.image = fightingImage7
//            boardView.addSubview(pieceImageView7)
//
//            let wreck3 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * CGFloat(1 + 5 * i), y: boardView.originYForFirstSquare, width: boardView.cellSide, height: boardView.cellSide)
//            let fightingImage3 = UIImage(named: "knight_chess_b")
//            let pieceImageView3 = UIImageView(frame: wreck3)
//            pieceImageView3.image = fightingImage3
//            boardView.addSubview(pieceImageView3)
//
//
//            let wreck4 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * CGFloat(2 + 3 * i),y:boardView.originYForFirstSquare, width: boardView.cellSide, height: boardView.cellSide)
//            let fightingImage4 = UIImage(named: "bishop_chess_b")
//            let pieceImageView4 = UIImageView(frame: wreck4)
//            pieceImageView4.image = fightingImage4
//            boardView.addSubview(pieceImageView4)
//
//            let wreck5 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * CGFloat(2 + 3 * i),y: boardView.originYForFirstSquare + boardView.cellSide * 7, width: boardView.cellSide, height: boardView.cellSide)
//            let fightingImage5 = UIImage(named: "bishop_chess_w")
//            let pieceImageView5 = UIImageView(frame: wreck5)
//            pieceImageView5.image = fightingImage5
//            boardView.addSubview(pieceImageView5)
//
//                let wreck6 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * CGFloat(1 + 5 * i), y: boardView.originYForFirstSquare + boardView.cellSide * 7, width: boardView.cellSide, height: boardView.cellSide)
//                let fightingImage6 = UIImage(named: "knight_chess_w")
//                let pieceImageView6 = UIImageView(frame: wreck6)
//                pieceImageView6.image = fightingImage6
//                boardView.addSubview(pieceImageView6)
//
//            let wreck8 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * CGFloat(i * 7), y: boardView.originYForFirstSquare + boardView.cellSide * 7, width: boardView.cellSide, height: boardView.cellSide)
//            let fightingImage8 = UIImage(named: "rook_chess_w")
//            let pieceImageView8 = UIImageView(frame: wreck8)
//            pieceImageView8.image = fightingImage8
//            boardView.addSubview(pieceImageView8)
//        }
//         let whitePawnImage = UIImage(named: "pawn_chess_w")
//        let blackPawnImage = UIImage(named: "pawn_chess_b")
//        for i in 0 ..< 8 {
//            let wreck9 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * CGFloat(i), y: boardView.originYForFirstSquare + boardView.cellSide, width: boardView.cellSide, height: boardView.cellSide)
//            let pieceImageView9 = UIImageView(frame: wreck9)
//            pieceImageView9.image = blackPawnImage
//            boardView.addSubview(pieceImageView9)
//
//            let wreck10 = CGRect(x:  boardView.originXForBoard + boardView.cellSide * CGFloat(i) , y: boardView.originYForFirstSquare + boardView.cellSide * 6, width: boardView.cellSide, height: boardView.cellSide)
//            let pieceImageView10 = UIImageView(frame: wreck10)
//            pieceImageView10.image = whitePawnImage
//            boardView.addSubview(pieceImageView10)
        }
    }

//}
