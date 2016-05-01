//
//  EveryDayStudyTimeHelper.swift
//  Universe
//
//  Created by 王振宇 on 16/5/1.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation

private var todayTimeKey: String = {
    return "\(NSDate().year)\(NSDate().month)\(NSDate().day)"
}()

class DayStudyTimeHelper: NSObject {
    
    static let shareInstance: DayStudyTimeHelper = DayStudyTimeHelper()
    
    var todaySudyTime: Double {
        get {
            return timeForSomeDay(NSDate())
        }
    }
}

//MARK: Public 

extension DayStudyTimeHelper {
    func updateTodayStudyTime(addTime time: Double) {
        let todayTotalTime = todaySudyTime + time
        cache.add(todayTimeKey, object: "\(todayTotalTime)")
    }
    
    func timeForSomeDay(date: NSDate) -> Double {
        var result: Double = 0
        let lock: dispatch_semaphore_t = dispatch_semaphore_create(0)
        cache.object(timeKey(date), completion: { (string: String?) in
            guard let str = string, let tempTime = Double(str) else {
                dispatch_semaphore_signal(lock)
                return
            }
            result = tempTime
            //发送信号量，信号量 +1
            dispatch_semaphore_signal(lock)
        })
        //如果总信号为 0， 则进入等待状态，信号量大于 0 时，继续执行代码并将信号量 -1
        dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER)
        return result
    }
}

//MARK: Private

extension DayStudyTimeHelper {
    private func timeKey(date: NSDate) -> String{
        return "\(date.year)\(date.month)\(date.day)"
    }
}