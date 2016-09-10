//
//  HKLayoutable.swift
//  HKLayoutKit
//
//  Created by heke on 16/9/5.
//  Copyright © 2016年 mhk. All rights reserved.
//

import Foundation
import UIKit

enum ValueType {
    case pureValue
    
    case sizeValue
    case pointValue
    case insetValue
    
    case Attribute
}

protocol HKLayoutable {
    var layoutValue: CGFloat { get }
    var valueType: ValueType { get }
}