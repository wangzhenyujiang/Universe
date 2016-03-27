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
        
        guard let navigationController = navigationController else {
            return
        }
        
        navigationController.navigationBar.backgroundColor = nil
        navigationController.navigationBar.translucent = true
        navigationController.navigationBar.shadowImage = nil
        navigationController.navigationBar.barStyle = UIBarStyle.Default
        navigationController.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        
        navigationController.navigationBar.tintColor = nil
        
        if navigationController.navigationBarHidden {
            navigationController.setNavigationBarHidden(false, animated: true)
        }
    }
}
