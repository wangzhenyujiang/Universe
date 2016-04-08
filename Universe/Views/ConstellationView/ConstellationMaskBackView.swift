//
//  ConstellationMaskBackView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/8.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

private let LineWidth: CGFloat = 18.0

class ConstellationMaskBackView: UIView {
    var timmingType: TimeType! {
        didSet {
            setupMaskLayer()
        }
    }
    
    var process: CGFloat = 0.6 {
        didSet {
            if process < 0 {
                process = 0
            }else if process > 1 {
                process = 1
            }
            maskLayer.strokeEnd = process
        }
    }
    
    private var cruve: UIBezierPath!
    private var maskLayer: CAShapeLayer!
    
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
        maskLayer.strokeEnd = process
        
        layer.mask = maskLayer
    }
}
