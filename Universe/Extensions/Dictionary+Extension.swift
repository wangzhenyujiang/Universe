//
//  Dictionary+Extension.swift
//  Universe
//
//  Created by mazingwang on 16/4/29.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation
import Cache

//extension Dictionary: Cachable{
//    public typealias CacheType = Dictionary
//    
//    public static func decode(data: NSData) -> CacheType? {
//        let dictionary = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? CacheType
//        return dictionary
//    }
//    
//    public func encode() -> NSData? {
//        return NSKeyedArchiver.archivedDataWithRootObject(self)
//    }
//}