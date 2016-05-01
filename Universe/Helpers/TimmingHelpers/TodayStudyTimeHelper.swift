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
    
    private var resultTime: Double = 0
    var todaySudyTime: Double {
        get {
            cache.object(todayTimeKey, completion: { [weak self] (string: String?) in
                guard let strongSelf = self,  str = string, let result = Double(str) else { return }
                strongSelf.resultTime = result
            })
            return resultTime
        }
    }
}

//MARK: Public 

extension TodayStudyTimeHelper {
    func updateStudyTime(addTime time: Double) {
        let todayTotalTime = todaySudyTime + time
        print("updateStudyTime: \(todayTotalTime)")
        cache.add(todayTimeKey, object: "\(todayTotalTime)")
    }
}

//MARK: Private 

extension TodayStudyTimeHelper {
    
}