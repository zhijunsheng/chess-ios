//
//  Piece.swift
//  chess
//
//  Created by Peter Shi on 2018-11-02.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import Foundation

struct Piece: Hashable {
    var row : Int
    var col : Int
    let imageName: String
    var isWhite : Bool
    var rank : Rank
    
}
