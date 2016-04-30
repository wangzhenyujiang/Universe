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
    
    var barChart: PNBarChart!
    private let chartViewModel: BarChartViewModel = BarChartViewModel()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setCustomTitle("Starry Sky")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
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
        barChart.showLabel = true
        barChart.isGradientShow = false
        barChart.showChartBorder = false
        barChart.showLevelLine = false
        
        barChart.chartMarginBottom = 25
        barChart.chartMarginTop = 0
        
        barChart.barBackgroundColor = UIColor.clearColor()
        barChart.backgroundColor = UIColor.clearColor()
        barChart.strokeColors = chartViewModel.barColors
        barChart.labelTextColor = UIColor.whiteColor()
        
        barChart.strokeChart()
        barChartContainter.addSubview(barChart)
    }
}

//MARK: IBAction

extension StatisticsViewController {
    
    @IBAction func dismissAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

