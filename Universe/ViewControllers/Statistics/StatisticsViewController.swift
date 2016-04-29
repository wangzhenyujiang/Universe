//
//  StatisticsViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/11.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit
import Charts

// 统计 ViewController
class StatisticsViewController: BlackNavigationBarViewController  {

    @IBOutlet weak var chartView: LineChartView!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setCustomTitle("Starry Sky")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarLineChartView(chartView)
        setupData()
    }
}

//MARK: Private

extension StatisticsViewController {
    func setupBarLineChartView(chartView: LineChartView)
    {
        chartView.descriptionText = ""
        chartView.noDataTextDescription = "You need to provide data for the chart."
    
        chartView.drawGridBackgroundEnabled = false
    
        chartView.dragEnabled = false;
        chartView.setScaleEnabled(false)
        chartView.pinchZoomEnabled = false
        
        let xAxis: ChartXAxis = chartView.xAxis
        xAxis.labelPosition = .Bottom
    
        chartView.rightAxis.enabled = false;
    }
    
    private func setupData() {
        var entryArr: [BarChartDataEntry] = []
        for (index, val) in StudyedWeekTimeManager.shareInstance.weekEveryDayTimeArr().enumerate() {
            entryArr.append(BarChartDataEntry.init(value: Double(val), xIndex: index))
        }
        let set1: BarChartDataSet = BarChartDataSet.init(yVals: entryArr, label: nil)
        set1.barSpace = 0.35
        let dataSet = [set1]
        
        let data: BarChartData = BarChartData(xVals: Array(StudyedWeekTimeManager.shareInstance.weekDays()), dataSets: Array(dataSet))
        chartView.data = data
    }

}

//MARK: IBAction

extension StatisticsViewController {
    
    @IBAction func dismissAction(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

//MARK: ChartViewDelegate

extension StatisticsViewController: ChartViewDelegate {
    
}
