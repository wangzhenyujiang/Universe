//
//  ConstellationMaskBackView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/8.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

private let LineWidth: CGFloat = 20.0

class ConstellationMaskBackView: UIView {
    var timmingType: TimeType! {
        didSet {
            setupMaskLayer()
        }
    }
    
    private var cruve: UIBezierPath!
    private var maskLayer: CAShapeLayer!
    private var animation: CABasicAnimation!
    private var animating: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, Height, Height))
        backgroundColor = UIColor.starColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
}

//MARK: Public

extension ConstellationMaskBackView {
    func startTimeAnimated() {
        animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = timmingType.time
        animation.fromValue = 0
        animation.toValue = 1
        animation.fillMode = kCAFillModeBoth
        animation.removedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        maskLayer.addAnimation(animation, forKey: "")
    }
    
    func pause() {
        if animating {
            animation.speed = 0
        }else {
            animation.speed = 1
        }
    }
    
}

//MARK: Private

extension ConstellationMaskBackView {
    private func setupMaskLayer() {
        let pointArr: [CGPoint] = timmingType.corner_arr.map { (x, y) in
            return CGPointMake(x, y)
        }
        
        cruve = UIBezierPath()
        cruve.moveToPoint(pointArr.first!)
        cruve.contractionFactor = 0
        cruve.addBezierThroughPoints(pointArr.map() { point in
            return NSValue(CGPoint: point)
        })
        
        
        maskLayer = CAShapeLayer()
        maskLayer.strokeColor = UIColor.starColor().CGColor
        maskLayer.fillColor = nil
        maskLayer.lineWidth = LineWidth
        maskLayer.path = cruve.CGPath
        maskLayer.lineCap = kCALineCapRound
        maskLayer.strokeEnd = 0
        
        layer.mask = maskLayer
    }
}
