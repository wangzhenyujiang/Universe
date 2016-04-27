//
//  TimmingHelpers.swift
//  Universe
//
//  Created by 王振宇 on 16/4/24.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import Foundation

class EnterBackHelpers: NSObject {
    
    var helperCallback: (()-> ())?
    var shouldExcauteAction: Bool = true
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(redignActiveCallback), name: UIApplicationWillResignActiveNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}

//MARK: Public

extension EnterBackHelpers {
    func jumpToAppByScheme(app: Scheme) {
        if UIApplication.sharedApplication().canOpenURL(app.url) {
            UIApplication.sharedApplication().openURL(app.url)
            shouldExcauteAction = false
        }
    }
}

//MARK: Private 

extension EnterBackHelpers {
//    private func shouldExcauteAction() -> Bool {
//        
//        return true
//    }
}

//MARK: Notification

extension EnterBackHelpers {
    @objc private func redignActiveCallback() {
        if !shouldExcauteAction {
            shouldExcauteAction = true
            return
        }
        guard let callback = helperCallback else { return }
        callback()
    }
}