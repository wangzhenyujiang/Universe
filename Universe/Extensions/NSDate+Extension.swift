//
//  NSDate+Extension.swift
//  Universe
//
//  Created by 王振宇 on 16/4/30.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation

extension NSDate {
    
    public var monthPrefixName: String {
        return monthName[0...2]
    }
}