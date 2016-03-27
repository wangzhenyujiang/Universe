//
//  ViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/25.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}

