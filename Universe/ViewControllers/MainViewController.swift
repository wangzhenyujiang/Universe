//
//  ViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/25.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        showLaunchFrameWithAnimation()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .Default
    }
    
    func showLaunchFrameWithAnimation() {
        let imageView = UIImageView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
        imageView.contentMode  = UIViewContentMode.ScaleToFill
        imageView.image = UIImage(named: "LaunchImage")
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.addSubview(imageView)
        
        UIView.animateWithDuration(2.5, animations: {
            imageView.alpha = 0
            imageView.transform = CGAffineTransformMakeScale(1.4, 1.4)
        }) { (finished) in
            imageView.removeFromSuperview()
        }
    }
}

