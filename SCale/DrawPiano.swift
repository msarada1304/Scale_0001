//
//  DrawPiano.swift
//  SCale
//
//  Created by 皿田雅博 on 2017/09/09.
//  Copyright © 2017年 皿田雅博. All rights reserved.
//

import UIKit

class DrawPiano: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let myRect1: UIBezierPath = UIBezierPath(rect: CGRect(x:0, y:0, width:frame.size.width, height:frame.size.height))
        
        
        UIColor.black.setFill()
        myRect1.fill()
        
        let x0 = 266
        for n in 0...20{
            let white_key: UIBezierPath = UIBezierPath(rect: CGRect(x:1+n*38, y:1, width:37, height:198))
            UIColor.white.setFill()
            white_key.fill()
        }

        for l in 0...2
        {
            for n in 0...1{
                let black_key: UIBezierPath = UIBezierPath(rect: CGRect(x:x0*l+25+n*38, y:1, width:25, height:120))
                UIColor.black.setFill()
                black_key.fill()
            }
            for n in 0...2{
                let black_key2: UIBezierPath = UIBezierPath(rect: CGRect(x:x0*l+140+n*38, y:1, width:25, height:120))
                UIColor.black.setFill()
                black_key2.fill()
            }
        }

    }
    

}
