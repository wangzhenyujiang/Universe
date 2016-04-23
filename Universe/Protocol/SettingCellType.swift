//
//  SettingCellModel.swift
//  Universe
//
//  Created by 王振宇 on 16/4/23.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

protocol SettingCellModelType {
    var title: String { get set }
    var switchOn: Bool { get set }
}

protocol SettingCellType {
    
}

extension SettingCellType {
    func titleLabelTextColor() -> UIColor {
        return UIColor.whiteColor()
    }
    
    func switchColor() -> UIColor {
        return UIColor(red: 0, green: 0.31, blue: 0.37, alpha: 1)
    }
}

