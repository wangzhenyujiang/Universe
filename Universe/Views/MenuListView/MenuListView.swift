//
//  MenuListView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class MenuListView: UIView {
    var tableView: UITableView
    var menuItemsList: [MenuListItemType] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        tableView = UITableView.init(frame: CGRectMake(0, 0, frame.size.width, frame.size.height), style: UITableViewStyle.Plain)
        super.init(frame: frame)
        
        tableView.registerNib(UINib.init(nibName: String(MenuListCell), bundle: nil), forCellReuseIdentifier: String(MenuListCell))
        
        tableView.delegate = self
        tableView.dataSource = self
                
        tableView.scrollEnabled = false
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.backgroundView = nil
        
        addSubview(tableView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Public 

extension MenuListView {
    func addMenuItem(item: MenuListItemType) {
        menuItemsList.append(item)
    }
}

//MARK: UITableViewDelegate, UITableviewDataSource

extension MenuListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemsList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MenuListCell = tableView.dequeueReusableCellWithIdentifier(String(MenuListCell), forIndexPath: indexPath) as! MenuListCell
        cell.setData(menuItemsList[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let action = menuItemsList[indexPath.row].clickAction else { return }
        action()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return menuItemCellHeight
    }
}
