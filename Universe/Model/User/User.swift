//
//  User.swift
//  Universe
//
//  Created by 王振宇 on 16/3/27.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class User: NSObject {
    static let shareInstance: User = User()
    
    var gold: Int = {
    
        return 0
    }()
}
