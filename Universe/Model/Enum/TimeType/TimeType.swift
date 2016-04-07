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
    
    var backImageName: String {
        switch self {
        case .Half:
            return "hour_half_fill_back"
        case .One:
            return "hour_one_fill_back"
        case .OneHalf:
            return "hour_oneandhalf_fill_back"
        case .Two:
            return "hour_two_fill_back"
        case .TwoHalf:
            return "hour_twoandhalf_fill_back"
        case .Three:
            return "hour_three_fill_back"
        }
    }
    
    var maskImageName: String {
        switch self {
        case .Half:
            return "hour_half_fill"
        case .One:
            return "hour_one_fill"
        case .OneHalf:
            return "hour_oneandhalf_fill"
        case .Two:
            return "hour_two_fill"
        case .TwoHalf:
            return "hour_twoandhalf_fill"
        case .Three:
            return "hour_three_fill"
        }
    }
    
}