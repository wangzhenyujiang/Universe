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
    }
}