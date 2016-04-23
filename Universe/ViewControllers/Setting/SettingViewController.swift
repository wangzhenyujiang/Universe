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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        commonSetup()
        
    }
    
    private let settingModelArr: [SettingCellModel] = [
                                SettingCellModel(title: "统计", switchOn: true),
                                SettingCellModel(title: "工具设置", switchOn: true)
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
        
        let label = UILabel(frame: navigationItem.titleView!.bounds)
        label.textColor = UIColor.whiteColor()
        label.text = "Settings"
        label.font = UIFont(name:"HelveticaNeue", size: 17)!
        label.textAlignment = NSTextAlignment.Center
        navigationItem.titleView!.addSubview(label)
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 0.02, blue: 0.03, alpha: 1)
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingModelArr.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: SettingCell = tableView.dequeueReusableCellWithIdentifier(String(SettingCell)) as! SettingCell
        cell.setData(settingModelArr[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
}

