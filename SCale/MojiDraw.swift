//
//  MojiDraw.swift
//  SCale
//
//  Created by 皿田雅博 on 2017/09/03.
//  Copyright © 2017年 皿田雅博. All rights reserved.
//

import UIKit

class MojiDraw: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.red.cgColor)
        
        //矩形
        context!.fill(CGRect(x: 0, y: 0, width: 15, height: 20))
        
        //文字属性
        let att = [
            NSFontAttributeName: UIFont(name: "Courier", size: 20.0)!,
            NSForegroundColorAttributeName: UIColor.black]
        
        //文字描画
        let i = 1
        NSString(format: "%d", i).draw(at: CGPoint(x: 2, y: 0), withAttributes: att)
        
        let line = UIBezierPath();
        // 起点
        line.move(to: CGPoint(x: 0, y: 0));
        // 帰着点
        line.addLine(to: CGPoint(x: 15, y: 0));
        line.addLine(to: CGPoint(x: 15, y: 20));
        line.addLine(to: CGPoint(x: 0, y: 20));
        // ラインを結ぶ
        line.close()
        // 色の設定
        UIColor.black.setStroke()
        // ライン幅
        line.lineWidth = 1
        // 描画
        line.stroke();

    }
    

}
class MojiDraw2: UIView {
    
    var NoteNum = 1
    var Minor = 1
    var flat = 0
    var Note = 0
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.white.cgColor)
        
        
        if (Note == 3 || Note == 8 || Note == 10)
        {
            flat = 1
        }
        
        
        //矩形
        
        context!.fill(CGRect(x:0,y:0,width:15+flat*10,height:20))
        //文字属性
        let att = [
            NSFontAttributeName: UIFont(name: "Courier", size: 20.0)!,
            NSForegroundColorAttributeName: UIColor.black]
        
        //文字描画
        switch Note {
        case 2:
            NSString(format:"%d",Note).draw(at:CGPoint(x:2,y:0),withAttributes:att)
        case 3:
            NSString(format:"b%d",Note).draw(at:CGPoint(x:2,y:0),withAttributes:att)
        case 4:
            NSString(format:"%d",Note-1).draw(at:CGPoint(x:2,y:0),withAttributes:att)
        case 5:
            NSString(format:"%d",Note-1).draw(at:CGPoint(x:2,y:0),withAttributes:att)
        case 7:
            NSString(format:"%d",Note-2).draw(at:CGPoint(x:2,y:0),withAttributes:att)
        case 8:
            NSString(format:"b%d",Note-2).draw(at:CGPoint(x:2,y:0),withAttributes:att)
        case 9:
            NSString(format:"%d",Note-3).draw(at:CGPoint(x:2,y:0),withAttributes:att)
        case 10:
            NSString(format:"b%d",Note-3).draw(at:CGPoint(x:2,y:0),withAttributes:att)
        case 11:
            NSString(format:"%d",Note-4).draw(at:CGPoint(x:2,y:0),withAttributes:att)
            
        default:
            print("aho")
            
        }
        /* let i = Note
         
         if (flat == 1)
         {
         NSString(format:"b%d",i).draw(at:CGPoint(x:2,y:0),withAttributes:att)
         }
         else{
         NSString(format: "%d",i).draw(at:CGPoint(x:2,y:0),withAttributes:att)
         }
         */
        let line = UIBezierPath();
        // 起点
        line.move(to: CGPoint(x: 0, y: 0));
        // 帰着点
        line.addLine(to: CGPoint(x: 15+flat*10, y: 0));
        line.addLine(to: CGPoint(x: 15+flat*10, y: 20));
        line.addLine(to: CGPoint(x: 0, y: 20));
        
        line.close()
        // 色の設定
        UIColor.black.setStroke()
        // ライン幅
        line.lineWidth = 1
        // 描画
        line.stroke();
    }
    
    
}
