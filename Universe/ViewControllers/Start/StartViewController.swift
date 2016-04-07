//
//  StartViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/28.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

let Half_Hour: NSTimeInterval = 1800

class StartViewController: BaseViewController {
    @IBOutlet weak var timerLabel: MZTimerLabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    let timeSelectedView = ConstellationView()
    var time: NSTimeInterval!

    var starIndex: Int = 0 {
        didSet {
            if starIndex == 0 {
                startButton.enabled = false
                return
            }
            startButton.enabled = true
            time = Double(starIndex) * Half_Hour
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonSetup()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "startToTimingSegue" {
            let controller: TimmingViewController = segue.destinationViewController as! TimmingViewController
            controller.time = time
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
    
    private func commonSetup() {
        setupTimerLabel()
        setupTimeSelectedView()
        startButton.enabled = false
        
        
        let maskView = LCStarView()
        maskView.frame = CGRectMake(0, 0, 300, 300)
        maskView.center = view.center
        maskView.fillColor = UIColor.starColor()
        maskView.maskImage = UIImage(named: "hour_half_fill")
        
        view.addSubview(maskView)
        
    }
    
    private func setupTimeSelectedView() {
        timeSelectedView.pointArray = hour_two_point_arr
        timeSelectedView.constellationCallBack = {[weak self] view, index in
            guard let strongSelf = self else { return }
            strongSelf.starIndex = index
        }
        view.addSubview(timeSelectedView)
    }
    
    private func setupTimerLabel() {
        timerLabel.timeFormat = "mm : ss"
        timerLabel.timerType = MZTimerLabelTypeTimer
        timerLabel.setCountDownTime(1800)
        timerLabel.textColor = UIColor.whiteColor()
    }
}
