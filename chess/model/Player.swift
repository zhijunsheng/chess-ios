//
//  Player.swift
//  chess
//
//  Created by Bowen Lin on 2018-02-17.
//  Copyright © 2018 GoldThumb Inc. All rights reserved.
//

import Foundation

enum Player {
    case white
    case black

    var other: Player {
        return self == .white ? .black : .white
    }
}
