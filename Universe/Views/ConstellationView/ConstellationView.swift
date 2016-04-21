//
//  ConstellationView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/5.
//  Copyright © 2016年 王振宇. All rights reserved.
//

let Height: CGFloat = 300.0
private let LineWidth: CGFloat = 5.0

import UIKit

class ConstellationView: UIView {
    
    private var curve: UIBezierPath!
    private var shapeLayer: CAShapeLayer!
    
    var constellationCallBack: ((RoundView, Int) -> Void)?
    
    var pointArray: [ViewPoint] = [] {
        didSet {
            addStars()
            addLine()
        }
    }
    
    var starIndex: Int = 0{
        didSet {
            guard let callback = constellationCallBack else { return }
            callback(roundViewArr[starIndex], starIndex)
            click()
        }
    }
    
    private var roundViewArr: [RoundView] = []

    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, Height, Height))
        backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }

}

//AMRK: Public 

extension ConstellationView {
    
}

//MARK: Private

extension ConstellationView {
    private func addStars() {
        for (index, viewPoint) in pointArray.enumerate() {
            let roundView = RoundView.instance(viewPoint)
            roundView.center = CGPointMake(viewPoint.point.0, viewPoint.point.1)
            roundView.dragCallback = {[weak self] (view: RoundView) in
                guard let strongSelf = self else { return }
                strongSelf.starIndex = index
                
            }
            roundViewArr.append(roundView)
            addSubview(roundView)
        }
    }
    
    private func addLine() {
        let pointArr: [NSValue] = pointArray.filter(){viewPoint in
            if viewPoint.sizeType == .Big {
                return true
            }else {
               return false
            }
            }.map() { viewPoint in
            return NSValue(CGPoint: CGPointMake(viewPoint.point.0, viewPoint.point.1))
        }
        
        curve = UIBezierPath()
        curve.moveToPoint(roundViewArr.first!.center)
        curve.contractionFactor = 0
        curve.addBezierThroughPoints(pointArr)
        
        shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.constellationColor().CGColor
        shapeLayer.fillColor = nil
        shapeLayer.lineWidth = LineWidth
        shapeLayer.path = curve.CGPath
        shapeLayer.lineCap = kCALineCapRound
        
        layer.insertSublayer(shapeLayer, atIndex: 0)
    }
    
    private func click() {
        for (index, view) in roundViewArr.enumerate() where index <= starIndex {
            view.changeToStarColor(true)
        }
        
        for (index, view) in roundViewArr.enumerate() where index > starIndex {
            view.changeToStarColor(false)
        }
    }
}

//MARK: Super

extension ConstellationView {
    override func willMoveToSuperview(newSuperview: UIView?) {
        guard let superView = newSuperview else { return }
        center = superView.center
    }
}
