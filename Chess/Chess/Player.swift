//
//  Player.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-07-25.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

enum Player {
    case white
    case black
    
    var isWhite: Bool {
        switch self {
        case .white:
            return true
        case .black:
            return false
        }
    }
    
    var enemy: Player {
        switch self {
        case .white:
            return .black
        case .black:
            return .white
        }
    }
}
