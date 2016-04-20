//
//  GiveUpViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/11.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class GiveUpViewController: BaseViewController, OwnsTopMenuViewType {
    var timming: TimeType?
    
    @IBOutlet weak var topMenuView: TopMenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopMenuView()
    }
}

//MARK: IBAction

extension GiveUpViewController {
    
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}


