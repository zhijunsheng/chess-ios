//
//  ChessDelegate.swift
//  chess
//
//  Created by Harry Shen on 11/27/21.
//  Copyright © 2021 GoldThumb Inc. All rights reserved.
//

import Foundation
protocol ChessDelegate{
    func pieceAt(column:Int, row:Int) -> ChessPiece?
}
