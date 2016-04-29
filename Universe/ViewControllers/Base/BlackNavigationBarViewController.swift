//
//  BlackNavigationBarViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/29.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class BlackNavigationBarViewController: BaseViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 0.02, blue: 0.03, alpha: 1)
    }
    
}

//MARK: Public 
extension BlackNavigationBarViewController{
    
    func setCustomTitle(title: String) {
        let titleView = UIView(frame: CGRectMake(0, 0, 100, 64))
        titleView.backgroundColor = UIColor.clearColor()
        navigationItem.titleView = titleView
        
        let label = UILabel(frame: navigationItem.titleView!.bounds)
        label.textColor = UIColor.whiteColor()
        label.text = title
        label.font = UIFont(name:"HelveticaNeue", size: 17)!
        label.textAlignment = NSTextAlignment.Center
        navigationItem.titleView!.addSubview(label)
    }
}