//
//  OwnsTopMenuViewType.swift
//  Universe
//
//  Created by 王振宇 on 16/4/20.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

protocol OwnsTopMenuViewType: class {
    var topMenuView: TopMenuView! { get set }
}

extension OwnsTopMenuViewType  where Self: UIViewController {
    func setupTopMenuView() {
        topMenuView.update()
        topMenuView.menuAction = {
            print("does nothing")
        }
    }
}
