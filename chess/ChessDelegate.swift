//
//  ChessDelegate.swift
//  chess
//
//  Created by Elaine on 2019-11-24.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import Foundation

protocol ChessDelegate {
    func movePiece(startingCol: Int, startingRow: Int, endingCol: Int, endingRow: Int) 
}
