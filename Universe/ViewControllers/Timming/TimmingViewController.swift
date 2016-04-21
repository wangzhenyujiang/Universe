//
//  TimmingViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/29.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class TimmingViewController: BaseViewController, OwnsTopMenuViewType {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var giveUpButton: UIButton!
    @IBOutlet weak var topMenuView: TopMenuView!
    
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
        setupTopMenuView()
        backImageView.image = UIImage(named: timmingType.backImageName)
        
        tipsLabel.hidden = true
    }
    
}

//MARK: IBAction

extension TimmingViewController {
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func giveupActixon(sender: AnyObject) {
        showAlter()
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
    
    private func showAlter() {
        let alter = UIAlertController.self.init(title: nil, message: "Are You Sure To Give Up ?", preferredStyle: UIAlertControllerStyle.Alert)
        alter.addAction(UIAlertAction.self.init(title: "No", style: UIAlertActionStyle.Cancel, handler: nil))
        alter.addAction(UIAlertAction.self.init(title: "Yes", style: UIAlertActionStyle.Default, handler: { [weak self] (alterAction) in
            guard let strongSelf = self else { return }
            strongSelf.timerCountLabel.pause()

            let sb = UIStoryboard(name: "Main", bundle: nil)
            let controller: GiveUpViewController = sb.instantiateViewControllerWithIdentifier(String(GiveUpViewController)) as! GiveUpViewController
            controller.timming = strongSelf.timmingType
            strongSelf.navigationController?.pushViewController(controller, animated: true)
        }))
        presentViewController(alter, animated: true, completion: nil)
    }
}

//MARK: MZTimerLabelDelegate

extension TimmingViewController: MZTimerLabelDelegate {
    
    func timerLabel(timerLabel: MZTimerLabel!, finshedCountDownTimerWithTime countTime: NSTimeInterval) {
        let goldNum: Int = Int(timmingType.time) / Int(Half_Hour) * perHalfHourGold
        GoldAlterView.show(goldNum)
        User.shareInstance.addNum(goldNum)
        topMenuView.update()
        giveUpButton.enabled = false
    }
    
    func timerLabel(timerLabel: MZTimerLabel!, countingTo time: NSTimeInterval, timertype timerType: MZTimerLabelType) {
        if timerLabel.isEqual(self.timerCountLabel) {
            if Int(Int(time) / 300 ) % 6 == 0 {
                self.timerLabel.textColor = UIColor.redColor()
                tipsLabel.hidden = false
            }else {
                self.timerLabel.textColor = UIColor.whiteColor()
                tipsLabel.hidden = true
            }
        }
    }
}