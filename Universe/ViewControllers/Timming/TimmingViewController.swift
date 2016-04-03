//
//  TimmingViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/29.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class TimmingViewController: BaseViewController {
    @IBOutlet weak var timerLabel: MZTimerLabel!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupTimerLabel()
    }
    
}

//MARK: IBAction

extension TimmingViewController {
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func giveupAction(sender: AnyObject) {
        GoldAlterView.show(11)
    }
}

//MARK: Private Method

extension TimmingViewController {
    private func setupTimerLabel() {
        timerLabel.timeFormat = "mm : ss"
        timerLabel.timerType = MZTimerLabelTypeTimer
        timerLabel.setCountDownTime(1800)
        timerLabel.textColor = UIColor.whiteColor()
    }
}