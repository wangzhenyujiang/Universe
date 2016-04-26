//
//  MenuListView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

private let indexCellIdentifier: String = "indexCellIdentifier"

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
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(indexCellIdentifier)!
        cell.imageView?.image = menuItemsList[indexPath.row].image
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let action = menuItemsList[indexPath.row].clickAction else { return }
        action()
    }
}
