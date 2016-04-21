//
//  TimeType.swift
//  Universe
//
//  Created by 王振宇 on 16/4/7.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation

protocol TimeCountType {
    var time: Double { get }
    var viewPointArr: [ViewPoint] { get }
    var corner_arr: [(CGFloat, CGFloat)] { get }
    var backImageName: String { get }
    var maskImageName: String { get }
}


enum TimeType {
    case Half
    case One
    case OneHalf
    case Two
    case TwoHalf
    case Three
    
    var time: Double {
        switch self {
        case .Half:
            return Half_Hour
        case .One:
            return 2 * Half_Hour
        case .OneHalf:
            return 3 * Half_Hour
        case .Two:
            return 4 * Half_Hour
        case .TwoHalf:
            return 5 * Half_Hour
        case .Three:
            return 6 * Half_Hour
        }
    }
    
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
    
    var corner_arr: [(CGFloat, CGFloat)] {
        switch self {
        case .Half:
            return hour_half_arr
        case .One:
            return hour_one_arr
        case .OneHalf:
            return hour_oneAndHalf_arr
        case .Two:
            return hour_two_arr
        case .TwoHalf:
            return hour_twoAndHalf_arr
        case .Three:
            return hour_three_arr
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
            return "hour_half_hard_fill"
        case .One:
            return "hour_one_hard_fill"
        case .OneHalf:
            return "hour_oneandhalf_hard_fill"
        case .Two:
            return "hour_two_hard_fill"
        case .TwoHalf:
            return "hour_twoandhalf_hard_fill"
        case .Three:
            return "hour_three_hard_fill"
        }
    }
    
    var failImageName: String {
        switch self {
        case .Half:
            return "hour_half_fail"
        case .One:
            return "hour_one_fail"
        case .OneHalf:
            return "hour_oneandhalf_fail"
        case .Two:
            return "hour_two_fail"
        case .TwoHalf:
            return "hour_twoandhalf_fail"
        case .Three:
            return "hour_three_fail"
        }
    }
    
}