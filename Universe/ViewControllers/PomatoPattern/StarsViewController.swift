//
//  StarsViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

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
        return [StarType.CakeStar, StarType.CloverStar, StarType.JupiterStar, StarType.NormalStar, StarType.RoseStar, StarType.SunStar]
    }
}

class StarsViewController: UIViewController {
    @IBOutlet var starViews: [StarView]!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        setupStarViews()
    }
    
    
    private func setupStarViews() {
        for(index, starView) in starViews.enumerate() {
            starView.star = StarType.values[index]
            starView.clickAction = { [weak self ] star in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.starViewClickAction(star)
            }
        }
    }
    
    private func starViewClickAction(star: StarType?) {
        guard let star = star else {
            return
        }
        
        switch star {
        case .SunStar:
            if canUnLock(Star(star: star)) {
                
            }
        case .RoseStar:
            if canUnLock(Star(star: star)) {
                
            }
        case .NormalStar:
            if canUnLock(Star(star: star)) {
                
            }
        case .JupiterStar:
            if canUnLock(Star(star: star)) {
                
            }
        case .CloverStar:
            if canUnLock(Star(star: star)) {
                
            }
        case .CakeStar:
            if canUnLock(Star(star: star)) {
                
            }
        }
    }
    
    func canUnLock(star: Star) -> Bool {
        return User.shareInstance.gold >= star.gold
    }
}

//MARK: IBAction

extension StarsViewController {
    
    @IBAction func backAction(sender: AnyObject) {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.popViewControllerAnimated(true)
    }
}
