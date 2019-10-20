//
//  BoardView.swift
//  chess
//
//  Created by Lambert Lin on 2019/10/16.
//  Copyright © 2019 GoldThumb Inc. All rights reserved.
//

import UIKit

class BoardView: UIView {

    override func draw(_ rect: CGRect) {
        print(bounds.width)
        
        let pencil = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 91, height:91 ))
        #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1).setFill()
        pencil.fill()
        
        let rty = UIBezierPath(rect: CGRect(x: 91, y:0, width: 91, height:91 ))
        #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).setFill()
        rty.fill()
        
    }
    

}
