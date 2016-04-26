//
//  MenuListCell.swift
//  Universe
//
//  Created by 王振宇 on 16/4/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class MenuListCell: UITableViewCell {

    @IBOutlet weak var logoImageView: UIImageView!
    
    override func awakeFromNib() {
        backgroundColor = UIColor.clearColor()
        contentView.backgroundColor = UIColor.redColor()
    }
    
    func setData(data: MenuListItemType) {
        logoImageView.image = data.image
    }
}
