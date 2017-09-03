//
//  ViewController.swift
//  SCale
//
//  Created by 皿田雅博 on 2017/09/03.
//  Copyright © 2017年 皿田雅博. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    
    @IBOutlet weak var Root_note: UISegmentedControl!
    @IBOutlet weak var Scale_cont: UISegmentedControl!
    @IBOutlet weak var Instruments: UISegmentedControl!
    
    let imageBag = UIImageView()
    let guitar_height = 212
    let flet_width = 100
    let guitar_Mark=20
    let notex = 15
    let notey = 20
    let code_dx = 90
    let gy = 90
    var g_root = -4
    var m_m = 0
    let start=[0,5,10,15,19,24]
    var  GMaj=[3,5,7,8,10,12,14,15,
               17,19,20,22,24,26,27,
               29,31,32,34,36,38,39,
               40,42,43,45,47,49,50]
    
    let major   = [2,4,5,7,9,11, //major
        2,3,5,7,8,10, //minor_nat
        2,4,7,7,9,9, //major penta
        3,5,7,7,10,10] //minor_penta
    
    @IBAction func Scale_con_hitButton(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            m_m = 0
            draw_guitar(root:g_root)
        case 1:
            m_m = 1
            draw_guitar(root:g_root)
        case 2:
            m_m = 2
            draw_guitar(root:g_root)
        case 3:
            m_m = 3
            draw_guitar(root:g_root)
        default:
            print("")
        }
    }
    @IBAction func Root_note_hitButton(_ sender: UISegmentedControl) {
    
        switch sender.selectedSegmentIndex {
        case 0://C
            g_root = -4
            draw_guitar(root:g_root)
        case 1://C#
            g_root = -3
            draw_guitar(root:g_root)
        case 2://D
            draw_guitar(root:-2)
            g_root = -2
        case 3://D#
            draw_guitar(root:-1)
            g_root = -1
        case 4://E
            draw_guitar(root:0)
            g_root = 0
        case 5://F
            draw_guitar(root:1)
            g_root = 1
        case 6://F#
            draw_guitar(root:2)
            g_root = 2
        case 7://G
            draw_guitar(root:-9)
            g_root = -9
        case 8://G#
            draw_guitar(root:-8)
            g_root = -8
        case 9://A
            draw_guitar(root:-7)
            g_root = -7
        case 10://A#
            draw_guitar(root:-6)
            g_root = -6
        case 11://B
            draw_guitar(root:-5)
            g_root = -5
        default:
            print("")
        }
    }
    func draw_guitar(root :Int)
    {
        var n = 0
        for k in 0...3{
            GMaj[n]   = root   + k*12
            GMaj[n+1] = root+major[m_m*6  ] + k*12
            GMaj[n+2] = root+major[m_m*6+1] + k*12
            GMaj[n+3] = root+major[m_m*6+2] + k*12
            GMaj[n+4] = root+major[m_m*6+3] + k*12
            GMaj[n+5] = root+major[m_m*6+4] + k*12
            GMaj[n+6] = root+major[m_m*6+5] + k*12
            
            n = n + 7
        }
        
        
        self.view.backgroundColor = UIColor.lightGray
        
        let testDraw0 = TestDraw2(frame: CGRect(x: 0, y: gy-10, width: 900, height: 232))
        self.view.addSubview(testDraw0)
        let testDraw = TestDraw(frame: CGRect(x: 0, y: gy, width: 800, height: 212))
        self.view.addSubview(testDraw)
        
        let dh = 40
        
        var cur_y = gy + 5
        
        let f_dh = 34//42
        let neck=25
        let neck_w=10
        var cur_f=f_dh+neck+neck_w-10
        
        /////////  ギター  ///////////////////////////////////////////////////////////////////////////
        //フレッット
        for _ in 1...18{
            let testDraw2 = DrawFret(frame:CGRect(x:cur_f,y:gy,width:5,height:guitar_height))
            self.view.addSubview(testDraw2)
            cur_f = cur_f + f_dh
        }
        //ナット
        let testDraw2 = DrawNat(frame:CGRect(x:neck,y:gy,width:neck_w,height:guitar_height))
        self.view.addSubview(testDraw2)
        //弦
        //var sum:Int = 0
        for _ in 1...6 {
            // sum += num
            let testDraw2 = DrawRect(frame:CGRect(x:0,y:cur_y,width:800,height:2))
            self.view.addSubview(testDraw2)
            cur_y=cur_y+dh
        }
        //マーク
        for num in 1...4{
            let testDraw2 = drawCircle(frame: CGRect(x: neck+neck_w+2*num*f_dh+(f_dh-15)/2-guitar_Mark/2, y:gy+(guitar_height-guitar_Mark)/2, width: guitar_Mark, height: guitar_Mark))
            self.view.addSubview(testDraw2)
        }
        let testDraw3 = drawCircle(frame: CGRect(x: neck+neck_w+11*f_dh+(f_dh-15)/2-guitar_Mark/2, y:gy+(guitar_height-guitar_Mark)/2-75, width: guitar_Mark, height: guitar_Mark))
        self.view.addSubview(testDraw3)
        let testDraw4 = drawCircle(frame: CGRect(x: neck+neck_w+11*f_dh+(f_dh-15)/2-guitar_Mark/2, y:gy+(guitar_height-guitar_Mark)/2+75, width: guitar_Mark, height: guitar_Mark))
        self.view.addSubview(testDraw4)
        
        for num in 0...2{
            let testDraw5 = drawCircle(frame: CGRect(x: neck+neck_w+14*f_dh+2*num*f_dh+(f_dh-15)/2-guitar_Mark/2, y:gy+(guitar_height-guitar_Mark)/2, width: guitar_Mark, height: guitar_Mark))
            self.view.addSubview(testDraw5)
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        
        
        
        for k in 0...5{
            var ct = 0
            var oct = 0
            if start[k] - root > 12 { oct = 1}
            if start[k] - root > 24 { oct = 2}
            for n in start[k]...50{
                for _ in 1...28
                {
                    if(GMaj[ct] < n)
                    {
                        ct = ct + 1
                    }
                }
                if(GMaj[ct]==n)
                {
                    let ex = n-root
                    var b_root=false
                    
                    if ex == 0{
                        b_root = true
                    }
                    else if (ex%12==0){
                        b_root = true
                        oct = oct + 1
                    }
                    else{
                        b_root = false
                    }
                    
                    if b_root == true{
                        
                        let testDraw = MojiDraw(frame: CGRect(x: neck+neck_w+(n-start[k]-1)*f_dh+(f_dh-10)/2-guitar_Mark/2, y:gy-16+guitar_height-dh*k, width: notex, height: notey))
                        self.view.addSubview(testDraw)
                    }
                    else{
                        let testDraw = MojiDraw2()
                        testDraw.Minor = m_m
                        testDraw.NoteNum = ct+1-oct*7
                        testDraw.Note = GMaj[ct]-root-12*oct
                        if (testDraw.Note == 3 || testDraw.Note == 8 || testDraw.Note == 10){
                            testDraw.frame = CGRect(x: neck-5+neck_w+(n-start[k]-1)*f_dh+(f_dh-10)/2-guitar_Mark/2, y:gy-16+guitar_height-dh*k, width: notex+10, height: notey)
                        }
                        else{
                            testDraw.frame = CGRect(x: neck+neck_w+(n-start[k]-1)*f_dh+(f_dh-10)/2-guitar_Mark/2, y:gy-16+guitar_height-dh*k, width: notex, height: notey)
                        }
                        //       testDraw = MojiDraw2(frame: CGRect(x: neck+neck_w+(n-start[k]-1)*f_dh+(f_dh-10)/2-guitar_Mark/2, y:84+guitar_height-dh*k, width: notex, height: notey))
                        self.view.addSubview(testDraw)
                        
                    }
                    ct=ct+1
                    
                }
            }
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Scale_cont.center = CGPoint(x: self.view.frame.width/2 - 50, y: 340)
        Root_note.center = CGPoint(x: self.view.frame.width/2, y:50)
        Instruments.center = CGPoint(x: self.view.frame.width/2 + 280, y:340)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

