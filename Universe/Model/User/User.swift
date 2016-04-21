//
//  User.swift
//  Universe
//
//  Created by 王振宇 on 16/3/27.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class User: NSObject {
    static let shareInstance: User = User()
    
    var gold: Int = {
        return GoldNumMemoryManager.shareInstance.gold
    }()
    
    override init() {
        super.init()
    }
    
    func addNum(addNum: Int) {
        updateGoldNum(gold + addNum)
    }
    
    func subtractNum(subNum: Int) {
        updateGoldNum(gold - subNum)
    }
    
    private func updateGoldNum(goldNum: Int) {
        if goldNum < 0 {
            return
        }
        GoldNumMemoryManager.shareInstance.gold = goldNum
    }
}
