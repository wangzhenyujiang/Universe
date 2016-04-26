//
//  StartViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/3/28.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit


class StartViewController: BaseViewController, OwnsTopMenuViewType, SetMenuListItemsAble {
    @IBOutlet weak var timerLabel: MZTimerLabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet private weak var tipsLabel: UILabel!
    
    @IBOutlet weak var topMenuView: TopMenuView!
    
    let timeSelectedView = ConstellationView()

    var starIndex: Int = 0 {
        didSet {
            switch starIndex {
            case 0:
                self.startButton.enabled = false
                return
            case 1:
                timmingType = .Half
            case 2:
                timmingType = .One
            case 3:
                timmingType = .OneHalf
            case 4:
                timmingType = .Two
            case 5:
                timmingType = .TwoHalf
            case 6:
                timmingType = .Three
            default:
                timmingType = .Half
            }
            self.startButton.enabled = true
            timerLabel.setCountDownTime(timmingType.time)
        }
        
        
    }
    
    private var timmingType: TimeType!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        resetUI()
        setupTopMenuView()
        setTopMenuItemList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonSetup()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "startToTimingSegue" {
            let controller: TimmingViewController = segue.destinationViewController as! TimmingViewController
            controller.timmingType = timmingType
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
        
    }
    
    private func setupTimeSelectedView() {
        timeSelectedView.pointArray = time_selected_point_arr
        timeSelectedView.constellationCallBack = {[weak self] view, index in
            guard let strongSelf = self else { return }
            strongSelf.starIndex = index
        }
        timeSelectedView.center = CGPointMake(view.center.x, view.center.y - 30)
        view.addSubview(timeSelectedView)
    }
    
    private func setupTimerLabel() {
        timerLabel.timerType = MZTimerLabelTypeTimer
        timerLabel.textColor = UIColor.whiteColor()
    }
    
    private func resetUI() {
        timerLabel.setCountDownTime(0)
        starIndex = 0
        timeSelectedView.reset()
    }
}
