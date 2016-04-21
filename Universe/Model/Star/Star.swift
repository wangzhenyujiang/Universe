//
//  Star.swift
//  Universe
//
//  Created by 王振宇 on 16/3/27.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation


protocol StarTypeProtocol {
    var imageName: String { get }
    var lockImageName: String { get }
    var chineseName: String { get }
    var starType: StarType { get }
    
}

extension StarTypeProtocol where Self: Hashable {
    
}

func == (lhs: StarTypeProtocol, rhs: StarTypeProtocol) -> Bool {
    return lhs.imageName.hashValue == rhs.imageName.hashValue
}



struct CloverStar: StarTypeProtocol {
    
    let starType: StarType = StarType.CloverStar
    
    var imageName: String {
        return "cake_star"
    }
    var lockImageName: String {
        return "planet5"
    }
    var chineseName: String {
        return "蛋糕星球"
    }
}

struct SunStar: StarTypeProtocol {
    
    let starType: StarType = StarType.CloverStar
    
    var imageName: String {
        return "cake_star"
    }
    var lockImageName: String {
        return "planet5"
    }
    var chineseName: String {
        return "蛋糕星球"
    }
}

struct RoseStar: StarTypeProtocol {
    
    let starType: StarType = StarType.CloverStar
    
    var imageName: String {
        return "cake_star"
    }
    var lockImageName: String {
        return "planet5"
    }
    var chineseName: String {
        return "蛋糕星球"
    }
}

struct NormalStar: StarTypeProtocol {
    
    let starType: StarType = StarType.CloverStar
    
    var imageName: String {
        return "cake_star"
    }
    var lockImageName: String {
        return "planet5"
    }
    var chineseName: String {
        return "蛋糕星球"
    }
}

struct JupiterStar: StarTypeProtocol {
    
    let starType: StarType = StarType.CloverStar
    
    var imageName: String {
        return "cake_star"
    }
    var lockImageName: String {
        return "planet5"
    }
    var chineseName: String {
        return "蛋糕星球"
    }
}


enum StarType: String {
    case CakeStar         // 蛋糕星球
    case CloverStar       // 三叶草星球
    case JupiterStar      // 木星
    case NormalStar       // 普通星球
    case RoseStar         // 玫瑰星球
    case SunStar          // 太阳
    
    var imageName: String {
        switch self {
        case .CakeStar:
            return "cake_star"
        case .CloverStar:
            return "clover_star"
        case .JupiterStar:
            return "jupiter_star"
        case .NormalStar:
            return "normal_star"
        case .SunStar:
            return "sun_star"
        case .RoseStar:
            return "rose_star"
        }
    }
    
    var lockImageName: String {
        switch self {
        case .CakeStar:
            return "planet5"
        case .CloverStar:
            return "planet2"
        case .JupiterStar:
            return "planet6"
        case .NormalStar:
            return "planet1"
        case .SunStar:
            return "planet4"
        case .RoseStar:
            return "planet3"
        }
        
    }
    
    var chineseName: String {
        switch self {
        case .CakeStar:
            return "蛋糕星球"
        case .CloverStar:
            return "三叶草星球"
        case .JupiterStar:
            return "木星"
        case .NormalStar:
            return "普通星球"
        case .SunStar:
            return "太阳"
        case .RoseStar:
            return "玫瑰星球"
        }
    }
    
    static var values: Array<StarType> {
        return [StarType.NormalStar, StarType.CloverStar, StarType.RoseStar, StarType.SunStar, StarType.CakeStar, StarType.JupiterStar]
    }
}


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

