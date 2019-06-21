//
//  Utils.swift
//  chess
//
//  Created by Peter Shi on 2019-06-21.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

struct Utils {
    
    static func xyToColRow(xy: CGFloat, orgXY: CGFloat, side: CGFloat, margin: CGFloat) -> Int? {
        let thing = Int((xy - orgXY) / side)
        if xy > side * CGFloat(thing) + margin + orgXY && xy < side * CGFloat(thing + 1) - margin + orgXY {
            return thing
        }
        
        return nil
    }

    
    static func closerTo(smaller: CGFloat, larger: CGFloat, number: CGFloat) -> Int? {
//        if number < smaller {
//            return smaller
//        } else if number > larger {
//            return larger
//        } else if (smaller - number) < (larger - number) {
//            return smaller
//        } else if (larger - number) < (smaller - number) {
//            return larger
//        }
        return nil
    }
}
