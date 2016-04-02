//
//  TouchDebugView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/2.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class TouchDebugView: UIView {

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let point = touches.first!.locationInView(self)
        
        print("\(point)")
        
        super.touchesEnded(touches, withEvent: event)
    }
}
