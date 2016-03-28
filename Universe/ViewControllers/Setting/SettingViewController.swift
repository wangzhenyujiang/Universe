//
//  SettingViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/27.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var height: CGFloat = 44.0
    
    private let settingAnnotations:[[String: String]] = [
        [
            "name": "统计",
            "segue": "showStatistics"
        ],
        [
            "name": "工具设置",
            "segue": "configTool"
        ]
    ]
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingAnnotations.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(SettingCell)) as! SettingCell
        let annotation = settingAnnotations[indexPath.row]
        cell.titleLabel.text = annotation["name"]
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        if height == 44.0 {
//            height = 66.0
//        }else {
//            height = 44.0
//        }
//        UIView.animateWithDuration(1.0) { 
//            tableView.beginUpdates()
//            tableView.endUpdates()
//        }
    }
}
