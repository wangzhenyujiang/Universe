//
//  BaseViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        view.layer.contents = UIImage.backgroundImage().CGImage
        automaticallyAdjustsScrollViewInsets = false
        
        let titleView = UIView(frame: CGRectMake(0, 0, 100, 64))
        titleView.backgroundColor = UIColor.clearColor()
        navigationItem.titleView = titleView
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}