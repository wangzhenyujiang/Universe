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
    
    static func instance() -> RoundView {
        let aInstance = RoundView(frame: CGRectMake(0, 0, Radius * 2, Radius * 2));
        aInstance.layer .cornerRadius = Radius
        aInstance.backgroundColor = UIColor.clearColor()
        
        aInstance.layer.shadowRadius = 5.0
        aInstance.layer.shadowOpacity = 10.0
        aInstance.layer.shadowOffset = CGSizeMake(5, 5)
        aInstance.layer.shadowColor = UIColor.blackColor().CGColor
        
        let control = UIControl()
        control.frame = aInstance.bounds
        control.backgroundColor = UIColor.constellationColor()
        control.layer.cornerRadius = Radius
        control.layer.masksToBounds = true
        control.addTarget(aInstance, action: "roundViewClick", forControlEvents: UIControlEvents.TouchUpInside)
        
        aInstance.addSubview(control)
        
        return aInstance
    }
    
    @objc private func roundViewClick() {
        guard let callBack = dragCallback else { return }
        callBack(self)
    }
    
}