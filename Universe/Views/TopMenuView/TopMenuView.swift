//
//  TopMenuView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/9.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit
import Popover

class TopMenuView: UIView {
    
    private var view: UIView!
    var menuAction:(() -> ())?
    @IBOutlet private weak var goldLabel: UILabel!
    
    //ShowPopoverAble
    var popover: Popover!
    
    //ShowMenuListAble
    var menuListView: MenuListView!
    var menuListItems: [MenuListItemType] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        
        setupMenuItemList()
        setupMenuListView()
        
        self.menuAction = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showMenuPopoverAtPoint(CGPointMake(30, 70), view: strongSelf.menuListView)
            strongSelf.menuListView.tableView.backgroundColor = UIColor.clearColor()
            strongSelf.menuListView.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        }
        
        view =  NSBundle.mainBundle().loadNibNamed(String(TopMenuView), owner: self, options: nil).first as? UIView
        view.frame = CGRectMake(0, 0, ScreenWidth, 60)
        view.backgroundColor = UIColor.clearColor()
        backgroundColor = UIColor.clearColor()
        addSubview(view)
    }
}

//MARK: Public

extension TopMenuView {
    func update() {
        goldLabel.text = "\(GoldNumMemoryManager.shareInstance.gold)"
    }
    
    func setMenuListItems(items: [MenuListItemType]) {
        menuListView.menuItemsList = items
    }
}

//MARK: Private

extension TopMenuView {
    private func setupMenuItemList() {
        menuListItems = [statisticsMenuItem, settingMenuItem]
    }
}

//MARK: ShowMenuListAble

extension TopMenuView: ShowMenuListAble {
    
}

//MARK: IBAction

extension TopMenuView {
    @IBAction private func menuAction(sender: AnyObject) {
        guard let action = menuAction else { return }
        action()
    }
}