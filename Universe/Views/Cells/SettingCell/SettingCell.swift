//
//  SettingCell.swift
//  Universe
//
//  Created by 王振宇 on 16/3/27.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class SettingCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clearColor()
        contentView.backgroundColor = UIColor.clearColor()
        selectionStyle = UITableViewCellSelectionStyle.None
    }
}

//MARK: Public

extension SettingCell {
    func setData<T: protocol <SettingCellModelType, SettingCellType>>(data: T) {
        titleLabel.text = data.title
        settingSwitch.on = data.switchOn
        
        titleLabel.textColor = data.titleLabelTextColor()
        settingSwitch.onTintColor = data.switchColor()
    }
}
