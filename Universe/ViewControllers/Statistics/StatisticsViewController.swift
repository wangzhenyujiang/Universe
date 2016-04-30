//
//  StatisticsViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/11.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit
import PNChart

// 统计 ViewController
class StatisticsViewController: BlackNavigationBarViewController  {

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setCustomTitle("Starry Sky")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//MARK: Private

extension StatisticsViewController {

}

//MARK: IBAction

extension StatisticsViewController {
    
    @IBAction func dismissAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

