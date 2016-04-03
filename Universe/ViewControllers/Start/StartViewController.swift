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
    @IBOutlet weak var imageView: UIImageView!
    
    var time: NSTimeInterval?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTimerLabel()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "startToTimingSegue" {
            let controller: TimmingViewController = segue.destinationViewController as! TimmingViewController
            controller.time = 10
        }
    }
}

//MARK: IBAction

extension StartViewController {
    
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func timeButtonAction(sender: AnyObject) {
        
    }
}

//MARK: Private 

extension StartViewController {
    private func setupTimerLabel() {
        timerLabel.timeFormat = "mm : ss"
        timerLabel.timerType = MZTimerLabelTypeTimer
        timerLabel.setCountDownTime(1800)
        timerLabel.textColor = UIColor.whiteColor()
    }
}
