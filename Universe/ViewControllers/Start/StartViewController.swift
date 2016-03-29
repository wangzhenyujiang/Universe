//
//  StartViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/28.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class StartViewController: BaseViewController {
    @IBOutlet weak var timerLabel: MZTimerLabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupTimerLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

//MARK: IBAction

extension StartViewController {
    
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func timeButtonAction(sender: AnyObject) {
        timerLabel.start()
    }
}

extension StartViewController: MZTimerLabelDelegate {
    
    func timerLabel(timerLabel: MZTimerLabel!, finshedCountDownTimerWithTime countTime: NSTimeInterval) {
        
    }
    
    func timerLabel(timerLabel: MZTimerLabel!, countingTo time: NSTimeInterval, timertype timerType: MZTimerLabelType) {
        
    }
    
    private func setupTimerLabel() {
        timerLabel.timeFormat = "mm:ss"
        timerLabel.timerType = MZTimerLabelTypeTimer
        timerLabel.setCountDownTime(1800)
        timerLabel.textColor = UIColor.whiteColor()
//        timerLabel.font = UIFont.timeLabelFont()
    }
}
