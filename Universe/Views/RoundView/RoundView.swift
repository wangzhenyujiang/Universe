//
//  RoundView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/2.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

let Radius: CGFloat = 10

class RoundView: UIView {
    
    var dragCallback: ((RoundView -> Void))?
    
    static func instance() -> RoundView {
        let aInstance = RoundView(frame: CGRectMake(0, 0, Radius * 2, Radius * 2));
        aInstance.layer .cornerRadius = Radius
        aInstance.backgroundColor = UIColor.whiteColor()
        
        let control = UIControl()
        control.frame = aInstance.bounds
        control.backgroundColor = aInstance.backgroundColor
        control.layer.cornerRadius = Radius
        control.layer.masksToBounds = true
        control.addTarget(aInstance, action: Selector("touchDragInside:event:"), forControlEvents: UIControlEvents.TouchDragInside)
        
        aInstance.addSubview(control)
        
        return aInstance
    }
    
    @objc private func touchDragInside(roundView: RoundView, event: UIEvent) {
        roundView.center = (event.allTouches()?.first?.locationInView(roundView.superview))!
        guard let callback = dragCallback else {
            return
        }
        callback(roundView)
    }
}