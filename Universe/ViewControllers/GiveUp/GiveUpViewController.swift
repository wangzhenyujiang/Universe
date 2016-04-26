//
//  GiveUpViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/11.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class GiveUpViewController: BaseViewController, OwnsTopMenuViewType, SetMenuListItemsAble {
    var timming: TimeType?
    
    @IBOutlet weak var topMenuView: TopMenuView!
    @IBOutlet weak var failImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopMenuView()
        setTopMenuItemList()
        
        guard let time = timming else { return }
        failImageView.image = UIImage(named: time.failImageName)
    }
}

//MARK: Private

extension GiveUpViewController {
    
}

//MARK: IBAction

extension GiveUpViewController {
    
    @IBAction func backAction(sender: AnyObject) {
        let controllers = navigationController?.viewControllers.filter { controller in return controller is StartViewController}
        navigationController?.popToViewController(controllers!.first!, animated: true)
    }
}


