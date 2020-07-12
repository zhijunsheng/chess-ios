//
//  NearbyServiceDelegate.swift
//  Chess
//
//  Created by Zhijun Sheng on 2020-07-10.
//  Copyright © 2020 Gold Thumb Inc. All rights reserved.
//

import Foundation

protocol NearbyServiceDelegate {
    func didReceive(msg: String)
    func connectedWith(peer: String)
    func disconnectedFrom(peer: String)
}
