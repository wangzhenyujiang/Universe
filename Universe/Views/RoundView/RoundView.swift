//
//  RoundView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/2.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

let Radius: CGFloat = 7

class RoundView: UIView {
    
    var dragCallback: ((RoundView -> Void))?
    
    private var control: UIControl!
    
    static func instance() -> RoundView {
        let aInstance = RoundView(frame: CGRectMake(0, 0, Radius * 2, Radius * 2));
        aInstance.layer .cornerRadius = Radius
        aInstance.backgroundColor = UIColor.clearColor()
        
        aInstance.layer.shadowRadius = 5.0
        aInstance.layer.shadowOpacity = 10.0
        aInstance.layer.shadowOffset = CGSizeMake(5, 5)
        aInstance.layer.shadowColor = UIColor.blackColor().CGColor
        
        aInstance.control = UIControl()
        aInstance.control.frame = aInstance.bounds
        aInstance.control.backgroundColor = UIColor.constellationColor()
        aInstance.control.layer.cornerRadius = Radius
        aInstance.control.layer.masksToBounds = true
        aInstance.control.addTarget(aInstance, action: "roundViewClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        aInstance.addSubview(aInstance.control)
        
        return aInstance
    }
    
    func changeToStarColor(change: Bool) {
        if change {
            control.backgroundColor = UIColor.starColor()
        }else {
            control.backgroundColor = UIColor.constellationColor()
        }
    }
    
    @objc private func roundViewClick() {
        guard let callBack = dragCallback else { return }
        callBack(self)
    }
    
}