//
//  HKConstraint.swift
//  HKLayoutKit
//
//  Created by heke on 16/9/9.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

class HKConstraint {
    var item: UIView?
    var toItem: UIView?
    var commonParentView: UIView?
    var constraint: NSLayoutConstraint?
    
    func uninstall() {
        if constraint != nil {
            commonParentView?.removeConstraint(constraint!)
        }
    }
    
    func updateConstant(newVlaue: CGFloat) {
        if constraint != nil {
            constraint!.constant = newVlaue
        }
    }
}