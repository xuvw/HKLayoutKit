//
//  ViewController.swift
//  HKLayoutKit
//
//  Created by heke on 16/9/5.
//  Copyright © 2016年 mhk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        demo0()
    }
    
    func demo0() {
        let v = UIView()
        v.backgroundColor = UIColor.randomColor()
        view.addSubview(v)
        
        v.Top == view.Top + 20
        v.Left == view.Left + 20
        v.Bottom == view.Bottom - 20
        v.Right == view.Right - 20
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.randomColor()
        view.addSubview(v1)
        
        v1.Origin === CGPointMake(30, 30)
        v1.Size === CGSizeMake(40, 40)
        
        let v2 = UIView()
        v2.backgroundColor = UIColor.randomColor()
        v.addSubview(v2)
        v2.Inset === UIEdgeInsetsMake(50, 50, 50, 50)
        
        let v3 = UIView()
        v3.backgroundColor = UIColor.randomColor()
        v2.addSubview(v3)
        v3.Width == v2.Width * 0.2
        v3.Width == v3.Height
        v3.Center === CGPointMake(0, 0)
    }
    
    func demo1() {
        view.backgroundColor = UIColor.randomColor()
        var outView = view
        var innerView: UIView?
        
        let rt = UIScreen.mainScreen().bounds
        let count = Int(rt.size.width - 2) / 20
        
        for _ in 1...count {
            innerView = UIView()
            innerView!.backgroundColor = UIColor.randomColor()
            outView.addSubview(innerView!)
            
            innerView!.Inset === UIEdgeInsetsMake(10, 10, 10, 10)
            
            outView = innerView!
        }
    }
    
    func demo2() {
        let vCenter = UIView()
        vCenter.backgroundColor = UIColor.randomColor()
        view.addSubview(vCenter)
        vCenter.Width == view.Width * 0.4
        vCenter.Height == vCenter.Width
        vCenter.Center === CGPointMake(0, 0)
        
        let vTopLeft = UIView()
        vTopLeft.backgroundColor = UIColor.randomColor()
        view.addSubview(vTopLeft)
        vTopLeft.Top == view.Top
        vTopLeft.Left == view.Left
        vTopLeft.Right == vCenter.Left
        vTopLeft.Bottom == vCenter.Top
        
        let vTopRight = UIView()
        vTopRight.backgroundColor = UIColor.randomColor()
        view.addSubview(vTopRight)
        vTopRight.Top == view.Top
        vTopRight.Right == view.Right
        vTopRight.Left == vCenter.Right
        vTopRight.Bottom == vCenter.Top
        
        let vBottomLeft = UIView()
        vBottomLeft.backgroundColor = UIColor.randomColor()
        view.addSubview(vBottomLeft)
        vBottomLeft.Bottom == view.Bottom
        vBottomLeft.Left == view.Left
        vBottomLeft.Right == vCenter.Left
        vBottomLeft.Top == vCenter.Bottom
        
        let vBottomRight = UIView()
        vBottomRight.backgroundColor = UIColor.randomColor()
        view.addSubview(vBottomRight)
        vBottomRight.Bottom == view.Bottom
        vBottomRight.Right == view.Right
        vBottomRight.Left == vCenter.Right
        vBottomRight.Top == vCenter.Bottom
        
    }
    
    func demo3() {
        let v = UIView()
        v.backgroundColor = UIColor.randomColor()
        view.addSubview(v)
        v.Size === CGSizeMake(200, 200)
        v.Center === CGPointMake(0, 0)
        
        let v1 = UIView()
        v1.backgroundColor = UIColor.randomColor()
        v.addSubview(v1)
        v1.Size === CGSizeMake(100, 100)
        v1.Center === CGPointMake(0, 0)
    }
}

