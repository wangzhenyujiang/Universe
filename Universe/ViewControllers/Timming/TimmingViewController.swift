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
    
    var tipsLabelShowing: Bool = true
    
    private var time: NSTimeInterval {
        return timmingType.time
    }
    
    private var timerCountLabel: MZTimerLabel!
    private var timmingView: ConstellationTimmingView!
    
    private let enterBackHelpers: EnterBackHelpers = EnterBackHelpers()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        backImageView.image = UIImage(named: timmingType.backImageName)
        showTipsLabel(false, animated: false)
        
        updateTipsLabel(0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimerLabel()
        setupTopMenuView()
        startTiming()
        
        enterBackHelpers.helperCallback = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.enterIntoBackground()
        }
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
    
    @IBAction func openYoudaoAppAction(sender: AnyObject) {
        enterBackHelpers.jumpToAppByScheme(Scheme.YouDaoDict)
    }
}


//MARK: Notification

extension TimmingViewController {
    private func enterIntoBackground() {
        stopCountTimming()
        jumpIntoFailController()
    }
}

//MARK: MZTimerLabelDelegate

extension TimmingViewController: MZTimerLabelDelegate {
    
    func timerLabel(timerLabel: MZTimerLabel!, finshedCountDownTimerWithTime countTime: NSTimeInterval) {
        let goldNum: Int = Int(timmingType.time) / Int(Half_Hour) * perHalfHourGold
        GoldAlterView.show(goldNum, okAction: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.jumpIntoNoteViewController()
        })
        User.shareInstance.addNum(goldNum)
        topMenuView.update()
        giveUpButton.enabled = false
        
        DayStudyTimeHelper.shareInstance.updateTodayStudyTime(addTime: timmingType.time)
    }
    
    func timerLabel(timerLabel: MZTimerLabel!, countingTo time: NSTimeInterval, timertype timerType: MZTimerLabelType) {
        
        updateTipsLabel(((Int(timmingType.time) - Int(time)) / 25) * 25)
        
        if timerLabel.isEqual(self.timerCountLabel) {
            if Int(Int(time) / 5 ) % 6 == 0 {
                self.timerLabel.textColor = UIColor.redColor()
                showTipsLabel(true)
            }else {
                self.timerLabel.textColor = UIColor.whiteColor()
                showTipsLabel(false)
            }
        }
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
    
    private func updateTipsLabel(time: Int) {
        tipsLabel.text = "You have studyed focused for \(time) minutes Let's take a break!"
    }
    
    private func startTiming() {
        timmingView = ConstellationTimmingView(timmingType: timmingType)
        view.addSubview(timmingView)
        
        topMenuView.menuAction = { [weak self] in       // 开始计时后 topMenu 点击事件变为询问用户是否放弃
            guard let stongSelf = self else { return }
            stongSelf.showAlter()
        }
        
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
            strongSelf.stopCountTimming()
            strongSelf.jumpIntoFailController()
            }))
        presentViewController(alter, animated: true, completion: nil)
    }
    
    private func jumpIntoFailController() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let controller: GiveUpViewController = sb.instantiateViewControllerWithIdentifier(String(GiveUpViewController)) as! GiveUpViewController
        controller.timming = timmingType
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func stopCountTimming() {
        timerCountLabel.pause()
    }
    
    private func jumpIntoNoteViewController() {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let controller: NoteViewController = sb.instantiateViewControllerWithIdentifier(String(NoteViewController)) as! NoteViewController
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func showTipsLabel(show: Bool, animated: Bool = true) {
        if tipsLabelShowing == show {
            return
        }
        tipsLabelShowing = show
        if !animated {
            tipsLabel.alpha = show ? 1 : 0
        }else {
            UIView.animateWithDuration(0.3, animations: {
                self.tipsLabel.alpha = show ? 1 : 0
            })
        }
    }
}
