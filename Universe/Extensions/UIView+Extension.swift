//
//  UIView+Extension.swift
//  Universe
//
//  Created by 王振宇 on 16/4/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation

extension UIView {
    func viewController() -> UIViewController? {
        var next: UIResponder? = nextResponder()
        while next != nil {
            if next is UIViewController {
                return next as? UIViewController
            }
            next = next?.nextResponder()
        }
        return nil
    }
}