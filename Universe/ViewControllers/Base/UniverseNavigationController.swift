//
//  UniverseNavigationController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/11.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class UniverseNavigationController: UINavigationController {

    override func childViewControllerForStatusBarStyle() -> UIViewController? {
        return topViewController!
    }
}
