//
//  ChessDelegate.swift
//  chess
//
//  Created by Grace Huang on 11/21/19.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

protocol ChessDelegate {
    func movePiece(fromCol: Int, fromRow: Int, toCol: Int, toRow: Int)
    func pieceAt(locationX: Int, locationY: Int) -> ChessPiece?
}
