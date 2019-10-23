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
        
        
       
        let encil = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        encil.fill()
               
        let ty = UIBezierPath(rect: CGRect(x: 91, y:0, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        ty.fill()
        let pen = UIBezierPath(rect: CGRect(x: 182, y: 0, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        pen.fill()
               
        let tp = UIBezierPath(rect: CGRect(x: 273, y:0, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        tp.fill()
        let ipp = UIBezierPath(rect: CGRect(x: 364, y: 0, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        ipp.fill()
               
        let rl = UIBezierPath(rect: CGRect(x: 455, y:0, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        rl.fill()
               
        let ad = UIBezierPath(rect: CGRect(x: 546, y: 0, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        ad.fill()
               
        let en = UIBezierPath(rect: CGRect(x: 637, y:0, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        en.fill()
        
        
        
        let rty = UIBezierPath(rect: CGRect(x: 0, y:91, width: 91, height:91 ))
         #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
         rty.fill()
         
         let pencil = UIBezierPath(rect: CGRect(x: 91, y: 91, width: 91, height:91 ))
         #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
         pencil.fill()
         
         let rt = UIBezierPath(rect: CGRect(x: 182, y:91, width: 91, height:91 ))
         #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
         rt.fill()
         
         let pe = UIBezierPath(rect: CGRect(x: 273, y: 91, width: 91, height:91 ))
         #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
         pe.fill()
         
        let r = UIBezierPath(rect: CGRect(x: 364, y:91, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        r.fill()
         let p = UIBezierPath(rect: CGRect(x: 455, y: 91, width: 91, height:91 ))
         #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
         p.fill()
         
         let e = UIBezierPath(rect: CGRect(x: 546, y:91, width: 91, height:91 ))
         #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
         e.fill()
         
         let a = UIBezierPath(rect: CGRect(x: 637, y: 91, width: 91, height:91 ))
         #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
         a.fill()
        
        
       let se = UIBezierPath(rect: CGRect(x: 0, y: 182, width: 91, height:91 ))
       #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
       se.fill()
              
       let cv = UIBezierPath(rect: CGRect(x: 91, y:182, width: 91, height:91 ))
       #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
       cv.fill()
        let l = UIBezierPath(rect: CGRect(x: 182, y: 182, width: 91, height:91 ))
       #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
       l.fill()
              
       let t = UIBezierPath(rect: CGRect(x: 273, y:182, width: 91, height:91 ))
       #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
       t.fill()
       let q = UIBezierPath(rect: CGRect(x: 364, y: 182, width: 91, height:91 ))
       #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
       q.fill()
              
       let az = UIBezierPath(rect: CGRect(x: 455, y:182, width: 91, height:91 ))
       #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
       az.fill()
              
       let io = UIBezierPath(rect: CGRect(x: 546, y: 182, width: 91, height:91 ))
       #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
       io.fill()
              
       let v = UIBezierPath(rect: CGRect(x: 637, y:182, width: 91, height:91 ))
       #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
       v.fill()
        
        
       let sx = UIBezierPath(rect: CGRect(x: 0, y:273, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        sx.fill()
        
        let dx = UIBezierPath(rect: CGRect(x: 91, y: 273, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        dx.fill()
        
        let db = UIBezierPath(rect: CGRect(x: 182, y:273, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        db.fill()
        
        let dn = UIBezierPath(rect: CGRect(x: 273, y: 273, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        dn.fill()
        
       let dm = UIBezierPath(rect: CGRect(x: 364, y:273, width: 91, height:91 ))
       #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
       dm.fill()
        let u = UIBezierPath(rect: CGRect(x: 455, y: 273, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        u.fill()
        
        let wx = UIBezierPath(rect: CGRect(x: 546, y:273, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        wx.fill()
        
        let d = UIBezierPath(rect: CGRect(x: 637, y: 273, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        d.fill()
        
        
        let we = UIBezierPath(rect: CGRect(x: 0, y: 364, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        we.fill()
               
        let wr = UIBezierPath(rect: CGRect(x: 91, y:364, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        wr.fill()
        let wt = UIBezierPath(rect: CGRect(x: 182, y: 364, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        wt.fill()
               
        let wy = UIBezierPath(rect: CGRect(x: 273, y:364, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        wy.fill()
        let wu = UIBezierPath(rect: CGRect(x: 364, y: 364, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        wu.fill()
               
        let wi = UIBezierPath(rect: CGRect(x: 455, y:364, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        wi.fill()
               
        let wp = UIBezierPath(rect: CGRect(x: 546, y: 364, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        wp.fill()
               
        let wo = UIBezierPath(rect: CGRect(x: 637, y:364, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        wo.fill()
        
        
        let cs = UIBezierPath(rect: CGRect(x: 0, y:455, width: 91, height:91 ))
         #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
         cs.fill()
         
         let cd = UIBezierPath(rect: CGRect(x: 91, y: 455, width: 91, height:91 ))
         #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
         cd.fill()
         
         let cf = UIBezierPath(rect: CGRect(x: 182, y:455, width: 91, height:91 ))
         #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
         cf.fill()
         
         let cg = UIBezierPath(rect: CGRect(x: 273, y: 455, width: 91, height:91 ))
         #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
         cg.fill()
         
        let ch = UIBezierPath(rect: CGRect(x: 364, y:455, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        ch.fill()
         let cj = UIBezierPath(rect: CGRect(x: 455, y: 455, width: 91, height:91 ))
         #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
         cj.fill()
         
        let ck = UIBezierPath(rect: CGRect(x: 546, y:455, width: 91, height:91 ))
         #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
         ck.fill()
         
         let cl = UIBezierPath(rect: CGRect(x: 637, y: 455, width: 91, height:91 ))
         #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
         cl.fill()
        
        let vf = UIBezierPath(rect: CGRect(x: 0, y: 546, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        vf.fill()
               
        let vg = UIBezierPath(rect: CGRect(x: 91, y:546, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        vg.fill()
        let vh = UIBezierPath(rect: CGRect(x: 182, y: 546, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
         vh.fill()
               
        let vj = UIBezierPath(rect: CGRect(x: 273, y:546, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        vj.fill()
        let vk = UIBezierPath(rect: CGRect(x: 364, y: 546, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        vk.fill()
               
        let vp = UIBezierPath(rect: CGRect(x: 455, y:546, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        vp.fill()
               
        let vl = UIBezierPath(rect: CGRect(x: 546, y: 546, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        vl.fill()
               
        let ml = UIBezierPath(rect: CGRect(x: 637, y:546, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        ml.fill()
        
        
        let gt = UIBezierPath(rect: CGRect(x: 0, y:637, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        gt.fill()
                
        let gy = UIBezierPath(rect: CGRect(x: 91, y: 637, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        gy.fill()
                
        let gu = UIBezierPath(rect: CGRect(x: 182, y:637, width: 91, height:91 ))
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        gu.fill()
                
        let gi = UIBezierPath(rect: CGRect(x: 273, y: 637, width: 91, height:91 ))
        #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).setFill()
        gi.fill()
                
        let go = UIBezierPath(rect: CGRect(x: 364, y:637, width: 91, height:91 ))
               #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setFill()
        go.fill()
        
//
        drawSquare(col: 6, row: 7, color: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
        
//        makeSquare()
        drawSquare(col: 7, row: 7, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        
        drawSquare(col: 5, row: 7, color: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        
        drawSquare(col: 3, row: 7, color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
    }
    
   
    
    func drawSquare(col: Int, row: Int, color: UIColor)  {
        let square = UIBezierPath(rect: CGRect(x: 91 * col, y: 91 * row, width: 91, height:91 ))
        color.setFill()
        square.fill()
    }
    
    
    
    
}
