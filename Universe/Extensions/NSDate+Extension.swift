//
//  NSDate+Extension.swift
//  Universe
//
//  Created by 王振宇 on 16/4/30.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation

extension NSDate {
    
    public var monthEnglishPrefixName: String {
        switch month {
        case 1:
            return "Jan"
        case 2:
            return "Feb"
        case 3:
            return "Mar"
        case 4:
            return "Apr"
        case 5:
            return "May"
        case 6:
            return "Jun"
        case 7:
            return "Jul"
        case 8:
            return "Aug"
        case 9:
            return "Sept"
        case 10:
            return "Oct"
        case 11:
            return "Nov"
        case 12:
            return "Dec"
        default:
            return ""
        }
    }
}