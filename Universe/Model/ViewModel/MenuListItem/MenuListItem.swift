//
//  MenuListItem.swift
//  Universe
//
//  Created by 王振宇 on 16/4/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class MenuListItem: NSObject {
    var image: UIImage
    var clickAction: (() -> ())?
    
    init(image: UIImage, action: (()->())? = nil) {
        self.image = image
        self.clickAction = action
        super.init()
    }
}

//MARK: MenuListItemType

extension MenuListItem: MenuListItemType {
    
}
