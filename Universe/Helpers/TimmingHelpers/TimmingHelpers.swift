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
    
    override init() {
        super.init()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(redignActiveCallback), name: UIApplicationWillResignActiveNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
}

//MARK: Private 

extension EnterBackHelpers {
    private func shouldExcauteAction() -> Bool {
        
        return true
    }
}

//MARK: Notification

extension EnterBackHelpers {
    @objc private func redignActiveCallback() {
        if !shouldExcauteAction() {
            return
        }
        
        guard let callback = helperCallback else { return }
        callback()
    }
}