//
//  SettingCellModel.swift
//  Universe
//
//  Created by 王振宇 on 16/4/23.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class SettingCellModel: NSObject {
    var title: String
    var switchOn: Bool
    
    init(title: String, switchOn: Bool) {
        self.title = title
        self.switchOn = switchOn
        super.init()
    }
    
}

//MARK: SettingCellModelType

extension SettingCellModel: SettingCellModelType {
    
}

//MARK: SettingCellType

extension SettingCellModel: SettingCellType {
    
}
