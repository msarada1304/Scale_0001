//
//  TestDraw.swift
//  SCale
//
//  Created by 皿田雅博 on 2017/09/03.
//  Copyright © 2017年 皿田雅博. All rights reserved.
//

import UIKit

class TestDraw: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.borderWidth = 0.0
        self.layer.masksToBounds = true
        
        let myRect1: UIBezierPath = UIBezierPath(rect: CGRect(x:0, y:0, width:frame.size.width, height:frame.size.height))
        
        UIColor(red: 0.886, green: 0.855, blue: 0.596, alpha: 1.0).setFill()
        
        myRect1.fill()
    }
    

}
class TestDraw2: UIView {
    
    override func draw(_ rect: CGRect) {
        
        self.layer.borderWidth = 0.0
        self.layer.masksToBounds = true
        
        let myRect1: UIBezierPath = UIBezierPath(rect: CGRect(x:0, y:0, width:frame.size.width, height:frame.size.height))
        
        UIColor.lightGray.setFill()
        
        myRect1.fill()
    }
}
