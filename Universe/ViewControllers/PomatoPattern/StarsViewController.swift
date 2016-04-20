//
//  StarsViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

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
