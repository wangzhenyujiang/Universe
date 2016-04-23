//
//  LabelCell.swift
//  Universe
//
//  Created by 王振宇 on 16/4/23.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clearColor()
        contentView.backgroundColor = UIColor.clearColor()
        titleLabel.textColor = UIColor.whiteColor()
    }
}

//MARK: Public

extension LabelCell {
    func setData(data: String) {
        titleLabel.text = data
    }
}
