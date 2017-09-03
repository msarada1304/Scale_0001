//
//  DrawRect.swift
//  SCale
//
//  Created by 皿田雅博 on 2017/09/03.
//  Copyright © 2017年 皿田雅博. All rights reserved.
//

import UIKit

class DrawRect: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let myRect1: UIBezierPath = UIBezierPath(rect: CGRect(x:0, y:0, width:frame.size.width, height:frame.size.height))
        
        
        UIColor.brown.setFill()
        myRect1.fill()

    }
    

}
class DrawFret: UIView {
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let myRect1: UIBezierPath = UIBezierPath(rect: CGRect(x:0, y:0, width:frame.size.width, height:frame.size.height))
        
        
        UIColor.gray.setFill()
        myRect1.fill()
    }
}
class DrawNat: UIView {
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let myRect1: UIBezierPath = UIBezierPath(rect: CGRect(x:0, y:0, width:frame.size.width, height:frame.size.height))
        
        
        UIColor.white.setFill()
        myRect1.fill()
    }
}


class drawCircle: UIView {
    
    override func draw(_ rect: CGRect) {
        
        //self.layer.borderColor = UIColor.brown.cgColor
        //self.layer.cornerRadius = 10.0
        let myRect1: UIBezierPath = UIBezierPath(rect: CGRect(x:0, y:0, width:frame.size.width, height:frame.size.height))
        
        
        UIColor(red: 0.886, green: 0.855, blue: 0.596, alpha: 1.0).setFill()
        myRect1.fill()
        
        //let oval = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width))
        let arc = UIBezierPath(arcCenter: CGPoint(x:frame.size.width/2, y:frame.size.width/2), radius: frame.size.width/2,  startAngle:0, endAngle: 3.14*2, clockwise: true)
        // 塗りつぶし色の設定
        // 透明色設定
        let aColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        aColor.setStroke()
        arc.lineWidth = 1
        UIColor.white.setFill()
        arc.fill()
        // 内側の塗りつぶし
        
        arc.stroke()
        //oval.fill()
        
    }
}
