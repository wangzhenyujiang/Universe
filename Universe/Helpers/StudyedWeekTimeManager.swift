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
    
    var name: String {
        switch self {
        case .Sunday:
            return "Sun"
        case .Monday:
            return "Mon"
        case .Tuesday:
            return "Tue"
        case .Wednesday:
            return "Wed"
        case .Thursday:
            return "Thu"
        case .Friday:
            return "Fri"
        case .Saturday:
            return "Sat"
        default:
            return "Invalid"
        }
    }
}

import UIKit
import SwiftDate

class StudyedWeekTimeManager: NSObject {
    
    static let shareInstance: StudyedWeekTimeManager = StudyedWeekTimeManager()
    private var weekStudyData: Dictionary<Day, Int> = [.Sunday: 10, .Monday: 5, .Tuesday: 4, .Wednesday: 2, .Thursday: 4, .Friday: 2, .Saturday: 6]
    
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
    
    func weekDays() -> [String] {
        return weekStudyData.keys.map() { key in
            return key.name
        }
    }
    
    func clear(afterDay day: Day) {
        for key in weekStudyData.keys {
            if !key.earlier(day) {
                weekStudyData.updateValue(0, forKey: key)
            }
        }
    }
}
