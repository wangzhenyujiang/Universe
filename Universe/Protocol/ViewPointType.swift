//
//  ViewPointType.swift
//  Universe
//
//  Created by mazingwang on 16/4/7.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation

protocol ViewPointType {
    var sizeType: PointSizeType {get set}
    var point: (CGFloat, CGFloat) {get set}
}

