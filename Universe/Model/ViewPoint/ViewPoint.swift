//
//  ViewPoint.swift
//  Universe
//
//  Created by mazingwang on 16/4/7.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation

enum  PointSizeType {
    case Big
    case Small
    
    var Radius: CGFloat {
        switch self {
        case .Big:
            return 12.0
        default:
            return 4.0
        }
    }
}

struct ViewPoint: ViewPointType {
    var sizeType: PointSizeType
    var point: (CGFloat, CGFloat)
}


var c = ViewPoint(sizeType: .Big, point: (161.0, 28.0))