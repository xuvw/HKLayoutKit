//
//  UIView+HKLayoutExts.swift
//  HKLayoutKit
//
//  Created by heke on 16/9/6.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

enum HKLayoutAttribute: Int{
    case Top
    case Left
    case Bottom
    case Right
    
    case Leading
    case Trailing
    
    case Width
    case Height
    
    case CenterX
    case CenterY
    
    case Baseline
    
    case NotAnAttribute
    
    //ext
    case Size
    
    case Center
    
    case Origin
    
    case Inset
    
    func layoutAttribute() ->NSLayoutAttribute {
        
        switch self {
        case .Top:
            return NSLayoutAttribute.Top
        case .Left:
            return NSLayoutAttribute.Left
        case .Bottom:
            return NSLayoutAttribute.Bottom
        case .Right:
            return NSLayoutAttribute.Right
            
        case .Leading:
            return NSLayoutAttribute.Leading
        case .Trailing:
            return NSLayoutAttribute.Trailing
            
        case .Width:
            return NSLayoutAttribute.Width
        case .Height:
            return NSLayoutAttribute.Height
            
        case .CenterX:
            return NSLayoutAttribute.CenterX
        case .CenterY:
            return NSLayoutAttribute.CenterY
            
        case .Baseline:
            return NSLayoutAttribute.Baseline
            
        case .NotAnAttribute:
            return NSLayoutAttribute.NotAnAttribute
        default:
            return NSLayoutAttribute.NotAnAttribute
        }
    }
}

class HKLayoutDescription: HKLayoutable {
    
    //MARK: Public
    var attribute = HKLayoutAttribute.NotAnAttribute
    var relation = NSLayoutRelation.Equal
    
    var itemView: UIView? {
        didSet{
            itemView?.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    var multiplier: CGFloat = 1
    var constValue: CGFloat = 0
    var layoutPriority: UILayoutPriority = UILayoutPriorityRequired
    
    //MARK: Private
    var layoutValue: CGFloat = 0
    var valueType: ValueType = ValueType.Attribute
}

extension UIView {
    var Top: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Top
        item.itemView = self
        return item
    }
    
    var Left: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Left
        item.itemView = self
        return item
    }
    
    var Bottom: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Bottom
        item.itemView = self
        return item
    }
    
    var Right: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Right
        item.itemView = self
        return item
    }
    
    var Leading: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Leading
        item.itemView = self
        return item
    }
    
    var Trailing: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Trailing
        item.itemView = self
        return item
    }
    
    var Width: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Width
        item.itemView = self
        return item
    }
    
    var Height: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Height
        item.itemView = self
        return item
    }
    
    var CenterX: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.CenterX
        item.itemView = self
        return item
    }
    
    var CenterY: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.CenterY
        item.itemView = self
        return item
    }
    
    var Baseline: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Baseline
        item.itemView = self
        return item
    }
    
    //MARK: custom
    var Size: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Size
        item.itemView = self
        return item
    }
    
    var Center: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Center
        item.itemView = self
        return item
    }
    
    var Origin: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Origin
        item.itemView = self
        return item
    }
    
    var Inset: HKLayoutDescription {
        let item = HKLayoutDescription()
        item.attribute = HKLayoutAttribute.Inset
        item.itemView = self
        return item
    }
}