//
//  GoldNumManager.swift
//  Universe
//
//  Created by 王振宇 on 16/4/21.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class GoldNumMemoryManager: NSObject {
    static let shareInstance: GoldNumMemoryManager = GoldNumMemoryManager()
    var gold: Int {
        didSet {
            NSUserDefaults.standardUserDefaults().setInteger(gold, forKey: GoldNumKey.key)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
    private struct GoldNumKey {
        static let key = "GoldNumKey"
    }
    
    override init() {
        self.gold = NSUserDefaults.standardUserDefaults().integerForKey(GoldNumKey.key)
        if self.gold == 0 {
            self.gold = 500
        }
        super.init()
    }
    
}

//MARK: Public 

extension GoldNumMemoryManager {
    
}
