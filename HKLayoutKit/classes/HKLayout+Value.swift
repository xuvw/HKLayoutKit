//
//  HKLayout+Value.swift
//  HKLayoutKit
//
//  Created by heke on 16/9/6.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat: HKLayoutable {
    var layoutValue: CGFloat {
        return self
    }
    var valueType: ValueType {
        return ValueType.pureValue
    }
}

extension Double: HKLayoutable {
    var layoutValue: CGFloat {
        return CGFloat(self)
    }
    var valueType: ValueType {
        return ValueType.pureValue
    }
}

extension Int: HKLayoutable {
    var layoutValue: CGFloat {
        return CGFloat(self)
    }
    var valueType: ValueType {
        return ValueType.pureValue
    }
}

//MARK: custom
extension CGSize: HKLayoutable {
    var layoutValue: CGFloat {
        return CGFloat(0)
    }
    var valueType: ValueType {
        return ValueType.sizeValue
    }
}

extension CGPoint: HKLayoutable {
    var layoutValue: CGFloat {
        return CGFloat(0)
    }
    var valueType: ValueType {
        return ValueType.pointValue
    }
}

extension UIEdgeInsets: HKLayoutable {
    var layoutValue: CGFloat {
        return CGFloat(0)
    }
    var valueType: ValueType {
        return ValueType.insetValue
    }
}