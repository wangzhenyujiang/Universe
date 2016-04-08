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
    @IBOutlet weak var backImageView: UIImageView!
    
    var time: NSTimeInterval!
    
    private var timmingView: ConstellationTimmingView!
    private var timmingType: TimeType {
        
        return .TwoHalf
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupTimerLabel()
        startTiming()
        
        timmingView = ConstellationTimmingView(timmingType: timmingType)
        view.addSubview(timmingView)
        
        backImageView.image = UIImage(named: timmingType.backImageName)
    }
    
}

//MARK: IBAction

extension TimmingViewController {
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func giveupActixon(sender: AnyObject) {
        
    }
}

//MARK: Private Method

extension TimmingViewController {
    private func setupTimerLabel() {
        timerLabel.timeFormat = "mm : ss"
        timerLabel.timerType = MZTimerLabelTypeTimer
        timerLabel.setCountDownTime(time)
        timerLabel.delegate = self
        timerLabel.textColor = UIColor.whiteColor()
    }
    
    private func startTiming() {
        timerLabel.start()
    }
}

//MARK: MZTimerLabelDelegate

extension TimmingViewController: MZTimerLabelDelegate {
    
    func timerLabel(timerLabel: MZTimerLabel!, finshedCountDownTimerWithTime countTime: NSTimeInterval) {
        GoldAlterView.show(11)
    }
    
    func timerLabel(timerLabel: MZTimerLabel!, countingTo time: NSTimeInterval, timertype timerType: MZTimerLabelType) {
        
    }
}