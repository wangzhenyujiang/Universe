//
//  SettingViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/27.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

private let CellHeight: CGFloat = 44.0
private let SectionHeight: CGFloat = 46.0

class SettingViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        commonSetup()
        
    }
    
    private let settingModelArr: [SettingCellModel] = [
                                SettingCellModel(title: "Notification", switchOn: true),
                                SettingCellModel(title: "Connet only on Wi-Fi", switchOn: false),
                                SettingCellModel(title: "Keep the screen on", switchOn: false),
                                SettingCellModel(title: "Work with phone", switchOn: true),
                                SettingCellModel(title: "Sound Effect", switchOn: false),
                                SettingCellModel(title: "Week start on Monday", switchOn: true)
                                ]
    
    private let accountTitleArr: [String] = ["Log in", "Sigin in", "Forgot password"]
    
    private let sectionTitles: [String] = ["ACCOUNT", "SETTINGS"]
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
        
        switch section {
        case 0:
            return accountTitleArr.count
        case 1:
            return settingModelArr.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell: LabelCell = tableView.dequeueReusableCellWithIdentifier(String(LabelCell)) as! LabelCell
            cell.setData(accountTitleArr[indexPath.row])
            return cell
        case 1:
            let cell: SettingCell = tableView.dequeueReusableCellWithIdentifier(String(SettingCell)) as! SettingCell
            cell.setData(settingModelArr[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CellHeight
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SectionHeight
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeader: UIView = UIView(frame: CGRectMake(0, 0, ScreenWidth, SectionHeight))
        sectionHeader.backgroundColor = UIColor.clearColor()

        let label: UILabel = UILabel(frame: CGRectMake(8, 12, ScreenWidth, SectionHeight))
        label.text = sectionTitles[section]
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Left
        sectionHeader.addSubview(label)
        
        return sectionHeader
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

