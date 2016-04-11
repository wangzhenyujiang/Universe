//
//  GiveUpViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/11.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class GiveUpViewController: BaseViewController {
    var timming: TimeType?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

//MARK: IBAction

extension GiveUpViewController {
    
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
