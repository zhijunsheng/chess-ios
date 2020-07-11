//
//  ChessDelagate.swift
//  chess
//
//  Created by Peter Shi on 2019-09-25.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

protocol ChessDelegate {
    func move(startX: Int, startY: Int, endX: Int, endY: Int)
    func pieceOn(x: Int, y: Int) -> Piece?
}
