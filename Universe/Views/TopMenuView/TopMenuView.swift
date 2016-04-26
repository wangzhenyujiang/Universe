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
}

//MARK: Private

extension TopMenuView {
    private func setupMenuItemList() {
        let item1: MenuListItem = MenuListItem.init(image: UIImage(named: "statistics_menu_key")!) {
            //show 统计 view controller
            print("show 统计 view controller")
        }
        let item2: MenuListItem = MenuListItem.init(image: UIImage(named: "setting_menu_key")!) {
            //show 设置 view controller
            print("show 设置 view controller")
        }
        menuListItems = [item1, item2]
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