//
//  MenuListView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class MenuListView: UIView {
    private var tableView: UITableView
    
    var menuItemsList: [MenuListItemType] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        super.init(frame: frame)
        
        tableView.registerNib(UINib.init(nibName: String(MenuListCell), bundle: nil), forCellReuseIdentifier: String(MenuListCell))
        tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView?.backgroundColor = UIColor.clearColor()
        backgroundColor = UIColor.clearColor()
        
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
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        guard let action = menuItemsList[indexPath.row].clickAction else { return }
        action()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return menuItemCellHeight
    }
}
