//
//  Piece.swift
//  chess
//
//  Created by Felix Lo on 2020/7/27.
//  Copyright © 2020 GoldThumb Inc. All rights reserved.
//

import Foundation

struct Piece: Hashable {
    let col: Int
    let row: Int
    let player: Player
    let rank: Rank
    let imageName: String
}
