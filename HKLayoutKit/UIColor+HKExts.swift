//
//  UIColor+HKExts.swift
//  HKLayoutKit
//
//  Created by heke on 16/9/10.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class func randomColor() ->UIColor {
        let r = CGFloat(arc4random()%256)
        let g = CGFloat(arc4random()%256)
        let b = CGFloat(1)//CGFloat(arc4random()%256)
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
}