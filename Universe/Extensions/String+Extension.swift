//
//  String+Extension.swift
//  Universe
//
//  Created by 王振宇 on 16/4/30.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation


extension String {
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.startIndex.advancedBy(r.startIndex)
            let endIndex = self.startIndex.advancedBy(r.endIndex)
            return self[startIndex ..< endIndex]
        }
    }
}