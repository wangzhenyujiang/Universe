//
//  StatisticsViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/11.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit
import PNChart

// 统计 ViewController
class StatisticsViewController: BlackNavigationBarViewController  {
    
    @IBOutlet weak var barChartContainter: UIView!
    
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var studyTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UILabel!
    @IBOutlet weak var minsTimeLabel: UILabel!
    
    var barChart: PNBarChart!
    private let chartViewModel: BarChartViewModel = BarChartViewModel()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setCustomTitle("Starry Sky")
        minsTimeLabel.text = "\(Int(DayStudyTimeHelper.shareInstance.todaySudyTime)) mins"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
        commonSetup()
    }
}

//MARK: Private

extension StatisticsViewController {
    private func setupChartView() {
        barChart = PNBarChart.init(frame: CGRectMake(0, 0, ScreenWidth, 200))
        
        barChart.xLabels = chartViewModel.xLbales
        barChart.yValues = chartViewModel.yValues
        barChart.yLabels = chartViewModel.xLbales.map() { _ in
            return ""
        }
        
        barChart.hasLegend = false
        barChart.isShowNumbers = false
        barChart.showLabel = false
        barChart.isGradientShow = false
        barChart.showChartBorder = false
        barChart.showLevelLine = false
        
        barChart.chartMarginBottom = 25
        barChart.chartMarginTop = 0
        barChart.barRadius = 0
        
        
        barChart.barBackgroundColor = UIColor.clearColor()
        barChart.backgroundColor = UIColor.clearColor()
        barChart.strokeColors = chartViewModel.barColors
        barChart.labelTextColor = UIColor.whiteColor()
        
        barChart.strokeChart()
        barChartContainter.addSubview(barChart)
    }
    
    private func commonSetup() {
        todayDateLabel.text = "Today \(NSDate().monthEnglishPrefixName) \(NSDate().day)"
        durationTimeLabel.text = "\(NSDate().year) \(NSDate().startOf(NSCalendarUnit.Weekday).monthEnglishPrefixName) \(NSDate().firstDayOfWeek()!) - \(NSDate().endOf(NSCalendarUnit.Weekday).monthEnglishPrefixName) \(NSDate().lastDayOfWeek()!)"
        }
}

//MARK: IBAction

extension StatisticsViewController {
    
    @IBAction func dismissAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

