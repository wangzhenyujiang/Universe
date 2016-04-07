//
//  TimeType.swift
//  Universe
//
//  Created by 王振宇 on 16/4/7.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation


enum TimeType {
    case Half
    case One
    case OneHalf
    case Two
    case TwoHalf
    case Three
    
    var viewPointArr: [ViewPoint] {
        switch self {
        case .Half:
            return hour_half_point_arr
        case .One:
            return hour_one_point_arr
        case .OneHalf:
            return hour_oneAndHalf_point_arr
        case .Two:
            return hour_two_point_arr
        case .TwoHalf:
            return hour_twoAndHalf_point_arr
        case .Three:
            return hour_three_point_arr
        }
    }
    
}