//
//  HKLayoutOperators.swift
//  HKLayoutKit
//
//  Created by heke on 16/9/5.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit
/**
 viewA.x [ == | <= | >= | === ] m * viewB.y [ + | - ] n
 */

/**
 leftOp:must be an attribute
 rightOp:an attribute or purevalue
 view.x == a * someView.x +c
 */
func == (leftOp: HKLayoutDescription, rightOp: HKLayoutable) ->HKConstraint? {

    leftOp.relation = NSLayoutRelation.Equal
    return HKLayoutMaker.createLayout(leftOp, rightOp: rightOp)
}

/**
 leftOp:must be an attribute
 rightOp:an attribute or purevalue
 view.x <= a * someView.x +c
 */
func <= (leftOp: HKLayoutDescription, rightOp: HKLayoutable) ->HKConstraint? {
    
    leftOp.relation = NSLayoutRelation.LessThanOrEqual
    return HKLayoutMaker.createLayout(leftOp, rightOp: rightOp)
}

/**
 leftOp:must be an attribute
 rightOp:an attribute or purevalue
 view.x >= a * someView.x +c
 */
func >= (leftOp: HKLayoutDescription, rightOp: HKLayoutable) ->HKConstraint? {
    
    leftOp.relation = NSLayoutRelation.GreaterThanOrEqual
    return HKLayoutMaker.createLayout(leftOp, rightOp: rightOp)
}

//MARK: *
/**
 leftOp:an attribute or purevalue
 rightOp:must be an attribute
 
 A * view.attribute
 */
func * (leftOp: HKLayoutable, rightOp: HKLayoutDescription) ->HKLayoutDescription {
    rightOp.multiplier = leftOp.layoutValue
    return rightOp
}

/**
 leftOp:must be an attribute
 rightOp:an attribute or purevalue
 
 view.attribute * A
 */
func * (leftOp: HKLayoutDescription, rightOp: HKLayoutable) ->HKLayoutDescription {
    leftOp.multiplier = rightOp.layoutValue
    return leftOp
}

//MARK: +
/**
 leftOp:must be an attribute
 rightOp:an attribute or purevalue
 
 A * view.attribute + B
 */
func + (leftOp: HKLayoutDescription, rightOp: HKLayoutable) ->HKLayoutable {
    leftOp.constValue = rightOp.layoutValue
    return leftOp
}

/**
 leftOp:must be an attribute
 rightOp:an attribute or purevalue
 
 B + A * view.attribute
 */
func + (leftOp: HKLayoutable, rightOp: HKLayoutDescription) ->HKLayoutable {
    rightOp.constValue = leftOp.layoutValue
    return rightOp
}

//MARK: -
/**
 leftOp:must be an attribute
 rightOp:an attribute or purevalue
 
 A * view.attribute - B
 */
func - (leftOp: HKLayoutDescription, rightOp: HKLayoutable) ->HKLayoutable {
    leftOp.constValue = rightOp.layoutValue * -1
    return leftOp
}

//MARK: Custom
/**
    此方法用于一次设定多属性进行布局
 view.Origin === CGPointMake(x,y)
 view.Center === CGPointMake(x,y)
 view.Size   === CGSizeMake(x,y)
 view.Inset  === UIEdgeInsetMake(a,b,c,d)
 */
func === (leftOp: HKLayoutDescription, rightOp: HKLayoutable) ->[HKConstraint]? {
    
    var constraints = [HKConstraint]()
    
    if leftOp.attribute == HKLayoutAttribute.Origin { //origin
        
        if rightOp.valueType != ValueType.pointValue {
            return constraints
        }
        
        var ct: HKConstraint?
        let point = rightOp as! CGPoint
        ct = leftOp.itemView!.Top == leftOp.itemView!.superview!.Top + point.y
        if ct != nil {
            constraints.append(ct!)
        }
        
        ct = leftOp.itemView!.Left == leftOp.itemView!.superview!.Left + point.x
        if ct != nil {
            constraints.append(ct!)
        }
        
    }else if leftOp.attribute == HKLayoutAttribute.Center { //center
        
        if rightOp.valueType != ValueType.pointValue {
            return constraints
        }
        var ct: HKConstraint?
        let point = rightOp as! CGPoint
        ct = leftOp.itemView!.CenterY == leftOp.itemView!.superview!.CenterY + point.y
        if ct != nil {
            constraints.append(ct!)
        }
        
        ct = leftOp.itemView!.CenterX == leftOp.itemView!.superview!.CenterX + point.x
        if ct != nil {
            constraints.append(ct!)
        }
        
    }else if leftOp.attribute == HKLayoutAttribute.Size { //size
        
        if rightOp.valueType != ValueType.sizeValue {
            return constraints
        }
        var ct: HKConstraint?
        let point = rightOp as! CGSize
        ct = leftOp.itemView!.Width == point.width
        if ct != nil {
            constraints.append(ct!)
        }
        
        ct = leftOp.itemView!.Height == point.height
        if ct != nil {
            constraints.append(ct!)
        }
        
    }else if leftOp.attribute == HKLayoutAttribute.Inset { //inset
        
        if rightOp.valueType != ValueType.insetValue {
            return constraints
        }
        
        var ct: HKConstraint?
        let inset = rightOp as! UIEdgeInsets
        ct = leftOp.itemView!.Top == leftOp.itemView!.superview!.Top + inset.top
        if ct != nil {
            constraints.append(ct!)
        }

        ct = leftOp.itemView!.Left == leftOp.itemView!.superview!.Left + inset.left
        if ct != nil {
            constraints.append(ct!)
        }
        
        ct = leftOp.itemView!.Bottom == leftOp.itemView!.superview!.Bottom - inset.bottom
        if ct != nil {
            constraints.append(ct!)
        }
        
        ct = leftOp.itemView!.Right == leftOp.itemView!.superview!.Right - inset.right
        if ct != nil {
            constraints.append(ct!)
        }
        
    }else {
        print("此方法用于一次设定多属性进行布局")
    }

    return constraints
}
