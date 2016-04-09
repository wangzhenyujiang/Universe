//
//  TimmingViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/29.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class TimmingViewController: BaseViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    
    var timmingType: TimeType!
    
    private var time: NSTimeInterval {
        return timmingType.time
    }
    
    private var timerCountLabel: MZTimerLabel!
    private var timmingView: ConstellationTimmingView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupTimerLabel()
        startTiming()
        
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
        timerCountLabel = MZTimerLabel(label: timerLabel, andTimerType: MZTimerLabelTypeTimer)
        timerCountLabel.setCountDownTime(time)
        timerCountLabel.delegate = self
        timerLabel.textColor = UIColor.whiteColor()
    }
    
    private func startTiming() {
        timmingView = ConstellationTimmingView(timmingType: timmingType)
        view.addSubview(timmingView)
        
        dispatch_after(1, dispatch_get_main_queue()) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.timerCountLabel.start()
            strongSelf.timmingView.startAnimated()
        }
    }
}

//MARK: MZTimerLabelDelegate

extension TimmingViewController: MZTimerLabelDelegate {
    
    func timerLabel(timerLabel: MZTimerLabel!, finshedCountDownTimerWithTime countTime: NSTimeInterval) {
        GoldAlterView.show(11)
        User.shareInstance.addNum(11)
    }
    
    func timerLabel(timerLabel: MZTimerLabel!, countingTo time: NSTimeInterval, timertype timerType: MZTimerLabelType) {
        if timerLabel.isEqual(self.timerCountLabel) {
            if Int(Int(time) / 300 ) % 6 == 0 {
                self.timerLabel.textColor = UIColor.redColor()
            }else {
                self.timerLabel.textColor = UIColor.whiteColor()
            }
        }
    }
}