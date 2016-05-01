//
//  BarChartViewModel.swift
//  Universe
//
//  Created by 王振宇 on 16/4/30.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

private let SunDayBarColor = UIColor.colorWithRGBRule((0, 0.45, 0.55))
private let MondayBarColor = UIColor.colorWithRGBRule((0.02, 0.52, 0.63))
private let TuesDayBarColor = UIColor.colorWithRGBRule((0.02, 0.52, 0.63))
private let WedBarColor = UIColor.colorWithRGBRule((0, 0.45, 0.56))
private let ThudayBarColor = UIColor.colorWithRGBRule((0.23, 0.69, 0.82))
private let FridayBarColor = UIColor.colorWithRGBRule((0, 0.46, 0.56))
private let SatdayBarColor = UIColor.colorWithRGBRule((0.59, 0.92, 0.91))

class BarChartViewModel: NSObject {
    var xLbales: [String] =  {
        return StudyedWeekTimeManager.shareInstance.weekDays()
    }()
    
    var yValues: [Int] = {
        print(StudyedWeekTimeManager.shareInstance.thisWeekTimeArry())
        return StudyedWeekTimeManager.shareInstance.thisWeekTimeArry()
    }()
    
    let barColors: [UIColor] = [SunDayBarColor, MondayBarColor, TuesDayBarColor, WedBarColor, ThudayBarColor, FridayBarColor, SatdayBarColor]
}

private extension UIColor {
    static func colorWithRGBRule(rule: (CGFloat, CGFloat, CGFloat)) -> UIColor {
       return UIColor.init(red: rule.0, green: rule.1, blue: rule.2, alpha: 1)
    }
}

