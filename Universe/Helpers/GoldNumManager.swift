//
//  GoldNumManager.swift
//  Universe
//
//  Created by 王振宇 on 16/4/21.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit
import Cache


class GoldNumMemoryManager: NSObject {
    static let shareInstance: GoldNumMemoryManager = GoldNumMemoryManager()
    var gold: Int {
        get {
            var result: Int = 0
            let lock: dispatch_semaphore_t = dispatch_semaphore_create(0)
            cache.object(GoldNumKey.key) { (str: String?) in
                guard let glodStr = str, let num = Int(glodStr) else {
                    dispatch_semaphore_signal(lock)
                    return
                }
                result = num
                dispatch_semaphore_signal(lock)
            }
            dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER)
            return result
        }
        set {
            cache.add(GoldNumKey.key, object: "\(gold)")
        }
    }
    
    private struct GoldNumKey {
        static let key = "GoldNumKey"
    }
}

