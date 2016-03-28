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
    
    struct UserGoldNumKey {
        static let key = "UserGoldNumKey"
    }
    
    var gold: Int = {
        var goldNum = NSUserDefaults.standardUserDefaults().integerForKey(UserGoldNumKey.key)
        return goldNum
    }()
    
    override init() {
        super.init()
    }
    
    private func addNum(addNum: Int) {
        updateGoldNum(gold + addNum)
    }
    
    private func subtractNum(subNum: Int) {
        updateGoldNum(gold - subNum)
    }
    
    private func updateGoldNum(var goldNum: Int) {
        if goldNum < 0 {
            goldNum = 0
        }
        NSUserDefaults.standardUserDefaults().setInteger(goldNum, forKey: UserGoldNumKey.key)
    }
}
