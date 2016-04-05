//
//  Star.swift
//  Universe
//
//  Created by 王振宇 on 16/3/27.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation

struct Star: Hashable {
    let starType: StarType
    let gold: Int
    
    var index: Int = 0
    
    var chineseNmae: String {
        return starType.chineseName
    }
    
    var hashValue: Int {
        get {
            return starType.imageName.hashValue
        }
    }
    
    init(star: StarType, gold: Int) {
        self.starType = star
        self.gold = gold
    }
    
    init(star: StarType) {
        self.init(star: star, gold: 500)
    }
}

func ==(lhs: Star, rhs: Star) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

