//
//  ConstellationView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/5.
//  Copyright © 2016年 王振宇. All rights reserved.
//

let Height: CGFloat = 300.0

import UIKit

class ConstellationView: UIView {
    
    private var curve: UIBezierPath!
    private var shapeLayer: CAShapeLayer!
    
    var pointArray: [(CGFloat, CGFloat)] = [] {
        didSet {
            addStars()
            addLine()
        }
    }
    
    private var roundViewArr: [RoundView] = []

    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, Height, Height))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }

}

//MARK: Public 

extension ConstellationView {
    
}

//MARK: Private

extension ConstellationView {
    private func addStars() {
        roundViewArr =  pointArray.map() { (x, y) in
            let roundView = RoundView.instance()
            roundView.center = CGPointMake(x, y)
            roundView.dragCallback = { view in
            
            }
            addSubview(roundView)
            return roundView
        }
    }
    
    private func addLine() {
        let pointArr: [NSValue] = pointArray.map() { (x, y) in
            return NSValue(CGPoint: CGPointMake(x, y))
        }
        
        curve = UIBezierPath()
        curve.moveToPoint(roundViewArr.first!.center)
        curve.contractionFactor = 0
        curve.addBezierThroughPoints(pointArr)
        
        shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.magentaColor().CGColor
        shapeLayer.fillColor = nil
        shapeLayer.lineWidth = 3.0
        shapeLayer.path = curve.CGPath
        shapeLayer.lineCap = kCALineCapRound
        
        layer.addSublayer(shapeLayer)
    }
}

//MARK: Super

extension ConstellationView {
    override func willMoveToSuperview(newSuperview: UIView?) {
        guard let superView = newSuperview else { return }
        center = superView.center
    }
}
