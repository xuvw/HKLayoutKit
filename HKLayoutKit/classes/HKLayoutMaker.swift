//
//  HKLayoutMaker.swift
//  HKLayoutKit
//
//  Created by heke on 16/9/7.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

class HKLayoutMaker {
    
    /**
     生成约束、使用约束、返回约束
     */
    class func createLayout(leftOp: HKLayoutDescription, rightOp: HKLayoutable) ->HKConstraint? {
        
        let item = leftOp.itemView!
        let itemAttribute = leftOp.attribute
        
        let relation = leftOp.relation
        
        var toItem: UIView? = nil
        var toItemAttribute = NSLayoutAttribute.NotAnAttribute
        var multiplier: CGFloat = 1
        var constant: CGFloat = 0
        
        let ct = HKConstraint()
        ct.item = item
        
        if rightOp is HKLayoutDescription {
            let desc = rightOp as! HKLayoutDescription
            toItem = desc.itemView!
            ct.toItem = toItem
            toItemAttribute = desc.attribute.layoutAttribute()
            multiplier = desc.multiplier
            constant = desc.constValue
        }else {
            constant = rightOp.layoutValue
        }
        
        
        let constraint = NSLayoutConstraint(item:       item,
                                            attribute:  itemAttribute.layoutAttribute(),
                                            relatedBy:  relation,
                                            toItem:     toItem,
                                            attribute:  toItemAttribute,
                                            multiplier: multiplier,
                                            constant:   constant)
        
        if rightOp is HKLayoutDescription {
            
            let commonParentView = HKLayoutMaker.commonParentView(item, toView: toItem)
            
            if commonParentView != nil {
                commonParentView?.addConstraint(constraint)
            }else {
                //print error info
            }
            ct.commonParentView = commonParentView
        }else {
            
            item.addConstraint(constraint)
        }
        ct.constraint = constraint
        
        return ct
    }
    
    class func commonParentView(fromView: UIView?, toView: UIView?) -> UIView? {
        
        var views = Set<UIView>()
        var fromView = fromView
        var toView = toView
        
        repeat {
            if let view = toView {
                if views.contains(view) {
                    return view
                }
                views.insert(view)
                toView = view.superview
            }
            if let view = fromView {
                if views.contains(view) {
                    return view
                }
                views.insert(view)
                fromView = view.superview
            }
        } while (fromView != nil || toView != nil)
        
        return nil
    }
}