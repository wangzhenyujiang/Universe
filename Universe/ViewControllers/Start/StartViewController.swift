//
//  StartViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/28.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class StartViewController: BaseViewController {

}

//MARK: IBAction

extension StartViewController {
    
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
