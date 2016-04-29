//
//  StadiedWeekTimeManager.swift
//  Universe
//
//  Created by 王振宇 on 16/4/24.
//  Copyright © 2016年 王振宇. All rights reserved.
//

enum Day: Int {
    case InvalidDay = 0
    case Sunday = 1
    case Monday = 2
    case Tuesday = 3
    case Wednesday = 4
    case Thursday = 5
    case Friday = 6
    case Saturday = 7
    
    func earlier(day: Day) -> Bool {
        if rawValue <= day.rawValue {
            return true
        }
        return false
    }
}

import UIKit
import SwiftDate

class StudyedWeekTimeManager: NSObject {
    
    static let shareInstance: StudyedWeekTimeManager = StudyedWeekTimeManager()
    private var weekStudyData: Dictionary<Day, Int> = [.Sunday: 0, .Monday: 0, .Tuesday: 0, .Wednesday: 0, .Thursday: 0, .Friday: 0, .Saturday: 0]
    
}

//MARK: Public

extension StudyedWeekTimeManager {
    func updateTime(time: Int, inday day: Day = .InvalidDay) {
        var today = day
        if today == .InvalidDay {
            today = Day(rawValue: NSDate.today().weekday)!
        }
        weekStudyData[today] = time
    }
    
    func timeInDay(inDay day: Day) -> Int {
        return weekStudyData[day]!
    }
    
    func weekEveryDayTimeArr() -> [Int] {
        return Array(weekStudyData.values)
    }
    
    func clear(afterDay day: Day) {
        for key in weekStudyData.keys {
            if !key.earlier(day) {
                weekStudyData.updateValue(0, forKey: key)
            }
        }
    }
}
