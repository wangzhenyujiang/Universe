//
//  StatisticsViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/11.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit
import Charts

class StatisticsViewController: UIViewController  {

    @IBOutlet weak var chartView: LineChartView!
    
    let weekTimeArray: [Int] = [2 ,4, 5, 6, 8, 4, 7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChartView()
        setupData()
    }
}

//MARK: Private

extension StatisticsViewController {
    private func setupChartView() {
        
        chartView.setViewPortOffsets(left: 30, top: 20, right: 2, bottom: 0)
        chartView.dragEnabled = false
        chartView.setScaleEnabled(false)
        
        chartView.pinchZoomEnabled = false
        chartView.drawGridBackgroundEnabled = false
        
        chartView.xAxis.enabled = false
        chartView.descriptionText = ""
        
        let yAxis = chartView.leftAxis
        yAxis.labelFont = UIFont(name: "HelveticaNeue-Light", size: 12)!
        yAxis.setLabelCount(5, force: false)
        yAxis.labelTextColor = UIColor.blackColor()
        yAxis.drawGridLinesEnabled = false
        yAxis.axisLineColor = UIColor.greenColor()
        
        chartView.rightAxis.enabled = false
        chartView.legend.enabled = false
        
        chartView.backgroundColor = UIColor.grayColor()
        
        chartView.animate(xAxisDuration: 0, yAxisDuration: 0)
    }
    
    private func setupData() {
        
        let xVal: [String] = weekTimeArray.map() { val in
            return "\(val)"
        }
        
        var entryArr: [ChartDataEntry] = []
        for (index, val) in weekTimeArray.enumerate() {
            entryArr.append(ChartDataEntry(value: Double(val), xIndex: index))
        }
        
        let set: LineChartDataSet = LineChartDataSet(yVals: entryArr, label: "DataSet")
        set.drawCubicEnabled = false
        set.cubicIntensity = 0.2
        set.drawCirclesEnabled = false
        set.drawValuesEnabled = true
        set.drawCirclesEnabled = true
        set.lineWidth = 1.8
        set.circleRadius = 4.0
        set.setCircleColor(UIColor.yellowColor())
        set.highlightColor = UIColor.blueColor()
        set.setColor(UIColor.orangeColor())
        set.fillColor = UIColor.purpleColor()
        set.fillAlpha = 1;
        set.drawHorizontalHighlightIndicatorEnabled = false
        set.drawFilledEnabled = true
        
        let data = LineChartData(xVals: xVal, dataSet: set)
        data.setValueFont(UIFont(name: "HelveticaNeue-Light", size: 9)!)
        data.setValueTextColor(UIColor.blackColor())
        data.setDrawValues(true)
        
        chartView.data = data
    }
}

//MARK: ChartViewDelegate

extension StatisticsViewController: ChartViewDelegate {
    
}
