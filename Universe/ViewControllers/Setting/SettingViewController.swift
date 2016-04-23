//
//  SettingViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/27.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var height: CGFloat = 44.0
//    CGColorCreateGenericRGB(0, 0.02, 0.03, 1)
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        commonSetup()
        
    }
    
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

//MARK: IBAction

extension SettingViewController {
    
    @IBAction private func disAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

//MARK: Private

extension SettingViewController {
    private func commonSetup() {
        tableView.backgroundColor = UIColor.clearColor()
        tableView.tableFooterView = UIView()
        navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 0.02, blue: 0.03, alpha: 1)
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource

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
