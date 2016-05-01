//
//  EveryDayStudyTimeHelper.swift
//  Universe
//
//  Created by 王振宇 on 16/5/1.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation

private var todayTimeKey: String = {
    return "TodayTimeKey\(NSDate().year)\(NSDate().month)\(NSDate().day)"
}()

class TodayStudyTimeHelper: NSObject {
    
    static let shareInstance: TodayStudyTimeHelper = TodayStudyTimeHelper()
    
    var todaySudyTime: Double {
        get {
            var result: Double = 0
            let lock: dispatch_semaphore_t = dispatch_semaphore_create(0)
            cache.object(todayTimeKey, completion: { (string: String?) in
                print("todaySudyTime: \(string)")
                guard let str = string, let tempTime = Double(str) else { return }
                result = tempTime
                //发送信号量，信号量 +1
                dispatch_semaphore_signal(lock)
            })
            //如果总信号为 0， 则进入等待状态，信号量大于 0 时，继续执行代码并将信号量 -1
            dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER)
            return result
        }
    }
}

//MARK: Public 

extension TodayStudyTimeHelper {
    func updateStudyTime(addTime time: Double) {
        let todayTotalTime = todaySudyTime + time
        cache.add(todayTimeKey, object: "\(todayTotalTime)")
    }
}

//MARK: Private 

extension TodayStudyTimeHelper {
    
}