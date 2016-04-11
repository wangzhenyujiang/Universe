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

class StarsViewController: BaseViewController {
    @IBOutlet var starViews: [StarView]!
    @IBOutlet weak var goldNumLabel: UILabel!
    
    private var customNavigationBar: UINavigationBar!
    
    private var customNavigationItem: UINavigationItem = UINavigationItem(title: " ")
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        setupStarViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        goldNumLabel.text = "\(User.shareInstance.gold)"
    }
    
    
    private func setupStarViews() {
        for(index, starView) in starViews.enumerate() {
            starView.star = StarType.values[index]
            starView.lockImageView.image = UIImage(named: StarType.values[index].lockImageName)!
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
        if !canUnLock(Star(star: star)) {
            
            return
        }
        
        switch star {
        case .SunStar:
            print("\(star.chineseName)")
            LockAlterView.show(star.imageName)
        case .RoseStar:
            print("\(star.chineseName)")
            LockAlterView.show(star.imageName)
        case .NormalStar:
            print("\(star.chineseName)")
            performSegueWithIdentifier("startSegue", sender: nil)
        case .JupiterStar:
            print("\(star.chineseName)")
            LockAlterView.show(star.imageName)
        case .CloverStar:
            print("\(star.chineseName)")
            LockAlterView.show(star.imageName)
        case .CakeStar:
            print("\(star.chineseName)")
            LockAlterView.show(star.imageName)
        }
    }
    
    func canUnLock(star: Star) -> Bool {
        return User.shareInstance.gold >= star.gold
    }
}

extension StarsViewController {
   
}

//MARK: IBAction

extension StarsViewController {
    
    @IBAction func backAction(sender: AnyObject) {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func menuAction(sender: AnyObject) {
        
    }
}
